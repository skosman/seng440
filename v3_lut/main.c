#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#define TEST_ITERATIONS 100000
#define MAX_LUT_POWER 12 // corresponds to 2^12 = 4096

uint64_t compute_modular_exponentiation_with_lut(uint64_t *pow_of_two, uint64_t pow_of_two_len, uint64_t *lut, uint64_t lut_len, uint64_t modulus)
{
    register uint64_t result = lut[pow_of_two[0]];
    register uint64_t i;
    for (i=1; i < pow_of_two_len; i++)
    {
        result = (result * lut[pow_of_two[i]]) % modulus;

        i++;
        if (i == pow_of_two_len)
        {
            break;
        }

        // Loop unrolling with duplicated code segment
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
    // Barr-C 8.2 Variable Declarations - Page 51
    // Barr-C 5.2 Fixed-Width Integers - Page 34
    register uint64_t i;
    register uint64_t j;
    register uint64_t temp;

    j = 0;
    temp = num;
    for (i=0; (1<<i) <= num; i++)
    {
        if (1 & temp)
        {
            table[j] = i;
            j++;
        }
        // MISRA-C if - then - else
        else
        {
            // No action.
        }
        temp >>= 1;

        i++;
        if ((1<<i) == num)
        {
            break;
        }

        // Loop unrolling with duplicated code segment
        if (1 & temp)
        {
            table[j] = i;
            j++;
        }
        // MISRA-C if - then - else
        else
        {
            // No action.
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

    register uint64_t i;
    for (i = 1; i < lookup_table_len; i++)
    {
        lookup_table[i] = (lookup_table[i-1] * lookup_table[i-1]) % modulus;
    }
}

// Routine used for testing and gathering metrics based on continously
// computing the cyphertext and decrypted plaintext over a set number of test iterations
void loop_encrypt_decrypt_routine(uint64_t *powers_of_two_public_exponent, uint64_t *powers_of_two_private_exponent, uint64_t num_of_powers_public_key, uint64_t num_of_powers_private_key, uint64_t *lookup_table_encrypt, uint64_t *lookup_table_decrypt, uint64_t N)
{
    // Barr-C 8.2 Variable Declarations - Page 51
    // Barr-C 5.2 Fixed-Width Integers - Page 34
    register uint64_t cyphertext;
    register uint64_t decrypted_plaintext;

    register uint64_t i;
    // Barr-C 8.4 Loops - Page 54
    for (i = 0; i < TEST_ITERATIONS; i++) 
    {
        // Encrypt the plain text with the lookup table (should equal 855)
        cyphertext = encrypt_plaintext(powers_of_two_public_exponent, num_of_powers_public_key, lookup_table_encrypt, MAX_LUT_POWER, N);
        //printf("Computed cypher text: %llu\n", cyphertext);
        assert(cyphertext == 855);

        // Decrypt cyphertext with the lookup table
        decrypted_plaintext = decrypt_cyphertext(powers_of_two_private_exponent, num_of_powers_private_key, lookup_table_decrypt, MAX_LUT_POWER, N);
        //printf("Computed plain text: %llu\n", decrypted_plaintext);

        // Final assertion that calculations were correct
        assert(decrypted_plaintext == 123);   
    }
}

int main() 
{
    // Barr-C 8.2 Variable Declarations - Page 51
    // Barr-C 5.2 Fixed-Width Integers - Page 34
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

    // Run the encryption and decryption cycle multiple times to capture more accurate results
    loop_encrypt_decrypt_routine(powers_of_two_public_exponent, powers_of_two_private_exponent, num_of_powers_public_key, num_of_powers_private_key, lookup_table_encrypt, lookup_table_decrypt, N);

    return 0;
}