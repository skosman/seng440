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
	.file	"v1-opt.c"
	.global	__aeabi_uldivmod
	.text
	.align	2
	.global	calculate_modular_exponentiation
	.type	calculate_modular_exponentiation, %function
calculate_modular_exponentiation:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r0, #1
	mov	r1, #0
	str	r0, [fp, #-44]
	str	r1, [fp, #-40]
	b	.L2
.L4:
	ldr	r3, [fp, #-36]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-44]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	ldr	ip, [fp, #-44]
	umull	r5, r6, r3, ip
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	mov	r0, r3
	mov	r1, r4
	ldmib	fp, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
.L3:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	mul	r2, r3, r2
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-28]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	umull	r5, r6, r1, r3
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	mov	r0, r3
	mov	r1, r4
	ldmib	fp, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
.L2:
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L4
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
	.size	calculate_modular_exponentiation, .-calculate_modular_exponentiation
	.section	.rodata
	.align	2
	.type	__PRETTY_FUNCTION__.1703, %object
	.size	__PRETTY_FUNCTION__.1703, 29
__PRETTY_FUNCTION__.1703:
	.ascii	"loop_encrypt_decrypt_routine\000"
	.align	2
.LC0:
	.ascii	"855 == cyphertext\000"
	.align	2
.LC1:
	.ascii	"v1-opt.c\000"
	.align	2
.LC2:
	.ascii	"123 == decrypted_plaintext\000"
	.text
	.align	2
	.global	loop_encrypt_decrypt_routine
	.type	loop_encrypt_decrypt_routine, %function
loop_encrypt_decrypt_routine:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #52
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r1, #9961472
	add	r1, r1, #38400
	add	r1, r1, #128
	mov	r2, #0
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
	b	.L7
.L12:
	add	r4, fp, #12
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	calculate_modular_exponentiation
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	add	r4, fp, #12
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	ldmib	fp, {r2-r3}
	bl	calculate_modular_exponentiation
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #852
	add	r3, r3, #3
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L14
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L16
.L14:
	ldr	r0, .L18
	ldr	r1, .L18+4
	mov	r2, #51
	ldr	r3, .L18+8
	bl	__assert_fail
.L16:
	ldr	r4, [fp, #-44]
	cmp	r4, #123
	bne	.L15
	ldr	r1, [fp, #-40]
	cmp	r1, #0
	beq	.L17
.L15:
	ldr	r0, .L18+12
	ldr	r1, .L18+4
	mov	r2, #52
	ldr	r3, .L18+8
	bl	__assert_fail
.L17:
	mvn	r3, #0
	mvn	r4, #0
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
.L7:
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L12
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LC0
	.word	.LC1
	.word	__PRETTY_FUNCTION__.1703
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #60
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
	str	r1, [fp, #-60]
	str	r2, [fp, #-56]
	mov	r2, #123
	mov	r3, #0
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r3, #2752
	add	r3, r3, #1
	mov	r4, #0
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	stmia	sp, {r7-r8}
	str	r9, [sp, #8]
	str	sl, [sp, #12]
	ldr	r0, .L22
	mov	r2, r5
	mov	r3, r6
	bl	printf
	mvn	r3, #0
	mvn	r4, #0
	mov	r1, r5
	mov	r2, r6
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-76]
	str	r2, [fp, #-72]
	mvn	r3, #0
	mvn	r4, #0
	mov	r1, r7
	mov	r2, r8
	adds	r1, r1, r3
	adc	r2, r2, r4
	str	r1, [fp, #-68]
	str	r2, [fp, #-64]
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
	sub	r2, fp, #68
	ldmia	r2, {r1-r2}
	stmia	sp, {r1-r2}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, .L22+4
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L22+8
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L22+12
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L22+16
	bl	puts
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	stmia	sp, {r2-r3}
	ldr	r0, .L22+20
	mov	r2, r9
	mov	r3, sl
	bl	printf
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	ldr	r0, .L22+24
	mov	r2, r9
	mov	r3, sl
	bl	printf
	sub	r5, fp, #52
	ldmia	r5, {r4-r5}
	stmia	sp, {r4-r5}
	str	r9, [sp, #8]
	str	sl, [sp, #12]
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	loop_encrypt_decrypt_routine
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
