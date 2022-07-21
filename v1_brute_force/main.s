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
	.file	"v1-main.c"
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
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r3, #1
	mov	r4, #0
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	b	.L2
.L4:
	ldr	r3, [fp, #-44]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-36]
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
.L3:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-36]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
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
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
.L2:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-40]
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L4
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
	.size	calculate_modular_exponentiation, .-calculate_modular_exponentiation
	.align	2
	.global	encrypt_plaintext
	.type	encrypt_plaintext, %function
encrypt_plaintext:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldmib	fp, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	calculate_modular_exponentiation
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
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldmib	fp, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	calculate_modular_exponentiation
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	decrypt_cyphertext, .-decrypt_cyphertext
	.section	.rodata
	.align	2
	.type	__PRETTY_FUNCTION__.1719, %object
	.size	__PRETTY_FUNCTION__.1719, 29
__PRETTY_FUNCTION__.1719:
	.ascii	"loop_encrypt_decrypt_routine\000"
	.align	2
.LC0:
	.ascii	"cyphertext == 855\000"
	.align	2
.LC1:
	.ascii	"v1-main.c\000"
	.align	2
.LC2:
	.ascii	"decrypted_plaintext == 123\000"
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
	str	r0, [fp, #-44]
	str	r1, [fp, #-40]
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	b	.L11
.L16:
	add	r4, fp, #12
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	encrypt_plaintext
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	add	r4, fp, #12
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	ldmib	fp, {r2-r3}
	bl	decrypt_cyphertext
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	ldr	r2, [fp, #-36]
	mov	r3, #852
	add	r3, r3, #3
	cmp	r2, r3
	bne	.L19
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L21
.L19:
	ldr	r0, .L23
	ldr	r1, .L23+4
	mov	r2, #59
	ldr	r3, .L23+8
	bl	__assert_fail
.L21:
	ldr	r3, [fp, #-28]
	cmp	r3, #123
	bne	.L20
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L22
.L20:
	ldr	r0, .L23+12
	ldr	r1, .L23+4
	mov	r2, #60
	ldr	r3, .L23+8
	bl	__assert_fail
.L22:
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	mov	r1, #1
	mov	r2, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
.L11:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L18
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L16
	ldr	r2, [fp, #-20]
	mov	r3, #99328
	add	r3, r3, #668
	add	r3, r3, #3
	cmp	r2, r3
	bhi	.L18
	ldr	r2, [fp, #-20]
	mov	r3, #99328
	add	r3, r3, #668
	add	r3, r3, #3
	cmp	r2, r3
	b	.L16
.L18:
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LC0
	.word	.LC1
	.word	__PRETTY_FUNCTION__.1719
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
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #84
	mov	r3, #61
	mov	r4, #0
	str	r3, [fp, #-100]
	str	r4, [fp, #-96]
	mov	r3, #53
	mov	r4, #0
	str	r3, [fp, #-92]
	str	r4, [fp, #-88]
	ldr	r2, [fp, #-96]
	ldr	r3, [fp, #-92]
	mul	r2, r3, r2
	ldr	r1, [fp, #-88]
	ldr	r3, [fp, #-100]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, [fp, #-100]
	ldr	r3, [fp, #-92]
	umull	r5, r6, r1, r3
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	str	r3, [fp, #-84]
	str	r4, [fp, #-80]
	str	r3, [fp, #-84]
	str	r4, [fp, #-80]
	mov	r3, #17
	mov	r4, #0
	str	r3, [fp, #-76]
	str	r4, [fp, #-72]
	mov	r3, #123
	mov	r4, #0
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	mov	r3, #2752
	add	r3, r3, #1
	mov	r4, #0
	str	r3, [fp, #-68]
	str	r4, [fp, #-64]
	sub	r4, fp, #92
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r4, fp, #84
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, .L27
	sub	r3, fp, #100
	ldmia	r3, {r2-r3}
	bl	printf
	sub	r2, fp, #100
	ldmia	r2, {r1-r2}
	mvn	r3, #0
	mvn	r4, #0
	mov	r7, r1
	mov	r8, r2
	adds	r7, r7, r3
	adc	r8, r8, r4
	sub	r2, fp, #92
	ldmia	r2, {r1-r2}
	mvn	r3, #0
	mvn	r4, #0
	mov	r9, r1
	mov	sl, r2
	adds	r9, r9, r3
	adc	sl, sl, r4
	sub	r2, fp, #100
	ldmia	r2, {r1-r2}
	mvn	r3, #0
	mvn	r4, #0
	mov	r0, r1
	mov	r1, r2
	adds	r0, r0, r3
	adc	r1, r1, r4
	sub	r6, fp, #92
	ldmia	r6, {r5-r6}
	mvn	r3, #0
	mvn	r4, #0
	adds	r3, r3, r5
	adc	r4, r4, r6
	mul	r2, r3, r1
	mul	ip, r0, r4
	add	r2, r2, ip
	umull	r5, r6, r0, r3
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	stmia	sp, {r9-sl}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, .L27+4
	mov	r2, r7
	mov	r3, r8
	bl	printf
	ldr	r0, .L27+8
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L27+12
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L27+16
	bl	puts
	sub	r4, fp, #76
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	ldr	r0, .L27+20
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	bl	printf
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	ldr	r0, .L27+24
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	bl	printf
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r4, fp, #84
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	loop_encrypt_decrypt_routine
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L28:
	.align	2
.L27:
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
