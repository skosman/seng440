# seng440
Seng 440 RSA Cryptography Project

# Project Structure
The project is broken up into folders that correspond to different versions of the RSA code. These are primarily 3 versions:

Within the `v1_brute_force` folder:
1. Version 1.1: Brute Force RSA - This version implements the unoptimized bruteforce solution with the modulo operator. The C code is under `main.c`. The corresponding Assembly file is `main.s`, and with a peephole optimization it is named `main-peephole.s`.
2. Version 1.2: Software Optimized RSA - This version still implemented the brute force RSA algorithm, but in addition we implement general software optimization methods like loop unrolling, pipelining, register notation.... The C code is under `main-sw-optimized.c`. The corresponding Assembly file is `main-sw-optimized.s`. Furthermore, the Assembly peephole optimization version is named `main-sw-optimized-peephole.c`.

For version 1 (brute force), the profiling results are collected under `gprof-results-main.txt` for version 1.1 (no optimization, brute force), and `gprof-results-main-optimized.txt` for version 1.2 implementing the general software optimization methods. 

Within the `v2_mmm` folder:
3. Version 2.1: Unoptimized MMM - This version implements Montgomery Modular Multiplication without further consideration for futher general software optimization methods. THe C code is under `main.c`. THe corresponding Assembly file is `main.s`, and with a peephole optimization the optimized assembly file is named `main-peephole.s`.
4. Version 2.2: Optimized MMM - This version implements MMM but in addition, implements the general software optimization methods presented in lecture to evaluate the increase in performance of the code. The C code is under `mmm-sw-optmized.c`, and the corresponding Assembly code is in `mmm-sw-optmized.s`. There is no peephole version of MMM in the codebase for this iteration.

For version 2 (MMM), the profiling results are collected under `gprof_mmm_unopt.txt` for version 2.1 (unoptimized MMM), and `gprof_mmm_opt.txt` for version 2.2 (the optimized MMM version).

Within the `v3_lut` folder:
5. Version 3: Look-up table (LUT) implementation - This version implements the look-up table for a given plaintext, modulus, and exponent provided. The C code is located in `main.c`, and the corresponding Assembly file is `main.s`.

For version 3 (LUT), the profiling results are collected under `gprof-results-lut.txt` for version 3 to provide information on the performance of the application.

# Resources

In the `resources` folder we include `mmm_03.c`, which is code that is provided by the professor to help in our implementation of MMM. This has been implemented and adapted in our solutions.

# How to compile & run

When logged in via SSH to `seng440.ece.uvic.ca`, and when within the `/tmp` folder, run the following command in the respective folder version to compile the program with GProf enabled and static libraries included:

```
/opt/arm/4.3.2/bin/arm-linux-gcc -pg -static -o output main.c
```

Execute this operation above to compile any of the `.c` files in our codebase repository. We can run the executed program either on the SENG 440 ARM machine (by using lftp and telnet, then by simply calling the executable in the commnad line), or by running `qemu-arm output` on the compiled file to run it.

To compile the Assembly files, use the following commands:

```
/opt/arm/4.3.2/bin/arm-linux-gcc -pg -static -c main.s -o output
```