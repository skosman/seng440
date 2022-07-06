// Basic RSA example that encrypts and decrypts a plaintext value
// All values are currently hard coded based on example in slides

#include <stdio.h>
#include <stdint.h>
#include <math.h>

int montgomery_modular_multiplication( int X, int Y, int M, int m) {
  int i;
  int T;
  int Xi, T0, Y0;
  int eta;
  int Xi_Y;
  int eta_M;

  T = 0;
  Y0 = Y & 1;
  for( i=0; i<m; i++) {
    Xi = (X >> i) & 1;
    //printf( "Xi = %i\n", Xi);
    T0 = T & 1;
    //printf( "T0 = %i\n", T0);
    eta = T0 ^ (Xi & Y0);
    //printf( "eta = %i\n", eta);
    Xi_Y = Xi ? Y : 0;
    //printf( "Xi_Y = %i\n", Xi_Y);
    eta_M = eta ? M : 0;
    //printf( "eta_M = %i\n", eta_M);
    T = (T + Xi_Y + eta_M) >> 1;
    //printf( "T = %i\n\n", T);
  }
  while ( T >= M)
    T -= M;

  return T;
}

int convert_int_to_binary(uint64_t num, int* bin) {
  unsigned int mask = 1;
  int i = 0;
  while (num > 0)
  {
    bin[i] =  num % 2;
    num >>= 1; 
    ++i;
  }

  return i;
}

// Function adapted from: https://github.com/PhilCR/Cryptography-Square-and-Multiply-modular-Exponentiation
uint64_t multiple_and_square(uint64_t X,  uint64_t E,  uint64_t M){
  uint64_t p = X;
  int bin[64];
	
  int length = convert_int_to_binary(E, bin);

  int i = length - 1;

  while( i > 0 )
  {
		p = (p * p) % M;
    // p = montgomery_modular_multiplication(p, p, M, 12); <- Doesn't seem to work 

    if( bin[--i] == 1 ){
			p = (p * X) % M;
      // p = montgomery_modular_multiplication(p, X, M, 12); <- Doesn't seem to work 

		}
	}
  return p;
}


int encrypt_plaintext(int T, int E, int N) 
{
    // Encrypt plaintext and compute the cyphertext
    return multiple_and_square(T, E, N);
}

int decrypt_cyphertext(int C, int D, int N) 
{
    // Decrypt cyphertext and compute plaintext
    return multiple_and_square(C, D, N);
}

int main() 
{
    uint64_t P, Q, N, E, D;
    uint64_t input_plaintext, cyphertext, decrypted_plaintext;

    P = 61;
    Q = 53;

    N = P*Q;

    E = 17;

    input_plaintext = 123;

    // Calculate private exponent
    D = 2753;

    // Encrypt plaintext
    cyphertext = encrypt_plaintext(input_plaintext, E, N);
    // Decrypt cyphertext
    decrypted_plaintext = decrypt_cyphertext(cyphertext, D, N);

    printf("Cypher text is: %llu\n", cyphertext);
    printf("Decrypted text is: %llu\n", decrypted_plaintext);

}