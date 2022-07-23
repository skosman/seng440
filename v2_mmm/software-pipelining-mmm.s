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
	.file	"mmm-sw-optmized.c"
	.text
	.align	2
	.global	get_num_bits
	.type	get_num_bits, %function
get_num_bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-12]
	str	r1, [fp, #-8]
	mov	r3, #0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	sub	r4, fp, #12
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
	.size	get_num_bits, .-get_num_bits
	.align	2
	.global	montgomery_modular_multiplication
	.type	montgomery_modular_multiplication, %function
montgomery_modular_multiplication:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, fp}
	add	fp, sp, #16
	sub	sp, sp, #52
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r1, #0
	mov	r2, #0
	str	r1, [fp, #-60]
	str	r2, [fp, #-56]
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r5, r1, r3
	and	r6, r2, r4
	str	r5, [fp, #-44]
	str	r6, [fp, #-40]
	sub	r2, fp, #28
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r6, r1, r3
	and	r7, r2, r4
	str	r6, [fp, #-52]
	str	r7, [fp, #-48]
	mov	r7, #0
	str	r7, [fp, #-64]
	b	.L6
.L7:
	mov	r3, #1
	mov	r4, #0
	sub	r2, fp, #60
	ldmia	r2, {r1-r2}
	and	r1, r1, r3
	and	r2, r2, r4
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	sub	r6, fp, #44
	ldmia	r6, {r5-r6}
	and	r3, r3, r5
	and	r4, r4, r6
	eor	r6, r1, r3
	eor	r7, r2, r4
	mov	r4, r6
	mov	r5, r7
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-48]
	mul	r2, r3, r2
	ldr	r3, [fp, #-32]
	ldr	r7, [fp, #-52]
	mul	r3, r7, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	ldr	ip, [fp, #-52]
	umull	r0, r1, r3, ip
	add	r2, r2, r1
	mov	r1, r2
	ldr	r3, [fp, #4]
	mul	r2, r5, r3
	ldr	r3, [fp, #8]
	mul	r3, r4, r3
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	umull	r6, r7, r3, r4
	mov	r3, r6
	mov	r4, r7
	add	r2, r2, r4
	mov	r4, r2
	adds	r3, r3, r0
	adc	r4, r4, r1
	sub	r2, fp, #60
	ldmia	r2, {r1-r2}
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r6, r4, lsr #1
	mov	r5, r3, rrx
	str	r5, [fp, #-60]
	str	r6, [fp, #-56]
	ldr	r6, [fp, #-64]
	add	r1, r6, #1
	sub	r0, r1, #32
	ldr	r3, [fp, #-24]
	mov	ip, r3, lsr r0
	rsb	r2, r1, #32
	ldr	r3, [fp, #-24]
	mov	r5, r3, asl r2
	ldr	r2, [fp, #-28]
	cmp	r0, #0
	ldr	r0, [fp, #-24]
	mov	r3, r2, lsr r1
	orr	r3, r5, r3
	movge	r3, ip
	mov	r4, r0, lsr r1
	mov	r1, #1
	mov	r2, #0
	and	r5, r3, r1
	and	r6, r4, r2
	str	r5, [fp, #-52]
	str	r6, [fp, #-48]
	ldr	r6, [fp, #-64]
	add	r6, r6, #1
	str	r6, [fp, #-64]
.L6:
	ldr	r3, [fp, #12]
	ldr	r7, [fp, #-64]
	cmp	r7, r3
	blt	.L7
	ldr	r3, [fp, #8]
	ldr	ip, [fp, #-56]
	cmp	r3, ip
	bhi	.L8
	ldr	r3, [fp, #8]
	ldr	r1, [fp, #-56]
	cmp	r3, r1
	bne	.L11
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #-60]
	cmp	r3, r2
	bhi	.L8
	ldr	r3, [fp, #4]
	ldr	r4, [fp, #-60]
	cmp	r3, r4
.L11:
	ldmib	fp, {r3-r4}
	sub	r6, fp, #60
	ldmia	r6, {r5-r6}
	subs	r5, r5, r3
	sbc	r6, r6, r4
	str	r5, [fp, #-60]
	str	r6, [fp, #-56]
.L8:
	sub	r4, fp, #60
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, r7, fp}
	bx	lr
	.size	montgomery_modular_multiplication, .-montgomery_modular_multiplication
	.global	__aeabi_uldivmod
	.align	2
	.global	multiply_and_square
	.type	multiply_and_square, %function
multiply_and_square:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #68
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	ldmib	fp, {r0-r1}
	bl	get_num_bits
	mov	r3, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	str	r1, [fp, #-68]
	str	r2, [fp, #-64]
	ldr	r2, [fp, #-68]
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r4, r3, asr #31
	mov	r0, r3
	mov	r1, r4
	ldmib	fp, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	mov	r5, r3
	mov	r6, r4
	mul	r2, r5, r6
	mul	r3, r5, r6
	add	r2, r2, r3
	umull	r3, r4, r5, r5
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
	str	r5, [fp, #-60]
	str	r6, [fp, #-56]
	ldr	r2, [fp, #-68]
	ldmib	fp, {r3-r4}
	stmia	sp, {r3-r4}
	str	r2, [sp, #8]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	montgomery_modular_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	b	.L13
.L15:
	ldr	r3, [fp, #-44]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L14
	ldr	r3, [fp, #-68]
	ldmib	fp, {r1-r2}
	stmia	sp, {r1-r2}
	str	r3, [sp, #8]
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	montgomery_modular_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
.L14:
	ldr	r2, [fp, #-68]
	ldmib	fp, {r3-r4}
	stmia	sp, {r3-r4}
	str	r2, [sp, #8]
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	montgomery_modular_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
.L13:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-40]
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L15
	ldr	r2, [fp, #-68]
	ldmib	fp, {r3-r4}
	stmia	sp, {r3-r4}
	str	r2, [sp, #8]
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	mov	r2, #1
	mov	r3, #0
	bl	montgomery_modular_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	sub	r4, fp, #60
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
	.size	multiply_and_square, .-multiply_and_square
	.section	.rodata
	.align	2
	.type	__PRETTY_FUNCTION__.1753, %object
	.size	__PRETTY_FUNCTION__.1753, 29
__PRETTY_FUNCTION__.1753:
	.ascii	"loop_encrypt_decrypt_routine\000"
	.align	2
.LC0:
	.ascii	"855 == cyphertext\000"
	.align	2
.LC1:
	.ascii	"mmm-sw-optmized.c\000"
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
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	b	.L18
.L23:
	add	r4, fp, #12
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	multiply_and_square
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
	bl	multiply_and_square
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #852
	add	r3, r3, #3
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L26
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L28
.L26:
	ldr	r0, .L30
	ldr	r1, .L30+4
	mov	r2, #93
	ldr	r3, .L30+8
	bl	__assert_fail
.L28:
	ldr	r2, [fp, #-44]
	cmp	r2, #123
	bne	.L27
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L29
.L27:
	ldr	r0, .L30+12
	ldr	r1, .L30+4
	mov	r2, #94
	ldr	r3, .L30+8
	bl	__assert_fail
.L29:
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	mov	r1, #1
	mov	r2, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
.L18:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L25
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L23
	ldr	r2, [fp, #-20]
	mov	r3, #99328
	add	r3, r3, #668
	add	r3, r3, #3
	cmp	r2, r3
	bhi	.L25
	ldr	r2, [fp, #-20]
	mov	r3, #99328
	add	r3, r3, #668
	add	r3, r3, #3
	cmp	r2, r3
	b	.L23
.L25:
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LC0
	.word	.LC1
	.word	__PRETTY_FUNCTION__.1753
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
	ldr	r0, .L34
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
	ldr	r0, .L34+4
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L34+8
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L34+12
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L34+16
	bl	puts
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	stmia	sp, {r2-r3}
	ldr	r0, .L34+20
	mov	r2, r9
	mov	r3, sl
	bl	printf
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	ldr	r0, .L34+24
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
.L35:
	.align	2
.L34:
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
