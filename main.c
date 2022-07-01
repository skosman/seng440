#include <stdio.h>
#include <stdint.h>

int compute_private_exponent(int E, int P, int Q) {
    // Compute the modular multiplicative inverse of e mod lcm(p-1, q-1)
    // i.e. Compute D such that DE = 1 mod [(P-1)(Q-1)]
    return 2753;
}

int encrypt_plaintext(int T, int E, int N) {
    // Encrypt plaintext and compute the cyphertext
    return -1;
}

int decrypt_cyphertext(int C, int D, int N) {
    // Decrypt cyphertext and compute plaintext
    return -1;
}

int main() {
    uint64_t P, Q, N, E, D;
    int input_plaintext, cyphertext, decrypted_plaintext;

    P = 61;
    Q = 53;
    N = P*Q;
    E = 17;

    input_plaintext = 123;

    // Calculate private exponent
    D = compute_private_exponent(E, P, Q);

    // Encrypt plaintext
    cyphertext = encrypt_plaintext(input_plaintext, E, N);

    // Decrypt cyphertext
    decrypted_plaintext = decrypt_cyphertext(cyphertext, D, N);
}