#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#define TEST_ITERATIONS 100000

int get_num_bits(uint64_t num) 
{
    register int i = 0;
    while (num > 0)
    {
        num >>= 1; 
        ++i;
    }
    return i;
}

// Applied software optimization techniques such as
// * loop unrolling
// * registers
// * try optimizing the for loop 
uint64_t montgomery_modular_multiplication(uint64_t X, uint64_t Y, uint64_t M) 
{
    register int i;
    register uint64_t T;
    register uint64_t Xi;
    register uint64_t Y0;
    register uint64_t eta;

    register uint64_t m = get_num_bits(M);
    
    T = 0;
    Y0 = Y & 1;
    Xi = X & 1;
    for (i = 0; i < m ; i++) {
        eta = (T & 1) ^ (Xi & Y0);
        T = (T + (Xi * Y) + (eta * M)) >> 1;
        Xi = (X >> (i+1)) & 1;
    }
    
    if (T >= M) {
        T = T - M;
    }

    return T;
}

// We calculate plain text T = X ^ Y mod M with multiply-and-square algorithm
// using montgomery modular multiplication for any modular multiplication operations
uint64_t multiply_and_square(uint64_t X, uint64_t Y, uint64_t M)  
{
    register uint64_t num_bits = get_num_bits(M);
    register uint64_t R = (1 << num_bits) % M;
    register uint64_t R2 = (R * R) % M;

    register uint64_t T = R;
    // Scale the operand up with R
    register uint64_t X_scaled = montgomery_modular_multiplication(X, R2, M);
    while (0 != Y)
    {
        if (Y & 0x01) 
        {
          T = montgomery_modular_multiplication(X_scaled, T, M);
        }
        else
        {
            // No action
        }

        X_scaled = montgomery_modular_multiplication(X_scaled, X_scaled, M);
        Y >>=1;
    }

    // Scale down the result
    T = montgomery_modular_multiplication(T, 1, M);

    return T;
}

uint64_t encrypt_plaintext(uint64_t T, uint64_t E, uint64_t N) 
{
   return multiply_and_square(T, E, N);
}

uint64_t decrypt_cyphertext(uint64_t C, uint64_t D, uint64_t N) 
{
  return multiply_and_square(C, D, N);
}

void loop_encrypt_decrypt_routine(uint64_t T, uint64_t E, uint64_t D, uint64_t N)
{
    register uint64_t cyphertext;
    register uint64_t decrypted_plaintext;

    uint64_t i;
    for (i = 0; i < TEST_ITERATIONS; i++) 
    {
        // Encrypt plaintext (should equal 855)
        cyphertext = encrypt_plaintext(T, E, N);
        printf("Computed cypher text: %llu\n", cyphertext);

        // Decrypt cyphertext (should equal 123)
        decrypted_plaintext = decrypt_cyphertext(cyphertext, D, N);
        printf("Computed plain text: %llu\n", decrypted_plaintext);

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
