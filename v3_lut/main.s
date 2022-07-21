	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"v3-main.c"
	.global	__aeabi_uldivmod
	.text
	.align	2
	.global	compute_modular_exponentiation_with_lut
	.type	compute_modular_exponentiation_with_lut, %function
compute_modular_exponentiation_with_lut:
	@ Function supports interworking.
	@ args = 24, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldmia	r3, {r3-r4}
	mov	r2, r3, asl #3
	ldr	r3, [fp, #4]
	add	r3, r3, r2
	ldmia	r3, {r0-r1}
	str	r0, [fp, #-44]
	str	r1, [fp, #-40]
	mov	r1, #1
	mov	r2, #0
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
	b	.L2
.L5:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldmia	r3, {r3-r4}
	mov	r2, r3, asl #3
	ldr	r3, [fp, #4]
	add	r3, r3, r2
	ldmia	r3, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r2, r4, r2
	ldr	r1, [fp, #-40]
	mul	r1, r3, r1
	add	r2, r2, r1
	ldr	ip, [fp, #-44]
	umull	r0, r1, r3, ip
	mov	r3, r0
	mov	r4, r1
	add	r2, r2, r4
	mov	r4, r2
	mov	r0, r3
	mov	r1, r4
	add	r3, fp, #20
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #1
	mov	r4, #0
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	adds	r0, r0, r3
	adc	r1, r1, r4
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-36]
	cmp	r3, r1
	bne	.L8
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	cmp	r3, r2
	beq	.L3
.L8:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldmia	r3, {r3-r4}
	mov	r2, r3, asl #3
	ldr	r3, [fp, #4]
	add	r3, r3, r2
	ldmia	r3, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r2, r4, r2
	ldr	r1, [fp, #-40]
	mul	r1, r3, r1
	add	r2, r2, r1
	ldr	ip, [fp, #-44]
	umull	r0, r1, r3, ip
	mov	r3, r0
	mov	r4, r1
	add	r2, r2, r4
	mov	r4, r2
	mov	r0, r3
	mov	r1, r4
	add	r3, fp, #20
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #1
	mov	r4, #0
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	adds	r0, r0, r3
	adc	r1, r1, r4
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
.L2:
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-32]
	cmp	r3, r1
	bhi	.L5
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	cmp	r3, r2
	bne	.L3
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-36]
	cmp	r3, r4
	bhi	.L5
	ldr	r3, [fp, #-28]
	ldr	ip, [fp, #-36]
	cmp	r3, ip
.L3:
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	compute_modular_exponentiation_with_lut, .-compute_modular_exponentiation_with_lut
	.align	2
	.global	encrypt_plaintext
	.type	encrypt_plaintext, %function
encrypt_plaintext:
	@ Function supports interworking.
	@ args = 24, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	str	r0, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #4]
	str	r3, [sp, #0]
	add	r4, fp, #12
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	add	r4, fp, #20
	ldmia	r4, {r3-r4}
	str	r3, [sp, #16]
	str	r4, [sp, #20]
	ldr	r0, [fp, #-16]
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	compute_modular_exponentiation_with_lut
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	encrypt_plaintext, .-encrypt_plaintext
	.align	2
	.global	decrypt_cyphertext
	.type	decrypt_cyphertext, %function
decrypt_cyphertext:
	@ Function supports interworking.
	@ args = 24, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	str	r0, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #4]
	str	r3, [sp, #0]
	add	r4, fp, #12
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	add	r4, fp, #20
	ldmia	r4, {r3-r4}
	str	r3, [sp, #16]
	str	r4, [sp, #20]
	ldr	r0, [fp, #-16]
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	compute_modular_exponentiation_with_lut
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	decrypt_cyphertext, .-decrypt_cyphertext
	.align	2
	.global	compute_powers_of_two
	.type	compute_powers_of_two, %function
compute_powers_of_two:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-12]
	str	r1, [fp, #-8]
	str	r2, [fp, #-16]
	mov	r1, #0
	mov	r2, #0
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
	sub	r3, fp, #12
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	b	.L14
.L19:
	ldr	r3, [fp, #-28]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L15
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	stmia	r3, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
.L15:
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r3, #1
	mov	r4, #0
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
	ldr	r2, [fp, #-44]
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r1, r3
	mov	r2, r1, asr #31
	str	r1, [fp, #-60]
	str	r2, [fp, #-56]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-60]
	cmp	r3, r2
	bne	.L22
	ldr	r3, [fp, #-8]
	ldr	r4, [fp, #-56]
	cmp	r3, r4
	beq	.L16
.L22:
	ldr	r3, [fp, #-28]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L18
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	stmia	r3, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
.L18:
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r3, #1
	mov	r4, #0
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
.L14:
	ldr	r2, [fp, #-44]
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r1, r3
	mov	r2, r1, asr #31
	str	r1, [fp, #-52]
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-48]
	cmp	r3, r2
	bcc	.L16
	ldr	r3, [fp, #-8]
	ldr	r4, [fp, #-48]
	cmp	r3, r4
	bne	.L19
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-52]
	cmp	r3, r1
	bcc	.L16
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-52]
	cmp	r3, r2
	b	.L19
.L16:
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
	.size	compute_powers_of_two, .-compute_powers_of_two
	.align	2
	.global	compute_lookup_table
	.type	compute_lookup_table, %function
compute_lookup_table:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	ldr	r2, [fp, #4]
	stmia	r2, {r3-r4}
	mov	r0, #1
	mov	r1, #0
	str	r0, [fp, #-44]
	str	r1, [fp, #-40]
	b	.L24
.L25:
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #4]
	add	r7, r3, r2
	ldr	r3, [fp, #-44]
	sub	r3, r3, #-536870911
	mov	r2, r3, asl #3
	ldr	r3, [fp, #4]
	add	r3, r3, r2
	ldmia	r3, {r5-r6}
	ldr	r3, [fp, #-44]
	sub	r3, r3, #-536870911
	mov	r2, r3, asl #3
	ldr	r3, [fp, #4]
	add	r3, r3, r2
	ldmia	r3, {r3-r4}
	mul	r2, r3, r6
	mul	r1, r5, r4
	add	r2, r2, r1
	umull	r0, r1, r5, r3
	mov	r3, r0
	mov	r4, r1
	add	r2, r2, r4
	mov	r4, r2
	mov	r0, r3
	mov	r1, r4
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	stmia	r7, {r3-r4}
	mov	r3, #1
	mov	r4, #0
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
.L24:
	ldr	r3, [fp, #16]
	ldr	r2, [fp, #-40]
	cmp	r3, r2
	bhi	.L25
	ldr	r3, [fp, #16]
	ldr	r4, [fp, #-40]
	cmp	r3, r4
	bne	.L27
	ldr	r3, [fp, #12]
	ldr	r0, [fp, #-44]
	cmp	r3, r0
	bhi	.L25
	ldr	r3, [fp, #12]
	ldr	r1, [fp, #-44]
	cmp	r3, r1
.L27:
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, lr}
	bx	lr
	.size	compute_lookup_table, .-compute_lookup_table
	.section	.rodata
	.align	2
	.type	__PRETTY_FUNCTION__.1807, %object
	.size	__PRETTY_FUNCTION__.1807, 29
__PRETTY_FUNCTION__.1807:
	.ascii	"loop_encrypt_decrypt_routine\000"
	.align	2
.LC0:
	.ascii	"cyphertext == 855\000"
	.align	2
.LC1:
	.ascii	"v3-main.c\000"
	.align	2
.LC2:
	.ascii	"decrypted_plaintext == 123\000"
	.text
	.align	2
	.global	loop_encrypt_decrypt_routine
	.type	loop_encrypt_decrypt_routine, %function
loop_encrypt_decrypt_routine:
	@ Function supports interworking.
	@ args = 24, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #68
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r1, #0
	mov	r2, #0
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
	b	.L29
.L34:
	ldr	r3, [fp, #12]
	str	r3, [sp, #0]
	mov	r3, #12
	mov	r4, #0
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	add	r4, fp, #20
	ldmia	r4, {r3-r4}
	str	r3, [sp, #16]
	str	r4, [sp, #20]
	ldr	r0, [fp, #-16]
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	encrypt_plaintext
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	mov	r3, #852
	add	r3, r3, #3
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L37
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L39
.L37:
	ldr	r0, .L41
	ldr	r1, .L41+4
	mov	r2, #111
	ldr	r3, .L41+8
	bl	__assert_fail
.L39:
	ldr	r3, [fp, #16]
	str	r3, [sp, #0]
	mov	r3, #12
	mov	r4, #0
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	add	r4, fp, #20
	ldmia	r4, {r3-r4}
	str	r3, [sp, #16]
	str	r4, [sp, #20]
	ldr	r0, [fp, #-20]
	ldmib	fp, {r2-r3}
	bl	decrypt_cyphertext
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldr	r4, [fp, #-44]
	cmp	r4, #123
	bne	.L38
	ldr	r1, [fp, #-40]
	cmp	r1, #0
	beq	.L40
.L38:
	ldr	r0, .L41+12
	ldr	r1, .L41+4
	mov	r2, #118
	ldr	r3, .L41+8
	bl	__assert_fail
.L40:
	mov	r3, #1
	mov	r4, #0
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
.L29:
	ldr	r2, [fp, #-32]
	cmp	r2, #0
	bne	.L36
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L34
	mov	r3, #99328
	add	r3, r3, #668
	add	r3, r3, #3
	ldr	r4, [fp, #-36]
	cmp	r4, r3
	bhi	.L36
	mov	r3, #99328
	add	r3, r3, #668
	add	r3, r3, #3
	ldr	r1, [fp, #-36]
	cmp	r1, r3
	b	.L34
.L36:
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LC0
	.word	.LC1
	.word	__PRETTY_FUNCTION__.1807
	.word	.LC2
	.size	loop_encrypt_decrypt_routine, .-loop_encrypt_decrypt_routine
	.section	.rodata
	.align	2
.LC3:
	.ascii	"P: %llu, Q: %llu, N=P*Q: %llu\012\000"
	.align	2
.LC4:
	.ascii	"P-1: %llu, Q-1: %llu, (P-1)(Q-1): %llu\012\000"
	.align	2
.LC5:
	.ascii	"E (coprime to (P-1)(Q-1)): %llu\012\000"
	.align	2
.LC6:
	.ascii	"Private exponent D: %llu\012\000"
	.align	2
.LC7:
	.ascii	"D*E = 1 mod [(P-1)(Q-1)] is satisfied\012\000"
	.align	2
.LC8:
	.ascii	"The public key is (N,E) = (%llu,%llu)\012\000"
	.align	2
.LC9:
	.ascii	"The private key is (N,D) = (%llu,%llu)\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 440
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #468
	mov	r5, #61
	mov	r6, #0
	mov	r7, #53
	mov	r8, #0
	mul	r3, r7, r6
	mul	r2, r5, r8
	add	r3, r3, r2
	umull	r9, sl, r5, r7
	add	r3, r3, sl
	mov	sl, r3
	mov	r1, #17
	mov	r2, #0
	str	r1, [fp, #-460]
	str	r2, [fp, #-456]
	mov	r2, #123
	mov	r3, #0
	str	r2, [fp, #-444]
	str	r3, [fp, #-440]
	mov	r3, #2752
	add	r3, r3, #1
	mov	r4, #0
	str	r3, [fp, #-452]
	str	r4, [fp, #-448]
	stmia	sp, {r7-r8}
	str	r9, [sp, #8]
	str	sl, [sp, #12]
	ldr	r0, .L45
	mov	r2, r5
	mov	r3, r6
	bl	printf
	mvn	r3, #0
	mvn	r4, #0
	mov	r1, r5
	mov	r2, r6
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-476]
	str	r2, [fp, #-472]
	mvn	r3, #0
	mvn	r4, #0
	mov	r1, r7
	mov	r2, r8
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-468]
	str	r2, [fp, #-464]
	mvn	r3, #0
	mvn	r4, #0
	mov	r1, r5
	mov	r2, r6
	adds	r1, r1, r3
	adc	r2, r2, r4
	mvn	r3, #0
	mvn	r4, #0
	adds	r3, r3, r7
	adc	r4, r4, r8
	mul	r0, r3, r2
	mul	ip, r1, r4
	add	r0, r0, ip
	umull	r5, r6, r1, r3
	mov	r3, r5
	mov	r4, r6
	add	r0, r0, r4
	mov	r4, r0
	sub	r2, fp, #468
	ldmia	r2, {r1-r2}
	stmia	sp, {r1-r2}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, .L45+4
	sub	r3, fp, #476
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L45+8
	sub	r3, fp, #460
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L45+12
	sub	r3, fp, #452
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L45+16
	bl	puts
	sub	r3, fp, #460
	ldmia	r3, {r2-r3}
	stmia	sp, {r2-r3}
	ldr	r0, .L45+20
	mov	r2, r9
	mov	r3, sl
	bl	printf
	sub	r4, fp, #452
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	ldr	r0, .L45+24
	mov	r2, r9
	mov	r3, sl
	bl	printf
	sub	r2, fp, #148
	mov	r3, #12
	mov	r4, #0
	stmia	sp, {r3-r4}
	sub	r1, fp, #460
	ldmia	r1, {r0-r1}
	bl	compute_powers_of_two
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	sub	r3, fp, #244
	str	r3, [sp, #0]
	mov	r3, #12
	mov	r4, #0
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	sub	r1, fp, #444
	ldmia	r1, {r0-r1}
	mov	r2, r9
	mov	r3, sl
	bl	compute_lookup_table
	sub	r2, fp, #340
	mov	r3, #12
	mov	r4, #0
	stmia	sp, {r3-r4}
	sub	r1, fp, #452
	ldmia	r1, {r0-r1}
	bl	compute_powers_of_two
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	sub	r3, fp, #436
	str	r3, [sp, #0]
	mov	r3, #12
	mov	r4, #0
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	mov	r0, #852
	add	r0, r0, #3
	mov	r1, #0
	mov	r2, r9
	mov	r3, sl
	bl	compute_lookup_table
	sub	r2, fp, #148
	sub	r1, fp, #340
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r3, fp, #244
	str	r3, [sp, #8]
	sub	r3, fp, #436
	str	r3, [sp, #12]
	str	r9, [sp, #16]
	str	sl, [sp, #20]
	mov	r0, r2
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	loop_encrypt_decrypt_routine
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
