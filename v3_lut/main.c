#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#define MAX_LUT_POWER 12 // corresponds to 2^12 = 4096

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

uint64_t compute_modular_exponentiation_with_lut(uint64_t *pow_of_two, uint64_t pow_of_two_len, uint64_t *lut, uint64_t lut_len, uint64_t modulus)
{
    uint64_t result = lut[pow_of_two[0]];
    for (int i=1; i < pow_of_two_len; i++)
    {
        result = (result * lut[pow_of_two[i]]) % modulus;
    }
    return result;    
}

uint64_t encrypt_plaintext(uint64_t *pow_of_two, uint64_t pow_of_two_len, uint64_t *lut, uint64_t lut_len, uint64_t modulus) 
{
    // Encrypt plaintext and compute the cyphertext
    // We calculate cypher text C = T^E mod N with the help of the lookup table.
    return compute_modular_exponentiation_with_lut(pow_of_two, pow_of_two_len, lut, lut_len, modulus);
}

uint64_t decrypt_cyphertext(uint64_t *pow_of_two, uint64_t pow_of_two_len, uint64_t *lut, uint64_t lut_len, uint64_t modulus)
{
    // Decrypt cyphertext and compute the plaintext
    // We calculate plain text P = C^D mod N with the help of the lookup table.
    return compute_modular_exponentiation_with_lut(pow_of_two, pow_of_two_len, lut, lut_len, modulus);
}

uint64_t compute_powers_of_two(uint64_t num, uint64_t *table, uint64_t table_len)
{
    uint64_t i, j, temp;
    j = 0;
    temp = num;
    for (i=0; (1<<i) <= num; i++)
    {
        if (temp & 1) 
        {
            table[j++] = i;
        }
        temp >>= 1;
    }
    
    // Returns length of table.
    return j;
}

void compute_lookup_table(uint64_t base, uint64_t modulus, uint64_t *lookup_table, uint64_t lookup_table_len)
{
    // We compute the powers of two of the base. i.e. all base^x such that x is a power of 2,
    // up to predetermined limit (imposed manually). All powers of two are divided by the modulus.
    lookup_table[0] = base % modulus;

    uint64_t i;
    for (i = 1; i < lookup_table_len; i++)
    {
        lookup_table[i] = (lookup_table[i-1] * lookup_table[i-1]) % modulus;
    }
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

    // Compute an array which corresponds to the powers of two of the public key exponent.
    // E.g.) 34 = 2^1 + 2^5, so returned array is [1, 5].
    uint64_t powers_of_two_public_exponent[MAX_LUT_POWER];
    uint64_t num_of_powers_public_key = compute_powers_of_two(E, powers_of_two_public_exponent, MAX_LUT_POWER);

    // Compute the look up table for a given plaintext and public key exponent. This 
    // saves computation time when trying to encrypt the same plaintext.
    uint64_t lookup_table_encrypt[MAX_LUT_POWER];
    compute_lookup_table(input_plaintext, N, lookup_table_encrypt, MAX_LUT_POWER);

    // Compute an array which corresponds to the powers of two of the private key exponent.
    // E.g.) 34 = 2^1 + 2^5, so returned array is [1, 5].
    uint64_t powers_of_two_private_exponent[MAX_LUT_POWER];
    uint64_t num_of_powers_private_key = compute_powers_of_two(D, powers_of_two_private_exponent, MAX_LUT_POWER);

    // Compute the look up table for a given cyphertext and public key exponent. This 
    // saves computation time when trying to decrypt the same cyphertext
    // Expected cyphertext in this example is 855.
    uint64_t lookup_table_decrypt[MAX_LUT_POWER];
    compute_lookup_table(855, N, lookup_table_decrypt, MAX_LUT_POWER);

    // Encrypt the plain text with the lookup table (should equal 855)
    cyphertext = encrypt_plaintext(powers_of_two_public_exponent, num_of_powers_public_key, lookup_table_encrypt, MAX_LUT_POWER, N);
    assert(cyphertext == 855);

    // Decrypt cyphertext with the lookup table
    decrypted_plaintext = decrypt_cyphertext(powers_of_two_private_exponent, num_of_powers_private_key, lookup_table_decrypt, MAX_LUT_POWER, N);
    // Final assertions that calculations were correct
    assert(decrypted_plaintext == 123);   

    return 0;
}