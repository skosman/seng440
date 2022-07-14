#include <stdio.h>
#include <stdint.h>
#include <assert.h>

uint64_t get_num_bits(uint64_t num) 
{
    register uint64_t i = 0;
    while (num > 0)
    {
        num >>= 1; 
        ++i;
    }
    return i;
}

// TODO? Update to use our own version of mmm
uint64_t montgomery_modular_multiplication(uint64_t X, uint64_t Y, uint64_t M) 
{
    register uint64_t i;
    register uint64_t T;
    register uint64_t Xi, T0, Y0;
    register uint64_t eta;
    register uint64_t Xi_Y;
    register uint64_t eta_M;

    register uint64_t temp_M = M;
    register uint64_t m = get_num_bits(M);
    
    T = 0;
    Y0 = Y & 1;
    for( i=0; i<m; i++) 
    {
        Xi = (X >> i) & 1;
        T0 = T & 1;
        eta = T0 ^ (Xi & Y0);
        Xi_Y = Xi ? Y : 0;
        eta_M = eta ? M : 0;
        T = (T + Xi_Y + eta_M) >> 1;
    }
    
    while ( T >= M)
        T -= M;

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
    while (Y != 0)
    {
        if (Y & 0x01) {
          T = montgomery_modular_multiplication(X_scaled, T, M);
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


int main() 
{
    register uint64_t P, Q, N, E, D;
    register uint64_t input_plaintext, cyphertext, decrypted_plaintext;

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


    // Encrypt plaintext (should equal 855)
    cyphertext = encrypt_plaintext(input_plaintext, E, N);
    printf("Computed cypher text: %llu\n", cyphertext);

    // Decrypt cyphertext (should equal 123)
    decrypted_plaintext = decrypt_cyphertext(cyphertext, D, N);
    printf("Computed plain text: %llu\n", decrypted_plaintext);

    // Final assertions that calculations were correct
    assert(cyphertext == 855);
    assert(decrypted_plaintext == 123);

    return 0;
}