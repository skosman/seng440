#include <stdio.h>
#include <stdint.h>
#include <math.h>

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

    // Compute the modular multiplicative inverse of e mod lcm(p-1, q-1)
    // i.e. Compute D such that D*E = 1 mod [(P-1)(Q-1)]
    // Equivalent to finding X such that:
    // D = (X(P-1)(Q-1) + 1) / E is an integer
    /*uint64_t x = 1;
    float d = 0;
    while (1)
    {
        printf("P-1:%lu\n", P-1);
        printf("Q-1:%lu\n", Q-1);
        printf("x: %lu\n", x);
        printf("E: %lu\n", E);
        d = ((x * (P-1) * (Q-1)) + 1) / E;
        printf("d: %f\n", d);
        if (floor(d) == d) 
        {
            break;
        }
        x++;
    }
    printf("X: %lu\n", x);
    return (uint64_t) d;*/
}

int encrypt_plaintext(int T, int E, int N) 
{
    // Encrypt plaintext and compute the cyphertext
    return -1;
}

int decrypt_cyphertext(int C, int D, int N) 
{
    // Decrypt cyphertext and compute plaintext
    return -1;
}

int main() 
{
    uint64_t P, Q, N, E, D;
    int input_plaintext, cyphertext, decrypted_plaintext;

    // Generated primes from https://bigprimes.org/. 
    // LCM of these numbers: lcm(70878, 48808) = 1,729,706,712
    P = 70879;
    Q = 48809;

    N = P*Q;

    // 17 is a coprime to 3,459,413,424, for example. Found from https://www.mathsisfun.com/numbers/coprime-calculator.html 
    E = 17;

    input_plaintext = 123;

    // Calculate private exponent
    D = compute_private_exponent(E, P, Q);
    

    printf("P: %lu, Q: %lu, N=P*Q: %lu\n", P, Q, N);
    printf("P-1: %lu, Q-1: %lu, (P-1)(Q-1): %lu\n", P-1, Q-1, (P-1)*(Q-1));
    printf("E (coprime to (P-1)(Q-1)): %lu\n", E);
    printf("Private exponent D: %lu\n", D);
    printf("D*E = 1 mod [(P-1)(Q-1)] is satisfied\n");

    // Encrypt plaintext
    cyphertext = encrypt_plaintext(input_plaintext, E, N);

    // Decrypt cyphertext
    decrypted_plaintext = decrypt_cyphertext(cyphertext, D, N);
}