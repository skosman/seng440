#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#define TEST_ITERATIONS 10000000
#define multiply_and_divide_by_modulus(x,y,z) ((x)*(y)) % (z)

// In this example, we use the following optimization techniques:
//   1. Loop unrolling in modular exponentiation routine
//   2. Caching using register keyword
//   3. Remove function calls by defining macros

uint64_t calculate_modular_exponentiation(uint64_t base, uint64_t exponent, uint64_t modulus)
{
    // We calculate modular exponentiation with multiply-and-square algorithm
    register uint64_t R = 1;
    while (0 != exponent)
    {
        if (0x01 & exponent)
        {
            R = multiply_and_divide_by_modulus(R, base, modulus);
        }
        else 
        {
            // No action
        }

        base = multiply_and_divide_by_modulus(base, base, modulus);
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

void loop_encrypt_decrypt_routine(uint64_t T, uint64_t E, uint64_t D, uint64_t N)
{
    register uint64_t cyphertext; 
    register uint64_t decrypted_plaintext;

    register uint64_t i;
    for (i = TEST_ITERATIONS; i != 0; i--) 
    {
        // Encrypt plaintext (should equal 855)
        cyphertext = encrypt_plaintext(T, E, N);
        //printf("Computed cypher text: %llu\n", cyphertext);

        // Decrypt cyphertext (should equal 123)
        decrypted_plaintext = decrypt_cyphertext(cyphertext, D, N);
        //printf("Computed plain text: %llu\n", decrypted_plaintext);

        // Final assertions that calculations were correct
        assert(855 == cyphertext);
        assert(123 == decrypted_plaintext);
    }
}

int main() 
{
    register uint64_t P; 
    register uint64_t Q;
    register uint64_t N;
    register uint64_t E;
    register uint64_t D;
    register uint64_t input_plaintext;
    register uint64_t cyphertext;
    register uint64_t decrypted_plaintext;
    // Prime numbers used to generate N, and private and public key. 
    P = 61;
    Q = 53;

    N = P*Q;

    // 17 is a coprime to lcm(P-1, Q-1)
    E = 17;

    // Input to be encrypted.
    input_plaintext = 123;

    // Set private exponent beforehand to a known value.
    D = 2753;

    printf("P: %llu, Q: %llu, N=P*Q: %llu\n", P, Q, N);
    printf("P-1: %llu, Q-1: %llu, (P-1)(Q-1): %llu\n", P-1, Q-1, (P-1)*(Q-1));
    printf("E (coprime to (P-1)(Q-1)): %llu\n", E);
    printf("Private exponent D: %llu\n", D);
    printf("D*E = 1 mod [(P-1)(Q-1)] is satisfied\n\n");

    printf("The public key is (N,E) = (%llu,%llu)\n", N, E);
    printf("The private key is (N,D) = (%llu,%llu)\n", N, D);

    // Run the encryption and decryption cycle multiple times to capture more accurate results
    loop_encrypt_decrypt_routine(input_plaintext, E, D, N);

    return 0;
}