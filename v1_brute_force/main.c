#include <stdio.h>
#include <stdint.h>
#include <assert.h>

uint64_t compute_private_exponent(uint64_t E, uint64_t P, uint64_t Q) 
{
    // Calcuate D such that:
    // D*E = 1 mod [(P-1)(Q-1)]
    uint64_t M = (P-1) * (Q-1);
    for (int D = 1; D < M; D++)
    {
        if (((E % M) * (D % M)) % M == 1 )
        {
            return D;
        }
    }
}

uint64_t calculate_modular_exponentiation(uint64_t base, uint64_t exponent, uint64_t modulus)
{
    // We calculate modular exponentiation with multiply-and-square algorithm
    uint64_t R = 1;
    while (exponent != 0)
    {
        if (exponent & 0x01)
        {
            R = (R * base) % modulus;
        }

        base = (base * base) % modulus;
        exponent >>=1;
    }
    return R;
}

uint64_t encrypt_plaintext(uint64_t T, uint64_t E, uint64_t N) 
{
    // Encrypt plaintext and compute the cyphertext
    return calculate_modular_exponentiation(T, E, N);
}

uint64_t decrypt_cyphertext(uint64_t C, uint64_t D, uint64_t N) 
{
    // Decrypt cyphertext and compute plaintext
    return calculate_modular_exponentiation(C, D, N);
}

int main() 
{
    uint64_t P, Q, N, E, D;
    uint64_t input_plaintext, cyphertext, decrypted_plaintext;

    // Generated primes from https://bigprimes.org/. 
    // LCM of these numbers: lcm(70878, 48808) = 1,729,706,712
    //P = 70879;
    //Q = 48809;
    P = 61;
    Q = 53;

    N = P*Q;

    // 17 is a coprime to 3,459,413,424, for example. Found from https://www.mathsisfun.com/numbers/coprime-calculator.html 
    E = 17;

    // We will convert this into a 1024-bit input once we have structure setup.
    input_plaintext = 123;

    // Calculate private exponent
    D = compute_private_exponent(E, P, Q);
    

    printf("P: %lu, Q: %lu, N=P*Q: %lu\n", P, Q, N);
    printf("P-1: %lu, Q-1: %lu, (P-1)(Q-1): %lu\n", P-1, Q-1, (P-1)*(Q-1));
    printf("E (coprime to (P-1)(Q-1)): %lu\n", E);
    printf("Private exponent D: %lu\n", D);
    printf("D*E = 1 mod [(P-1)(Q-1)] is satisfied\n\n");

    printf("The public key is (N,E) = (%lu,%lu)\n", N, E);
    printf("The private key is (N,D) = (%lu,%lu)\n", N, D);

    // Encrypt plaintext (should equal 855)
    cyphertext = encrypt_plaintext(input_plaintext, E, N);
    printf("Computed cypher text: %lu\n", cyphertext);

    // Decrypt cyphertext (should equal 123)
    decrypted_plaintext = decrypt_cyphertext(cyphertext, D, N);
    printf("Computed plain text: %lu\n", decrypted_plaintext);

    // Final assertions that calculations were correct
    assert(cyphertext == 855);
    assert(decrypted_plaintext == 123);

    return 0;
}