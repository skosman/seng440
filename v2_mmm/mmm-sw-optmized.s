	.arch armv4t
	.eabi_attribute 27, 3
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"mmm-sw-optmized.c"
	.text
	.align	2
	.global	get_num_bits
	.type	get_num_bits, %function
get_num_bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	orrs	r3, r0, r1
	beq	.L3
	mov	r3, #0
.L4:
	movs	r1, r1, lsr #1
	mov	r0, r0, rrx
	orrs	r2, r0, r1
	add	r3, r3, #1
	bne	.L4
.L3:
	mov	r0, r3
	bx	lr
	.size	get_num_bits, .-get_num_bits
	.align	2
	.global	montgomery_modular_multiplication
	.type	montgomery_modular_multiplication, %function
montgomery_modular_multiplication:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	sub	sp, sp, #64
	add	r4, sp, #96
	ldmia	r4, {r4, r5}	@ phole ldm
	orrs	r4, r4, r5
	str	r0, [sp, #4]
	mov	fp, r1
	str	r2, [sp, #16]
	str	r3, [sp, #20]
	beq	.L24
	add	r3, sp, #96
	ldmia	r3, {r2-r3}
	mov	r1, #0
.L11:
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	orrs	r7, r2, r3
	add	r1, r1, #1
	bne	.L11
	mov	r2, r1
	mov	r3, r2, asr #31
	add	r5, sp, #16
	ldmia	r5, {r4-r5}
	str	r2, [sp, #32]
	str	r3, [sp, #36]
	orrs	r2, r2, r3
	mov	r2, #1
	mov	r3, #0
	and	r4, r4, r2
	and	r5, r5, r3
	str	r4, [sp, #24]
	str	r5, [sp, #28]
	beq	.L25
	mov	r6, #0
	mov	r7, #0
	str	r6, [sp, #56]
	str	r7, [sp, #60]
	str	r6, [sp, #40]
	str	r7, [sp, #44]
.L23:
	ldr	r8, [sp, #40]
	ldr	r7, [sp, #4]
	mov	r3, r7, lsr r8
	rsb	r2, r8, #32
	orr	r3, r3, fp, asl r2
	subs	r1, r8, #32
	movpl	r3, fp, lsr r1
	mov	r4, fp, lsr r8
	add	ip, r8, #1
	mov	r5, r7, lsr ip
	mov	r0, #1
	mov	r1, #0
	and	r7, r3, r0
	and	r8, r4, r1
	add	sl, sp, #56
	ldmia	sl, {r9-sl}
	add	r4, sp, #24
	ldmia	r4, {r3-r4}
	and	r9, r9, r0
	and	sl, sl, r1
	and	r2, r8, r4
	and	r1, r7, r3
	eor	r3, r1, r9
	eor	r4, r2, sl
	ldr	sl, [sp, #16]
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, [sp, #8]
	umull	r3, r4, r7, sl
	ldr	sl, [sp, #96]
	umull	r1, r2, r0, sl
	rsb	r0, ip, #32
	orr	r5, r5, fp, asl r0
	ldr	r0, [sp, #20]
	ldr	r8, [sp, #8]
	mla	r4, r7, r0, r4
	ldr	r7, [sp, #100]
	mla	r2, r8, r7, r2
	add	r8, sp, #56
	ldmia	r8, {r7-r8}
	adds	r3, r3, r7
	adc	r4, r4, r8
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #48]
	str	r1, [sp, #52]
	ldr	r1, [sp, #40]
	mov	r6, fp, lsr ip
	subs	r2, r1, #31
	movpl	r5, fp, lsr r2
	mov	r3, #0
	mov	r2, #1
	and	r8, r6, r3
	add	sl, sp, #48
	ldmia	sl, {r9-sl}
	add	r4, sp, #24
	ldmia	r4, {r3-r4}
	ldr	sl, [sp, #16]
	and	r7, r5, r2
	and	r1, r7, r3
	and	r9, r9, r2
	umull	r3, r4, r7, sl
	ldr	ip, [sp, #96]
	eor	r5, r9, r1
	umull	r1, r2, r5, ip
	ldr	r0, [sp, #20]
	mla	r4, r7, r0, r4
	ldr	r7, [sp, #100]
	mla	r2, r5, r7, r2
	add	r6, sp, #48
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	add	r7, sp, #40
	ldmia	r7, {r6-r7}
	adds	r3, r3, r1
	mov	r0, #2
	adc	r4, r4, r2
	mov	r1, #0
	adds	r6, r6, r0
	adc	r7, r7, r1
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	str	r1, [sp, #56]
	str	r2, [sp, #60]
	ldr	r2, [sp, #36]
	cmp	r2, r7
	str	r6, [sp, #40]
	str	r7, [sp, #44]
	bhi	.L23
	beq	.L26
.L19:
	add	r3, sp, #56
	ldmia	r3, {r2-r3}
.L13:
	ldr	r4, [sp, #100]
	ldr	r5, [sp, #60]
	cmp	r4, r5
	bhi	.L16
	beq	.L27
.L10:
	add	r3, sp, #56
	ldmia	r3, {r2-r3}
	add	r1, sp, #96
	ldmia	r1, {r0-r1}
	subs	r2, r2, r0
	sbc	r3, r3, r1
.L16:
	mov	r1, r3
	mov	r0, r2
	add	sp, sp, #64
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L26:
	ldr	r3, [sp, #32]
	cmp	r3, r6
	bhi	.L23
	b	.L19
.L27:
	ldr	r6, [sp, #96]
	ldr	r7, [sp, #56]
	cmp	r6, r7
	bhi	.L16
	b	.L10
.L24:
	mov	r6, #0
	mov	r7, #0
	str	r6, [sp, #56]
	str	r7, [sp, #60]
	b	.L10
.L25:
	mov	r5, #0
	mov	r6, #0
	str	r5, [sp, #56]
	str	r6, [sp, #60]
	mov	r2, r5
	mov	r3, r6
	b	.L13
	.size	montgomery_modular_multiplication, .-montgomery_modular_multiplication
	.global	__aeabi_uldivmod
	.align	2
	.global	multiply_and_square
	.type	multiply_and_square, %function
multiply_and_square:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 232
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #236
	add	r4, sp, #272
	ldmia	r4, {r4, r5}	@ phole ldm
	orrs	r4, r4, r5
	str	r0, [sp, #4]
	mov	fp, r1
	str	r2, [sp, #64]
	str	r3, [sp, #68]
	beq	.L29
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	mov	r1, #0
.L30:
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	orrs	r5, r2, r3
	add	r1, r1, #1
	bne	.L30
	mov	r0, #1
	mov	r0, r0, asl r1
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	mov	r1, r0, asr #31
	bl	__aeabi_uldivmod
	str	r3, [sp, #8]
	mul	r3, r2, r3
	umull	r0, r1, r2, r2
	mov	r3, r3, asl #1
	str	r2, [sp, #12]
	add	r1, r3, r1
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod
	str	r2, [sp, #72]
	str	r3, [sp, #76]
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	mov	r1, r5
.L31:
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	orrs	r6, r2, r3
	add	r1, r1, #1
	bne	.L31
	mov	r7, r1
	mov	r8, r7, asr #31
	add	r1, sp, #72
	ldmia	r1, {r0-r1}
	mov	r2, #1
	mov	r3, #0
	str	r7, [sp, #112]
	str	r8, [sp, #116]
	and	r0, r0, r2
	and	r1, r1, r3
	orrs	r7, r7, r8
	str	r0, [sp, #104]
	str	r1, [sp, #108]
	beq	.L92
	mov	r4, #0
	mov	r5, #0
	str	r4, [sp, #208]
	str	r5, [sp, #212]
	str	r4, [sp, #200]
	str	r5, [sp, #204]
.L88:
	ldr	r6, [sp, #200]
	ldr	r5, [sp, #4]
	mov	r3, r5, lsr r6
	rsb	r2, r6, #32
	orr	r3, r3, fp, asl r2
	subs	r1, r6, #32
	movpl	r3, fp, lsr r1
	mov	r4, fp, lsr r6
	add	ip, r6, #1
	mov	r5, r5, lsr ip
	mov	r1, #1
	mov	r2, #0
	and	r7, r3, r1
	and	r8, r4, r2
	add	sl, sp, #208
	ldmia	sl, {r9-sl}
	add	r4, sp, #104
	ldmia	r4, {r3-r4}
	and	r9, r9, r1
	and	sl, sl, r2
	and	r1, r7, r3
	and	r2, r8, r4
	eor	r3, r1, r9
	eor	r4, r2, sl
	ldr	lr, [sp, #72]
	str	r3, [sp, #56]
	str	r4, [sp, #60]
	ldr	r0, [sp, #56]
	umull	r3, r4, r7, lr
	ldr	lr, [sp, #272]
	umull	r1, r2, r0, lr
	rsb	r0, ip, #32
	orr	r5, r5, fp, asl r0
	ldr	r0, [sp, #76]
	ldr	r8, [sp, #56]
	mla	r4, r7, r0, r4
	ldr	r7, [sp, #276]
	mla	r2, r8, r7, r2
	add	r8, sp, #208
	ldmia	r8, {r7-r8}
	adds	r3, r3, r7
	adc	r4, r4, r8
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	subs	r2, r6, #31
	mov	r6, fp, lsr ip
	movpl	r5, fp, lsr r2
	str	r0, [sp, #96]
	str	r1, [sp, #100]
	mov	r3, #0
	mov	r2, #1
	and	r8, r6, r3
	add	sl, sp, #96
	ldmia	sl, {r9-sl}
	add	r4, sp, #104
	ldmia	r4, {r3-r4}
	ldr	ip, [sp, #72]
	and	r7, r5, r2
	and	r1, r7, r3
	and	r9, r9, r2
	umull	r3, r4, r7, ip
	eor	r5, r9, r1
	umull	r1, r2, r5, lr
	ldr	r0, [sp, #76]
	mla	r4, r7, r0, r4
	ldr	r7, [sp, #276]
	mla	r2, r5, r7, r2
	add	r6, sp, #96
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	add	r7, sp, #200
	ldmia	r7, {r6-r7}
	adds	r3, r3, r1
	mov	r0, #2
	adc	r4, r4, r2
	mov	r1, #0
	adds	r6, r6, r0
	adc	r7, r7, r1
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	str	r1, [sp, #208]
	str	r2, [sp, #212]
	ldr	r2, [sp, #116]
	cmp	r2, r7
	str	r6, [sp, #200]
	str	r7, [sp, #204]
	bhi	.L88
	beq	.L93
.L70:
	add	r5, sp, #208
	ldmia	r5, {r4-r5}
	str	r4, [sp, #88]
	str	r5, [sp, #92]
.L33:
	ldr	r5, [sp, #276]
	ldr	r6, [sp, #212]
	cmp	r5, r6
	bls	.L94
.L36:
	add	r3, sp, #64
	ldmia	r3, {r3, r4}	@ phole ldm
	orrs	r3, r3, r4
	beq	.L95
.L38:
	add	r0, sp, #8
	ldmia	r0, {r0, r3}	@ phole ldm
	mov	r1, r3
	mov	r2, r0
	add	r5, sp, #272
	ldmia	r5, {r5, r6}	@ phole ldm
	str	r1, [sp, #80]
	str	r2, [sp, #84]
	orr	lr, r5, r6
.L58:
	ldr	r7, [sp, #64]
	and	r3, r7, #1
	cmp	r3, #0
	bne	.L96
.L40:
	cmp	lr, #0
	beq	.L97
.L49:
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	mov	r1, #0
.L51:
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	orrs	r4, r2, r3
	add	r1, r1, #1
	bne	.L51
	mov	r5, r1
	mov	r6, r5, asr #31
	str	r5, [sp, #160]
	str	r6, [sp, #164]
	orrs	r5, r5, r6
	add	r7, sp, #88
	ldmia	r7, {r6-r7}
	mov	r0, #1
	mov	r1, #0
	and	r6, r6, r0
	and	r7, r7, r1
	str	r6, [sp, #152]
	str	r7, [sp, #156]
	beq	.L98
	mov	r2, #0
	mov	r3, #0
	str	r2, [sp, #224]
	str	r3, [sp, #228]
	str	r2, [sp, #184]
	str	r3, [sp, #188]
.L90:
	ldr	r4, [sp, #184]
	ldr	r3, [sp, #88]
	mov	r3, r3, lsr r4
	str	r3, [sp, #32]
	ldr	r7, [sp, #92]
	ldr	r6, [sp, #32]
	rsb	r3, r4, #32
	orr	r6, r6, r7, asl r3
	subs	r2, r4, #32
	mov	ip, r6
	movpl	ip, r7, lsr r2
	mov	r1, r7, lsr r4
	str	r6, [sp, #32]
	str	ip, [sp, #32]
	add	ip, r4, #1
	ldr	r4, [sp, #88]
	mov	r4, r4, lsr ip
	str	r1, [sp, #36]
	add	r6, sp, #32
	ldmia	r6, {r5-r6}
	mov	r7, #1
	str	r4, [sp, #24]
	and	r5, r5, r7
	add	r4, sp, #152
	ldmia	r4, {r3-r4}
	add	r8, sp, #224
	ldmia	r8, {r7-r8}
	mov	r0, #1
	and	r1, r5, r3
	and	r7, r7, r0
	eor	r9, r1, r7
	ldr	r8, [sp, #272]
	ldr	r7, [sp, #88]
	umull	r1, r2, r9, r8
	umull	r3, r4, r5, r7
	ldr	r8, [sp, #92]
	ldr	r7, [sp, #24]
	rsb	r0, ip, #32
	orr	r7, r7, r8, asl r0
	mla	r4, r5, r8, r4
	ldr	r5, [sp, #276]
	mla	r2, r9, r5, r2
	str	r7, [sp, #24]
	add	r7, sp, #224
	ldmia	r7, {r6-r7}
	adds	r3, r3, r6
	adc	r4, r4, r7
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r8, r4, lsr #1
	mov	r7, r3, rrx
	str	r7, [sp, #144]
	str	r8, [sp, #148]
	ldr	r8, [sp, #184]
	ldr	r1, [sp, #92]
	ldr	r0, [sp, #24]
	subs	r2, r8, #31
	movpl	r0, r1, lsr r2
	mov	r2, r1, lsr ip
	str	r0, [sp, #24]
	str	r2, [sp, #28]
	add	r6, sp, #24
	ldmia	r6, {r5-r6}
	add	r8, sp, #144
	ldmia	r8, {r7-r8}
	mov	r3, #1
	and	r5, r5, r3
	and	r7, r7, r3
	add	r4, sp, #152
	ldmia	r4, {r3-r4}
	and	r1, r5, r3
	eor	r9, r7, r1
	ldr	r7, [sp, #88]
	ldr	r8, [sp, #272]
	umull	r3, r4, r5, r7
	umull	r1, r2, r9, r8
	ldr	ip, [sp, #92]
	ldr	r0, [sp, #276]
	mla	r4, r5, ip, r4
	mla	r2, r9, r0, r2
	add	r6, sp, #144
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	add	r7, sp, #184
	ldmia	r7, {r6-r7}
	adds	r3, r3, r1
	mov	r0, #2
	adc	r4, r4, r2
	mov	r1, #0
	adds	r6, r6, r0
	adc	r7, r7, r1
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	str	r6, [sp, #184]
	str	r7, [sp, #188]
	str	r1, [sp, #224]
	str	r2, [sp, #228]
	ldr	r2, [sp, #164]
	cmp	r2, r7
	bhi	.L90
	beq	.L99
.L72:
	add	r5, sp, #224
	ldmia	r5, {r4-r5}
	str	r4, [sp, #88]
	str	r5, [sp, #92]
.L53:
	ldr	r5, [sp, #276]
	ldr	r6, [sp, #228]
	cmp	r5, r6
	bhi	.L56
	beq	.L100
.L50:
	add	r1, sp, #224
	ldmia	r1, {r0-r1}
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	subs	r0, r0, r2
	sbc	r1, r1, r3
	str	r0, [sp, #88]
	str	r1, [sp, #92]
.L56:
	add	r4, sp, #64
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [sp, #64]
	str	r4, [sp, #68]
	orrs	r3, r3, r4
	bne	.L58
.L39:
	add	r4, sp, #272
	ldmia	r4, {r4, r5}	@ phole ldm
	orrs	r4, r4, r5
	moveq	r2, #0
	moveq	r3, #0
	beq	.L60
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	mov	r1, #0
.L61:
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	orrs	r6, r2, r3
	add	r1, r1, #1
	bne	.L61
	mov	r7, r1
	mov	r8, r7, asr #31
	str	r7, [sp, #168]
	str	r8, [sp, #172]
	orrs	r7, r7, r8
	moveq	r2, #0
	moveq	r3, #0
	moveq	r9, r2
	moveq	sl, r3
	beq	.L63
	mov	r9, #0
	mov	sl, #0
	str	r9, [sp, #176]
	str	sl, [sp, #180]
.L91:
	ldr	lr, [sp, #176]
	ldr	r8, [sp, #80]
	mov	fp, r8, lsr lr
	ldr	r1, [sp, #84]
	rsb	r3, lr, #32
	orr	fp, fp, r1, asl r3
	subs	r2, lr, #32
	add	r0, lr, #1
	movpl	fp, r1, lsr r2
	mov	r8, r8, lsr r0
	mov	ip, r1, lsr lr
	mov	r1, #1
	and	r3, r9, r1
	and	r7, fp, r1
	str	r8, [sp, #16]
	eor	r5, r7, r3
	ldr	r3, [sp, #272]
	ldr	lr, [sp, #84]
	ldr	r4, [sp, #16]
	mov	r2, #0
	and	r8, ip, r2
	umull	r1, r2, r5, r3
	rsb	r3, r0, #32
	orr	r4, r4, lr, asl r3
	ldr	r3, [sp, #276]
	mla	r2, r5, r3, r2
	adds	r3, r7, r9
	str	r4, [sp, #16]
	adc	r4, r8, sl
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	sl, r4, lsr #1
	mov	r9, r3, rrx
	ldr	r4, [sp, #176]
	ldr	r5, [sp, #16]
	subs	r2, r4, #31
	movpl	r5, lr, lsr r2
	mov	r7, lr, lsr r0
	str	r5, [sp, #16]
	str	r7, [sp, #20]
	add	r8, sp, #16
	ldmia	r8, {r7-r8}
	mov	r3, #1
	and	r1, r9, r3
	and	r7, r7, r3
	ldr	lr, [sp, #272]
	eor	r5, r1, r7
	mov	r4, #0
	and	r8, r8, r4
	umull	r3, r4, r5, lr
	ldr	r0, [sp, #276]
	mla	r4, r5, r0, r4
	adds	r1, r9, r7
	adc	r2, sl, r8
	adds	r1, r1, r3
	adc	r2, r2, r4
	add	r4, sp, #176
	ldmia	r4, {r3-r4}
	mov	r5, #2
	adds	r3, r3, r5
	mov	r6, #0
	adc	r4, r4, r6
	ldr	r6, [sp, #172]
	movs	sl, r2, lsr #1
	mov	r9, r1, rrx
	cmp	r6, r4
	str	r3, [sp, #176]
	str	r4, [sp, #180]
	bhi	.L91
	beq	.L101
.L73:
	mov	r2, r9
	mov	r3, sl
.L63:
	ldr	r8, [sp, #276]
	cmp	r8, r3
	bls	.L102
.L66:
	mov	r1, sl
	mov	r0, r9
	add	sp, sp, #236
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L99:
	ldr	r3, [sp, #160]
	cmp	r3, r6
	bhi	.L90
	b	.L72
.L96:
	cmp	lr, #0
	beq	.L103
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	mov	r1, #0
.L43:
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	orrs	r4, r2, r3
	add	r1, r1, #1
	bne	.L43
	mov	r5, r1
	mov	r6, r5, asr #31
	str	r5, [sp, #136]
	str	r6, [sp, #140]
	orrs	r5, r5, r6
	add	r7, sp, #80
	ldmia	r7, {r6-r7}
	mov	r0, #1
	mov	r1, #0
	and	r6, r6, r0
	and	r7, r7, r1
	str	r6, [sp, #128]
	str	r7, [sp, #132]
	beq	.L104
	mov	r2, #0
	mov	r3, #0
	str	r2, [sp, #216]
	str	r3, [sp, #220]
	str	r2, [sp, #192]
	str	r3, [sp, #196]
.L89:
	ldr	r4, [sp, #192]
	ldr	r3, [sp, #88]
	mov	r3, r3, lsr r4
	str	r3, [sp, #48]
	ldr	r7, [sp, #92]
	ldr	r6, [sp, #48]
	rsb	r3, r4, #32
	orr	r6, r6, r7, asl r3
	subs	r2, r4, #32
	mov	ip, r6
	movpl	ip, r7, lsr r2
	mov	r1, r7, lsr r4
	str	r6, [sp, #48]
	str	ip, [sp, #48]
	add	ip, r4, #1
	ldr	r4, [sp, #88]
	mov	r4, r4, lsr ip
	str	r1, [sp, #52]
	add	r6, sp, #48
	ldmia	r6, {r5-r6}
	mov	r7, #1
	str	r4, [sp, #40]
	and	r5, r5, r7
	add	r4, sp, #128
	ldmia	r4, {r3-r4}
	add	r8, sp, #216
	ldmia	r8, {r7-r8}
	mov	r0, #1
	and	r1, r5, r3
	and	r7, r7, r0
	eor	r9, r1, r7
	ldr	r8, [sp, #272]
	ldr	r7, [sp, #80]
	umull	r1, r2, r9, r8
	umull	r3, r4, r5, r7
	ldr	r8, [sp, #92]
	ldr	r7, [sp, #40]
	rsb	r0, ip, #32
	orr	r7, r7, r8, asl r0
	ldr	r0, [sp, #84]
	mla	r4, r5, r0, r4
	ldr	r5, [sp, #276]
	mla	r2, r9, r5, r2
	str	r7, [sp, #40]
	add	r7, sp, #216
	ldmia	r7, {r6-r7}
	adds	r3, r3, r6
	adc	r4, r4, r7
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r8, r4, lsr #1
	mov	r7, r3, rrx
	str	r7, [sp, #120]
	str	r8, [sp, #124]
	ldr	r8, [sp, #192]
	ldr	r1, [sp, #92]
	ldr	r0, [sp, #40]
	subs	r2, r8, #31
	movpl	r0, r1, lsr r2
	mov	r2, r1, lsr ip
	str	r0, [sp, #40]
	str	r2, [sp, #44]
	add	r6, sp, #40
	ldmia	r6, {r5-r6}
	add	r8, sp, #120
	ldmia	r8, {r7-r8}
	mov	r3, #1
	and	r5, r5, r3
	and	r7, r7, r3
	add	r4, sp, #128
	ldmia	r4, {r3-r4}
	and	r1, r5, r3
	eor	r9, r7, r1
	ldr	r7, [sp, #80]
	ldr	r8, [sp, #272]
	umull	r3, r4, r5, r7
	umull	r1, r2, r9, r8
	ldr	ip, [sp, #84]
	ldr	r0, [sp, #276]
	mla	r4, r5, ip, r4
	mla	r2, r9, r0, r2
	add	r6, sp, #120
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	add	r7, sp, #192
	ldmia	r7, {r6-r7}
	adds	r3, r3, r1
	mov	r0, #2
	adc	r4, r4, r2
	mov	r1, #0
	adds	r6, r6, r0
	adc	r7, r7, r1
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	str	r6, [sp, #192]
	str	r7, [sp, #196]
	str	r1, [sp, #216]
	str	r2, [sp, #220]
	ldr	r2, [sp, #140]
	cmp	r2, r7
	bhi	.L89
	beq	.L105
.L71:
	add	r5, sp, #216
	ldmia	r5, {r4-r5}
	str	r4, [sp, #80]
	str	r5, [sp, #84]
.L45:
	ldr	r5, [sp, #276]
	ldr	r6, [sp, #220]
	cmp	r5, r6
	bhi	.L40
	beq	.L106
.L42:
	add	r1, sp, #216
	ldmia	r1, {r0-r1}
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	subs	r0, r0, r2
	sbc	r1, r1, r3
	cmp	lr, #0
	str	r0, [sp, #80]
	str	r1, [sp, #84]
	bne	.L49
.L97:
	mov	r3, #0
	mov	r4, #0
	str	r3, [sp, #224]
	str	r4, [sp, #228]
	b	.L50
.L105:
	ldr	r3, [sp, #136]
	cmp	r3, r6
	bhi	.L89
	b	.L71
.L93:
	ldr	r3, [sp, #112]
	cmp	r3, r6
	bhi	.L88
	b	.L70
.L101:
	ldr	r7, [sp, #168]
	cmp	r7, r3
	bhi	.L91
	b	.L73
.L100:
	ldr	r7, [sp, #272]
	ldr	r8, [sp, #224]
	cmp	r7, r8
	bhi	.L56
	b	.L50
.L102:
	beq	.L107
.L60:
	add	sl, sp, #272
	ldmia	sl, {r9-sl}
	subs	r9, r2, r9
	sbc	sl, r3, sl
	b	.L66
.L94:
	beq	.L108
.L68:
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	add	r1, sp, #208
	ldmia	r1, {r0-r1}
	ldr	r4, [sp, #68]
	subs	r0, r0, r2
	sbc	r1, r1, r3
	ldr	r3, [sp, #64]
	orrs	r3, r3, r4
	str	r0, [sp, #88]
	str	r1, [sp, #92]
	bne	.L38
.L95:
	add	r0, sp, #8
	ldmia	r0, {r0, r3}	@ phole ldm
	mov	r1, r3
	mov	r2, r0
	str	r1, [sp, #80]
	str	r2, [sp, #84]
	b	.L39
.L106:
	ldr	r7, [sp, #272]
	ldr	r8, [sp, #216]
	cmp	r7, r8
	bhi	.L40
	b	.L42
.L103:
	mov	r0, #0
	mov	r1, #0
	str	r0, [sp, #216]
	str	r1, [sp, #220]
	b	.L42
.L107:
	ldr	ip, [sp, #272]
	cmp	ip, r2
	bhi	.L66
	b	.L60
.L108:
	ldr	r7, [sp, #272]
	ldr	r8, [sp, #208]
	cmp	r7, r8
	bhi	.L36
	b	.L68
.L29:
	mov	r0, #1
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_uldivmod
	mov	r0, #0
	mov	r1, #0
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	str	r0, [sp, #208]
	str	r1, [sp, #212]
	b	.L68
.L92:
	mov	r1, #0
	mov	r2, #0
	str	r1, [sp, #208]
	str	r2, [sp, #212]
	str	r1, [sp, #88]
	str	r2, [sp, #92]
	b	.L33
.L104:
	mov	r1, #0
	mov	r2, #0
	str	r1, [sp, #80]
	str	r2, [sp, #84]
	str	r1, [sp, #216]
	str	r2, [sp, #220]
	b	.L45
.L98:
	mov	r1, #0
	mov	r2, #0
	str	r1, [sp, #88]
	str	r2, [sp, #92]
	str	r1, [sp, #224]
	str	r2, [sp, #228]
	b	.L53
	.size	multiply_and_square, .-multiply_and_square
	.align	2
	.global	encrypt_plaintext
	.type	encrypt_plaintext, %function
encrypt_plaintext:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	multiply_and_square
	.size	encrypt_plaintext, .-encrypt_plaintext
	.align	2
	.global	decrypt_cyphertext
	.type	decrypt_cyphertext, %function
decrypt_cyphertext:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	multiply_and_square
	.size	decrypt_cyphertext, .-decrypt_cyphertext
	.align	2
	.global	loop_encrypt_decrypt_routine
	.type	loop_encrypt_decrypt_routine, %function
loop_encrypt_decrypt_routine:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r4, #9961472
	sub	sp, sp, #28
	add	r4, r4, #38400
	add	r4, r4, #128
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	mov	r9, #852
	str	r4, [sp, #12]
	mov	sl, r2
	mov	fp, r3
	add	r9, r9, #3
	mov	r8, #0
.L118:
	add	r6, sp, #72
	ldmia	r6, {r5-r6}
	mov	r2, sl
	mov	r3, fp
	add	r1, sp, #16
	ldmia	r1, {r0-r1}
	stmia	sp, {r5-r6}
	bl	multiply_and_square
	mov	r4, r0
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L127
	mov	r5, r1
	bl	printf
	add	r7, sp, #72
	ldmia	r7, {r6-r7}
	add	r3, sp, #64
	ldmia	r3, {r2-r3}
	mov	r0, r4
	mov	r1, r5
	stmia	sp, {r6-r7}
	bl	multiply_and_square
	mov	r6, r0
	mov	r2, r6
	ldr	r0, .L127+4
	mov	r3, r1
	mov	r7, r1
	bl	printf
	cmp	r4, r9
	beq	.L125
.L120:
	ldr	r0, .L127+8
	ldr	r1, .L127+12
	mov	r2, #110
	ldr	r3, .L127+16
	bl	__assert_fail
.L125:
	cmp	r5, #0
	bne	.L120
	cmp	r6, #123
	beq	.L126
.L121:
	ldr	r0, .L127+20
	ldr	r1, .L127+12
	mov	r2, #111
	ldr	r3, .L127+16
	bl	__assert_fail
.L126:
	cmp	r7, #0
	bne	.L121
	ldr	r7, [sp, #12]
	add	r8, r8, #1
	cmp	r8, r7
	bne	.L118
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L128:
	.align	2
.L127:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LANCHOR0
	.word	.LC4
	.size	loop_encrypt_decrypt_routine, .-loop_encrypt_decrypt_routine
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	sl, #3232
	sub	sp, sp, #20
	add	sl, sl, #1
	mov	fp, #0
	mov	r2, #61
	mov	r3, #0
	mov	r4, #53
	mov	r5, #0
	ldr	r0, .L131
	stmia	sp, {r4-r5}
	str	sl, [sp, #8]
	str	fp, [sp, #12]
	mov	r4, #52
	bl	printf
	mov	r5, #0
	mov	r2, #60
	mov	r3, #0
	mov	r6, #3120
	mov	r7, #0
	mov	r8, #2752
	ldr	r0, .L131+4
	add	r8, r8, #1
	mov	r9, #0
	stmia	sp, {r4-r5}
	str	r6, [sp, #8]
	str	r7, [sp, #12]
	bl	printf
	mov	r2, #17
	mov	r3, #0
	ldr	r0, .L131+8
	bl	printf
	mov	r2, r8
	mov	r3, r9
	ldr	r0, .L131+12
	bl	printf
	ldr	r0, .L131+16
	bl	puts
	mov	r4, #17
	mov	r5, #0
	mov	r2, sl
	mov	r3, fp
	ldr	r0, .L131+20
	stmia	sp, {r4-r5}
	bl	printf
	mov	r2, sl
	mov	r3, fp
	ldr	r0, .L131+24
	stmia	sp, {r8-r9}
	bl	printf
	mov	r2, r4
	mov	r3, r5
	mov	r0, #123
	mov	r1, #0
	stmia	sp, {r8-r9}
	str	sl, [sp, #8]
	str	fp, [sp, #12]
	bl	loop_encrypt_decrypt_routine
	mov	r0, #0
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.size	main, .-main
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__PRETTY_FUNCTION__.1875, %object
	.size	__PRETTY_FUNCTION__.1875, 29
__PRETTY_FUNCTION__.1875:
	.ascii	"loop_encrypt_decrypt_routine\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Computed cypher text: %llu\012\000"
.LC1:
	.ascii	"Computed plain text: %llu\012\000"
	.space	1
.LC2:
	.ascii	"855 == cyphertext\000"
	.space	2
.LC3:
	.ascii	"mmm-sw-optmized.c\000"
	.space	2
.LC4:
	.ascii	"123 == decrypted_plaintext\000"
	.space	1
.LC5:
	.ascii	"P: %llu, Q: %llu, N=P*Q: %llu\012\000"
	.space	1
.LC6:
	.ascii	"P-1: %llu, Q-1: %llu, (P-1)(Q-1): %llu\012\000"
.LC7:
	.ascii	"E (coprime to (P-1)(Q-1)): %llu\012\000"
	.space	3
.LC8:
	.ascii	"Private exponent D: %llu\012\000"
	.space	2
.LC9:
	.ascii	"D*E = 1 mod [(P-1)(Q-1)] is satisfied\012\000"
	.space	1
.LC10:
	.ascii	"The public key is (N,E) = (%llu,%llu)\012\000"
	.space	1
.LC11:
	.ascii	"The private key is (N,D) = (%llu,%llu)\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
