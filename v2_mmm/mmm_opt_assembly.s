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
	.file	"test_opt.c"
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
	stmfd	sp!, {r4, r5}
	moveq	r2, #0
	moveq	r3, #0
	beq	.L3
	mov	r2, #0
	mov	r3, #0
	mov	r4, #1
	mov	r5, #0
.L4:
	movs	r1, r1, lsr #1
	mov	r0, r0, rrx
	adds	r2, r2, r4
	adc	r3, r3, r5
	orrs	ip, r0, r1
	bne	.L4
.L3:
	mov	r1, r3
	mov	r0, r2
	ldmfd	sp!, {r4, r5}
	bx	lr
	.size	get_num_bits, .-get_num_bits
	.align	2
	.global	montgomery_modular_multiplication
	.type	montgomery_modular_multiplication, %function
montgomery_modular_multiplication:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	sub	sp, sp, #88
	add	r4, sp, #120
	ldmia	r4, {r4, r5}	@ phole ldm
	orrs	r4, r4, r5
	str	r0, [sp, #32]
	str	r1, [sp, #36]
	str	r2, [sp, #24]
	str	r3, [sp, #28]
	beq	.L24
	mov	r4, #0
	mov	r5, #0
	str	r4, [sp, #56]
	str	r5, [sp, #60]
	add	r3, sp, #120
	ldmia	r3, {r2-r3}
	mov	r7, #1
	mov	r8, #0
.L11:
	add	r6, sp, #56
	ldmia	r6, {r5-r6}
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	adds	r5, r5, r7
	adc	r6, r6, r8
	str	r5, [sp, #56]
	str	r6, [sp, #60]
	orrs	r6, r2, r3
	mov	r0, #1
	mov	r1, #0
	bne	.L11
	add	r3, sp, #24
	ldmia	r3, {r2-r3}
	ldr	ip, [sp, #60]
	and	r2, r2, r0
	and	r3, r3, r1
	orrs	r5, r5, ip
	str	r2, [sp, #48]
	str	r3, [sp, #52]
	beq	.L25
	add	r4, sp, #32
	ldmia	r4, {r3-r4}
	add	ip, sp, #32
	ldmia	ip, {fp-ip}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	mov	r5, #0
	mov	r6, #0
	str	r5, [sp, #80]
	str	r6, [sp, #84]
	and	fp, fp, r0
	and	r5, r3, r0
	and	r6, r4, r1
	mov	r0, #0
	mov	r1, #0
	str	r5, [sp, #40]
	str	r6, [sp, #44]
	str	r0, [sp, #64]
	str	r1, [sp, #68]
.L23:
	add	r2, sp, #48
	ldmia	r2, {r1-r2}
	and	r5, fp, r1
	add	r2, sp, #80
	ldmia	r2, {r1-r2}
	mov	r3, #1
	and	r1, r1, r3
	eor	r8, r5, r1
	ldr	r5, [sp, #24]
	ldr	r7, [sp, #64]
	umull	r3, r4, fp, r5
	ldr	r5, [sp, #32]
	add	sl, r7, #2
	mov	r5, r5, lsr sl
	ldr	r6, [sp, #120]
	umull	r1, r2, r8, r6
	ldr	r6, [sp, #32]
	add	r0, r7, #3
	mov	r6, r6, lsr r0
	str	r0, [sp, #12]
	ldr	r0, [sp, #28]
	str	r5, [sp, #16]
	ldr	r5, [sp, #124]
	mla	r4, fp, r0, r4
	mla	r2, r8, r5, r2
	str	r6, [sp, #0]
	add	r6, sp, #80
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #72]
	str	r1, [sp, #76]
	add	r6, sp, #40
	ldmia	r6, {r5-r6}
	add	r2, sp, #48
	ldmia	r2, {r1-r2}
	and	r5, r5, r1
	and	r6, r6, r2
	add	r2, sp, #72
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	eor	r8, r1, r5
	eor	r9, r2, r6
	ldr	r5, [sp, #40]
	ldr	r6, [sp, #24]
	umull	r3, r4, r5, r6
	ldr	r6, [sp, #36]
	ldr	r5, [sp, #16]
	rsb	r0, sl, #32
	orr	r5, r5, r6, asl r0
	ldr	ip, [sp, #120]
	ldr	r0, [sp, #12]
	str	r5, [sp, #16]
	ldr	r5, [sp, #0]
	umull	r1, r2, r8, ip
	rsb	ip, r0, #32
	orr	r5, r5, r6, asl ip
	ldr	r0, [sp, #40]
	ldr	ip, [sp, #28]
	str	r5, [sp, #0]
	ldr	r5, [sp, #124]
	mla	r4, r0, ip, r4
	mla	r2, r8, r5, r2
	add	r6, sp, #72
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #80]
	str	r1, [sp, #84]
	ldr	r3, [sp, #36]
	ldr	r1, [sp, #16]
	subs	r2, r7, #30
	movpl	r1, r3, lsr r2
	str	r1, [sp, #16]
	ldr	r4, [sp, #0]
	subs	r7, r7, #29
	ldr	r0, [sp, #12]
	movpl	r4, r3, lsr r7
	mov	ip, r3, lsr r0
	mov	r6, r3, lsr sl
	add	r2, sp, #64
	ldmia	r2, {r1-r2}
	mov	r3, #2
	adds	r1, r1, r3
	str	r4, [sp, #0]
	mov	r4, #0
	adc	r2, r2, r4
	str	ip, [sp, #4]
	str	r6, [sp, #20]
	str	r1, [sp, #64]
	str	r2, [sp, #68]
	ldr	r4, [sp, #60]
	ldmia	sp, {r0-r1}
	mov	r5, #1
	add	ip, sp, #16
	ldmia	ip, {fp-ip}
	mov	r6, #0
	and	r0, r0, r5
	and	r1, r1, r6
	cmp	r4, r2
	and	fp, fp, r5
	str	r0, [sp, #40]
	str	r1, [sp, #44]
	bhi	.L23
	beq	.L26
.L19:
	add	r3, sp, #80
	ldmia	r3, {r2-r3}
.L13:
	ldr	r4, [sp, #124]
	ldr	r5, [sp, #84]
	cmp	r4, r5
	bhi	.L16
	beq	.L27
.L10:
	add	r3, sp, #80
	ldmia	r3, {r2-r3}
	add	r1, sp, #120
	ldmia	r1, {r0-r1}
	subs	r2, r2, r0
	sbc	r3, r3, r1
.L16:
	mov	r1, r3
	mov	r0, r2
	add	sp, sp, #88
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L26:
	ldr	r1, [sp, #56]
	ldr	r2, [sp, #64]
	cmp	r1, r2
	bhi	.L23
	b	.L19
.L27:
	ldr	r6, [sp, #120]
	ldr	ip, [sp, #80]
	cmp	r6, ip
	bhi	.L16
	b	.L10
.L24:
	mov	r0, #0
	mov	r1, #0
	str	r0, [sp, #80]
	str	r1, [sp, #84]
	b	.L10
.L25:
	mov	r3, #0
	mov	r4, #0
	str	r3, [sp, #80]
	str	r4, [sp, #84]
	mov	r2, r3
	mov	r3, r4
	b	.L13
	.size	montgomery_modular_multiplication, .-montgomery_modular_multiplication
	.global	__aeabi_uldivmod
	.align	2
	.global	multiply_and_square
	.type	multiply_and_square, %function
multiply_and_square:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 288
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #292
	add	r4, sp, #328
	ldmia	r4, {r4, r5}	@ phole ldm
	orrs	r4, r4, r5
	str	r0, [sp, #88]
	str	r1, [sp, #92]
	str	r2, [sp, #80]
	str	r3, [sp, #84]
	beq	.L29
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	mov	r7, #0
	mov	r8, #0
	mov	r0, #1
	mov	r1, #0
.L30:
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	adds	r7, r7, r0
	adc	r8, r8, r1
	orrs	r6, r2, r3
	bne	.L30
	mov	r0, #1
	mov	r0, r0, asl r7
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	mov	r1, r0, asr #31
	bl	__aeabi_uldivmod
	str	r3, [sp, #8]
	mul	r3, r2, r3
	umull	r0, r1, r2, r2
	mov	r3, r3, asl #1
	str	r2, [sp, #12]
	add	r1, r3, r1
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r0, #0
	mov	r1, #0
	str	r0, [sp, #144]
	str	r1, [sp, #148]
	str	r2, [sp, #96]
	str	r3, [sp, #100]
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	mov	r7, #1
	mov	r8, #0
.L31:
	add	r5, sp, #144
	ldmia	r5, {r4-r5}
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	adds	r4, r4, r7
	adc	r5, r5, r8
	str	r4, [sp, #144]
	str	r5, [sp, #148]
	orrs	r5, r2, r3
	mov	r0, #1
	mov	r1, #0
	bne	.L31
	add	r3, sp, #96
	ldmia	r3, {r2-r3}
	ldr	r6, [sp, #148]
	and	r2, r2, r0
	and	r3, r3, r1
	orrs	r4, r4, r6
	str	r2, [sp, #136]
	str	r3, [sp, #140]
	beq	.L92
	add	r4, sp, #88
	ldmia	r4, {r3-r4}
	add	ip, sp, #88
	ldmia	ip, {fp-ip}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	mov	r5, #0
	mov	r6, #0
	str	r5, [sp, #280]
	str	r6, [sp, #284]
	and	fp, fp, r0
	and	r5, r3, r0
	and	r6, r4, r1
	mov	r0, #0
	mov	r1, #0
	str	r5, [sp, #128]
	str	r6, [sp, #132]
	str	r0, [sp, #256]
	str	r1, [sp, #260]
.L88:
	add	r2, sp, #136
	ldmia	r2, {r1-r2}
	and	r5, fp, r1
	add	r2, sp, #280
	ldmia	r2, {r1-r2}
	mov	r3, #1
	and	r1, r1, r3
	eor	r8, r5, r1
	ldr	r5, [sp, #96]
	ldr	r7, [sp, #256]
	umull	r3, r4, fp, r5
	ldr	r5, [sp, #88]
	add	lr, r7, #3
	mov	r5, r5, lsr lr
	ldr	r6, [sp, #328]
	ldr	r0, [sp, #88]
	umull	r1, r2, r8, r6
	add	sl, r7, #2
	mov	r0, r0, lsr sl
	ldr	r6, [sp, #100]
	ldr	ip, [sp, #332]
	mla	r4, fp, r6, r4
	mla	r2, r8, ip, r2
	str	r5, [sp, #64]
	add	r6, sp, #280
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r0, [sp, #72]
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #120]
	str	r1, [sp, #124]
	add	r6, sp, #128
	ldmia	r6, {r5-r6}
	add	r2, sp, #136
	ldmia	r2, {r1-r2}
	and	r5, r5, r1
	and	r6, r6, r2
	add	r2, sp, #120
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	eor	r8, r1, r5
	eor	r9, r2, r6
	ldr	r5, [sp, #128]
	ldr	r6, [sp, #96]
	umull	r3, r4, r5, r6
	ldr	r5, [sp, #72]
	ldr	r6, [sp, #92]
	ldr	ip, [sp, #328]
	rsb	r0, sl, #32
	orr	r5, r5, r6, asl r0
	ldr	r0, [sp, #64]
	umull	r1, r2, r8, ip
	rsb	ip, lr, #32
	orr	r0, r0, r6, asl ip
	ldr	r6, [sp, #100]
	ldr	ip, [sp, #128]
	str	r0, [sp, #64]
	ldr	r0, [sp, #332]
	mla	r4, ip, r6, r4
	mla	r2, r8, r0, r2
	str	r5, [sp, #72]
	add	r6, sp, #120
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #280]
	str	r1, [sp, #284]
	ldr	r3, [sp, #92]
	ldr	r1, [sp, #72]
	subs	r2, r7, #30
	ldr	r4, [sp, #64]
	movpl	r1, r3, lsr r2
	subs	r7, r7, #29
	movpl	r4, r3, lsr r7
	mov	ip, r3, lsr lr
	mov	r6, r3, lsr sl
	str	r1, [sp, #72]
	str	r4, [sp, #64]
	add	r1, sp, #256
	ldmia	r1, {r0-r1}
	mov	r2, #2
	adds	r0, r0, r2
	mov	r3, #0
	adc	r1, r1, r3
	ldr	r3, [sp, #148]
	str	ip, [sp, #68]
	str	r6, [sp, #76]
	str	r0, [sp, #256]
	str	r1, [sp, #260]
	cmp	r3, r1
	add	r1, sp, #64
	ldmia	r1, {r0-r1}
	mov	r4, #1
	add	ip, sp, #72
	ldmia	ip, {fp-ip}
	mov	r5, #0
	and	r0, r0, r4
	and	r1, r1, r5
	and	fp, fp, r4
	str	r0, [sp, #128]
	str	r1, [sp, #132]
	bhi	.L88
	beq	.L93
.L70:
	add	r4, sp, #280
	ldmia	r4, {r3-r4}
	str	r3, [sp, #264]
	str	r4, [sp, #268]
.L33:
	ldr	r4, [sp, #332]
	ldr	r5, [sp, #284]
	cmp	r4, r5
	bls	.L94
.L36:
	add	r3, sp, #80
	ldmia	r3, {r3, r4}	@ phole ldm
	orrs	r3, r3, r4
	beq	.L95
.L38:
	add	r0, sp, #8
	ldmia	r0, {r0, r3}	@ phole ldm
	add	r5, sp, #328
	ldmia	r5, {r5, r6}	@ phole ldm
	mov	r1, r3
	mov	r2, r0
	orr	r5, r5, r6
	str	r1, [sp, #272]
	str	r2, [sp, #276]
	str	r5, [sp, #4]
.L58:
	ldr	ip, [sp, #80]
	and	r3, ip, #1
	cmp	r3, #0
	bne	.L96
.L40:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L97
.L49:
	mov	r5, #0
	mov	r6, #0
	str	r5, [sp, #208]
	str	r6, [sp, #212]
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	mov	r0, r5
	mov	r1, r6
.L51:
	mov	r4, #1
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	mov	r5, #0
	adds	r0, r0, r4
	adc	r1, r1, r5
	orrs	r5, r2, r3
	str	r0, [sp, #208]
	str	r1, [sp, #212]
	bne	.L51
	orrs	r0, r0, r1
	beq	.L98
	add	r2, sp, #264
	ldmia	r2, {r1-r2}
	mov	r5, #1
	mov	r6, #0
	add	r4, sp, #264
	ldmia	r4, {r3-r4}
	and	r1, r1, r5
	and	r2, r2, r6
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r1, [sp, #192]
	str	r2, [sp, #196]
	mov	r0, #0
	mov	r1, #0
	and	r2, r4, r6
	str	r0, [sp, #112]
	str	r1, [sp, #116]
	and	r1, r3, r5
	str	r1, [sp, #200]
	str	r2, [sp, #204]
	mov	r3, #0
	mov	r2, #0
	str	r2, [sp, #240]
	str	r3, [sp, #244]
	add	ip, sp, #192
	ldmia	ip, {fp-ip}
.L90:
	add	r4, sp, #192
	ldmia	r4, {r3-r4}
	add	r2, sp, #112
	ldmia	r2, {r1-r2}
	and	r5, fp, r3
	mov	r3, #1
	ldr	r7, [sp, #240]
	and	r1, r1, r3
	eor	r8, r5, r1
	ldr	r5, [sp, #264]
	add	sl, r7, #2
	add	lr, r7, #3
	umull	r3, r4, fp, r5
	mov	r0, r5, lsr sl
	mov	r5, r5, lsr lr
	ldr	r6, [sp, #328]
	umull	r1, r2, r8, r6
	ldr	r6, [sp, #268]
	ldr	ip, [sp, #332]
	mla	r4, fp, r6, r4
	mla	r2, r8, ip, r2
	str	r5, [sp, #32]
	add	r6, sp, #112
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r0, [sp, #40]
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #184]
	str	r1, [sp, #188]
	add	r6, sp, #200
	ldmia	r6, {r5-r6}
	add	r2, sp, #192
	ldmia	r2, {r1-r2}
	and	r5, r5, r1
	and	r6, r6, r2
	add	r2, sp, #184
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	eor	r8, r1, r5
	eor	r9, r2, r6
	ldr	r5, [sp, #200]
	ldr	r6, [sp, #264]
	umull	r3, r4, r5, r6
	ldr	r6, [sp, #268]
	ldr	r5, [sp, #40]
	ldr	ip, [sp, #328]
	rsb	r0, sl, #32
	orr	r5, r5, r6, asl r0
	ldr	r0, [sp, #32]
	umull	r1, r2, r8, ip
	rsb	ip, lr, #32
	orr	r0, r0, r6, asl ip
	ldr	ip, [sp, #200]
	str	r0, [sp, #32]
	ldr	r0, [sp, #332]
	mla	r4, ip, r6, r4
	mla	r2, r8, r0, r2
	str	r5, [sp, #40]
	add	r6, sp, #184
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #112]
	str	r1, [sp, #116]
	ldr	r3, [sp, #268]
	ldr	r1, [sp, #40]
	subs	r2, r7, #30
	movpl	r1, r3, lsr r2
	ldr	r4, [sp, #32]
	subs	r7, r7, #29
	movpl	r4, r3, lsr r7
	mov	ip, r3, lsr lr
	mov	r6, r3, lsr sl
	str	r1, [sp, #40]
	add	r1, sp, #240
	ldmia	r1, {r0-r1}
	mov	r2, #2
	adds	r0, r0, r2
	mov	r3, #0
	adc	r1, r1, r3
	str	r4, [sp, #32]
	str	ip, [sp, #36]
	str	r6, [sp, #44]
	str	r0, [sp, #240]
	str	r1, [sp, #244]
	ldr	r3, [sp, #212]
	cmp	r3, r1
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	r4, #1
	add	ip, sp, #40
	ldmia	ip, {fp-ip}
	mov	r5, #0
	and	r0, r0, r4
	and	r1, r1, r5
	and	fp, fp, r4
	str	r0, [sp, #200]
	str	r1, [sp, #204]
	bhi	.L90
	beq	.L99
.L72:
	add	r4, sp, #112
	ldmia	r4, {r3-r4}
	str	r3, [sp, #264]
	str	r4, [sp, #268]
.L53:
	ldr	r4, [sp, #332]
	ldr	r5, [sp, #116]
	cmp	r4, r5
	bhi	.L56
	beq	.L100
.L50:
	add	r1, sp, #112
	ldmia	r1, {r0-r1}
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	subs	r0, r0, r2
	sbc	r1, r1, r3
	str	r0, [sp, #264]
	str	r1, [sp, #268]
.L56:
	add	r4, sp, #80
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [sp, #80]
	str	r4, [sp, #84]
	orrs	r3, r3, r4
	bne	.L58
.L39:
	add	r4, sp, #328
	ldmia	r4, {r4, r5}	@ phole ldm
	orrs	r4, r4, r5
	moveq	r2, #0
	moveq	r3, #0
	beq	.L60
	mov	r0, #0
	mov	r1, #0
	str	r0, [sp, #224]
	str	r1, [sp, #228]
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	mov	r7, #1
	mov	r8, #0
.L61:
	add	r5, sp, #224
	ldmia	r5, {r4-r5}
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	adds	r4, r4, r7
	adc	r5, r5, r8
	str	r4, [sp, #224]
	str	r5, [sp, #228]
	orrs	r5, r2, r3
	mov	r0, #1
	mov	r1, #0
	bne	.L61
	ldr	r6, [sp, #228]
	orrs	r4, r4, r6
	moveq	r2, #0
	moveq	r3, #0
	moveq	sl, r2
	moveq	fp, r3
	beq	.L63
	add	r4, sp, #272
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	mov	sl, #0
	mov	fp, #0
	and	r5, r3, r0
	and	r6, r4, r1
	add	r8, sp, #272
	ldmia	r8, {r7-r8}
	str	r5, [sp, #216]
	str	r6, [sp, #220]
	str	sl, [sp, #232]
	str	fp, [sp, #236]
	and	r7, r7, r0
	and	r8, r8, r1
.L91:
	eor	r3, sl, r7
	mov	r0, #1
	and	r5, r3, r0
	ldr	r0, [sp, #232]
	ldr	r4, [sp, #272]
	add	ip, r0, #2
	mov	r4, r4, lsr ip
	ldr	r3, [sp, #328]
	umull	r1, r2, r5, r3
	ldr	r3, [sp, #272]
	add	lr, r0, #3
	mov	r3, r3, lsr lr
	str	r4, [sp, #24]
	ldr	r4, [sp, #332]
	mla	r2, r5, r4, r2
	str	r3, [sp, #16]
	adds	r3, r7, sl
	adc	r4, r8, fp
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	sl, r4, lsr #1
	mov	r9, r3, rrx
	add	r2, sp, #216
	ldmia	r2, {r1-r2}
	ldr	r4, [sp, #276]
	ldr	r2, [sp, #24]
	rsb	r3, ip, #32
	orr	r2, r2, r4, asl r3
	eor	r1, r1, r9
	mov	r5, #1
	and	r7, r1, r5
	ldr	r1, [sp, #328]
	umull	r5, r6, r7, r1
	ldr	r1, [sp, #16]
	str	r2, [sp, #24]
	rsb	r2, lr, #32
	orr	r1, r1, r4, asl r2
	ldr	r4, [sp, #332]
	mla	r6, r7, r4, r6
	add	r4, sp, #216
	ldmia	r4, {r3-r4}
	adds	r3, r3, r9
	adc	r4, r4, sl
	adds	r3, r3, r5
	adc	r4, r4, r6
	ldr	r5, [sp, #24]
	ldr	r6, [sp, #276]
	movs	fp, r4, lsr #1
	mov	sl, r3, rrx
	subs	r2, r0, #30
	movpl	r5, r6, lsr r2
	subs	r0, r0, #29
	str	r1, [sp, #16]
	movpl	r1, r6, lsr r0
	mov	r4, r6, lsr lr
	mov	r3, r6, lsr ip
	str	r5, [sp, #24]
	add	r6, sp, #232
	ldmia	r6, {r5-r6}
	mov	r0, #2
	adds	r5, r5, r0
	str	r1, [sp, #16]
	mov	r1, #0
	adc	r6, r6, r1
	str	r4, [sp, #20]
	str	r3, [sp, #28]
	str	r5, [sp, #232]
	str	r6, [sp, #236]
	ldr	r1, [sp, #228]
	add	r5, sp, #16
	ldmia	r5, {r4-r5}
	add	r8, sp, #24
	ldmia	r8, {r7-r8}
	mov	r2, #1
	mov	r3, #0
	and	r4, r4, r2
	and	r5, r5, r3
	cmp	r1, r6
	and	r7, r7, r2
	and	r8, r8, r3
	str	r4, [sp, #216]
	str	r5, [sp, #220]
	bhi	.L91
	beq	.L101
.L73:
	mov	r2, sl
	mov	r3, fp
.L63:
	ldr	ip, [sp, #332]
	cmp	ip, r3
	bls	.L102
.L66:
	mov	r1, fp
	mov	r0, sl
	add	sp, sp, #292
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L99:
	ldr	r1, [sp, #208]
	ldr	r2, [sp, #240]
	cmp	r1, r2
	bhi	.L90
	b	.L72
.L96:
	ldr	lr, [sp, #4]
	cmp	lr, #0
	beq	.L103
	mov	r5, #0
	mov	r4, #0
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	str	r4, [sp, #176]
	str	r5, [sp, #180]
	mov	r6, r5
	mov	r5, r4
.L43:
	mov	r0, #1
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	mov	r1, #0
	adds	r5, r5, r0
	adc	r6, r6, r1
	orrs	r1, r2, r3
	str	r5, [sp, #176]
	str	r6, [sp, #180]
	bne	.L43
	add	r3, sp, #272
	ldmia	r3, {r2-r3}
	orrs	r5, r5, r6
	mov	r4, #1
	mov	r5, #0
	and	r2, r2, r4
	and	r3, r3, r5
	str	r2, [sp, #168]
	str	r3, [sp, #172]
	beq	.L104
	add	r4, sp, #264
	ldmia	r4, {r3-r4}
	mov	r0, #0
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	mov	r1, #0
	mov	r5, #1
	mov	r6, #0
	str	r0, [sp, #104]
	str	r1, [sp, #108]
	and	r2, r4, r6
	and	r1, r3, r5
	str	r1, [sp, #160]
	str	r2, [sp, #164]
	mov	r0, #0
	mov	r1, #0
	add	ip, sp, #264
	ldmia	ip, {fp-ip}
	str	r0, [sp, #248]
	str	r1, [sp, #252]
	and	fp, fp, r5
.L89:
	add	r2, sp, #168
	ldmia	r2, {r1-r2}
	and	r5, fp, r1
	add	r2, sp, #104
	ldmia	r2, {r1-r2}
	mov	r3, #1
	and	r1, r1, r3
	eor	r8, r5, r1
	ldr	r5, [sp, #272]
	ldr	r7, [sp, #248]
	umull	r3, r4, fp, r5
	ldr	r5, [sp, #264]
	add	lr, r7, #3
	mov	r5, r5, lsr lr
	ldr	r6, [sp, #328]
	ldr	r0, [sp, #264]
	umull	r1, r2, r8, r6
	add	sl, r7, #2
	mov	r0, r0, lsr sl
	ldr	r6, [sp, #276]
	ldr	ip, [sp, #332]
	mla	r4, fp, r6, r4
	mla	r2, r8, ip, r2
	str	r5, [sp, #48]
	add	r6, sp, #104
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r0, [sp, #56]
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #152]
	str	r1, [sp, #156]
	add	r6, sp, #160
	ldmia	r6, {r5-r6}
	add	r2, sp, #168
	ldmia	r2, {r1-r2}
	and	r5, r5, r1
	and	r6, r6, r2
	add	r2, sp, #152
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	eor	r8, r1, r5
	eor	r9, r2, r6
	ldr	r5, [sp, #160]
	ldr	r6, [sp, #272]
	umull	r3, r4, r5, r6
	ldr	r5, [sp, #56]
	ldr	r6, [sp, #268]
	ldr	ip, [sp, #328]
	rsb	r0, sl, #32
	orr	r5, r5, r6, asl r0
	ldr	r0, [sp, #48]
	umull	r1, r2, r8, ip
	rsb	ip, lr, #32
	orr	r0, r0, r6, asl ip
	ldr	r6, [sp, #276]
	ldr	ip, [sp, #160]
	str	r0, [sp, #48]
	ldr	r0, [sp, #332]
	mla	r4, ip, r6, r4
	mla	r2, r8, r0, r2
	str	r5, [sp, #56]
	add	r6, sp, #152
	ldmia	r6, {r5-r6}
	adds	r3, r3, r5
	adc	r4, r4, r6
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	str	r0, [sp, #104]
	str	r1, [sp, #108]
	ldr	r3, [sp, #268]
	ldr	r1, [sp, #56]
	subs	r2, r7, #30
	ldr	r4, [sp, #48]
	movpl	r1, r3, lsr r2
	subs	r7, r7, #29
	movpl	r4, r3, lsr r7
	mov	ip, r3, lsr lr
	mov	r6, r3, lsr sl
	str	r1, [sp, #56]
	str	r4, [sp, #48]
	add	r1, sp, #248
	ldmia	r1, {r0-r1}
	mov	r2, #2
	adds	r0, r0, r2
	mov	r3, #0
	adc	r1, r1, r3
	ldr	r3, [sp, #180]
	str	ip, [sp, #52]
	str	r6, [sp, #60]
	str	r0, [sp, #248]
	str	r1, [sp, #252]
	cmp	r3, r1
	add	r1, sp, #48
	ldmia	r1, {r0-r1}
	mov	r4, #1
	add	ip, sp, #56
	ldmia	ip, {fp-ip}
	mov	r5, #0
	and	r0, r0, r4
	and	r1, r1, r5
	and	fp, fp, r4
	str	r0, [sp, #160]
	str	r1, [sp, #164]
	bhi	.L89
	beq	.L105
.L71:
	add	r4, sp, #104
	ldmia	r4, {r3-r4}
	str	r3, [sp, #272]
	str	r4, [sp, #276]
.L45:
	ldr	r4, [sp, #332]
	ldr	r5, [sp, #108]
	cmp	r4, r5
	bhi	.L40
	beq	.L106
.L42:
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	add	r1, sp, #104
	ldmia	r1, {r0-r1}
	subs	r0, r0, r2
	sbc	r1, r1, r3
	ldr	r3, [sp, #4]
	cmp	r3, #0
	str	r0, [sp, #272]
	str	r1, [sp, #276]
	bne	.L49
.L97:
	mov	r4, #0
	mov	r5, #0
	str	r4, [sp, #112]
	str	r5, [sp, #116]
	b	.L50
.L105:
	ldr	r1, [sp, #176]
	ldr	r2, [sp, #248]
	cmp	r1, r2
	bhi	.L89
	b	.L71
.L93:
	ldr	r1, [sp, #144]
	ldr	r2, [sp, #256]
	cmp	r1, r2
	bhi	.L88
	b	.L70
.L101:
	ldr	r5, [sp, #224]
	ldr	r6, [sp, #232]
	cmp	r5, r6
	bhi	.L91
	b	.L73
.L100:
	ldr	r6, [sp, #328]
	ldr	ip, [sp, #112]
	cmp	r6, ip
	bhi	.L56
	b	.L50
.L102:
	beq	.L107
.L60:
	add	fp, sp, #328
	ldmia	fp, {sl-fp}
	subs	sl, r2, sl
	sbc	fp, r3, fp
	b	.L66
.L94:
	beq	.L108
.L68:
	add	r3, sp, #328
	ldmia	r3, {r2-r3}
	add	r1, sp, #280
	ldmia	r1, {r0-r1}
	ldr	r4, [sp, #84]
	subs	r0, r0, r2
	sbc	r1, r1, r3
	ldr	r3, [sp, #80]
	orrs	r3, r3, r4
	str	r0, [sp, #264]
	str	r1, [sp, #268]
	bne	.L38
.L95:
	add	r0, sp, #8
	ldmia	r0, {r0, r3}	@ phole ldm
	mov	r1, r3
	mov	r2, r0
	str	r1, [sp, #272]
	str	r2, [sp, #276]
	b	.L39
.L106:
	ldr	r6, [sp, #328]
	ldr	ip, [sp, #104]
	cmp	r6, ip
	bhi	.L40
	b	.L42
.L103:
	mov	r0, #0
	mov	r1, #0
	str	r0, [sp, #104]
	str	r1, [sp, #108]
	b	.L42
.L107:
	ldr	lr, [sp, #328]
	cmp	lr, r2
	bhi	.L66
	b	.L60
.L108:
	ldr	r6, [sp, #328]
	ldr	ip, [sp, #280]
	cmp	r6, ip
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
	str	r0, [sp, #280]
	str	r1, [sp, #284]
	b	.L68
.L92:
	mov	r3, #0
	mov	r4, #0
	str	r3, [sp, #280]
	str	r4, [sp, #284]
	str	r3, [sp, #264]
	str	r4, [sp, #268]
	b	.L33
.L104:
	mov	r5, #0
	mov	r6, #0
	str	r5, [sp, #272]
	str	r6, [sp, #276]
	str	r5, [sp, #104]
	str	r6, [sp, #108]
	b	.L45
.L98:
	mov	r0, #0
	mov	r1, #0
	str	r0, [sp, #264]
	str	r1, [sp, #268]
	str	r0, [sp, #112]
	str	r1, [sp, #116]
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
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	add	r5, sp, #40
	ldmia	r5, {r4-r5}
	stmia	sp, {r4-r5}
	bl	multiply_and_square
	mov	r6, r0
	mov	r2, r0
	mov	r3, r1
	mov	r7, r1
	ldr	r0, .L125
	bl	printf
	add	r3, sp, #32
	ldmia	r3, {r2-r3}
	mov	r0, r6
	mov	r1, r7
	stmia	sp, {r4-r5}
	bl	multiply_and_square
	mov	r4, r0
	mov	r3, r1
	ldr	r0, .L125+4
	mov	r2, r4
	mov	r5, r1
	bl	printf
	mov	r3, #852
	add	r3, r3, #3
	cmp	r6, r3
	beq	.L123
.L119:
	ldr	r0, .L125+8
	ldr	r1, .L125+12
	mov	r2, #113
	ldr	r3, .L125+16
	bl	__assert_fail
.L123:
	cmp	r7, #0
	bne	.L119
	cmp	r4, #123
	beq	.L124
.L120:
	ldr	r0, .L125+20
	ldr	r1, .L125+12
	mov	r2, #114
	ldr	r3, .L125+16
	bl	__assert_fail
.L124:
	cmp	r5, #0
	bne	.L120
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L126:
	.align	2
.L125:
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
	ldr	r0, .L129
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
	ldr	r0, .L129+4
	add	r8, r8, #1
	mov	r9, #0
	stmia	sp, {r4-r5}
	str	r6, [sp, #8]
	str	r7, [sp, #12]
	bl	printf
	mov	r2, #17
	mov	r3, #0
	ldr	r0, .L129+8
	bl	printf
	mov	r2, r8
	mov	r3, r9
	ldr	r0, .L129+12
	bl	printf
	ldr	r0, .L129+16
	bl	puts
	mov	r4, #17
	mov	r5, #0
	mov	r2, sl
	mov	r3, fp
	ldr	r0, .L129+20
	stmia	sp, {r4-r5}
	bl	printf
	mov	r2, sl
	mov	r3, fp
	ldr	r0, .L129+24
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
.L130:
	.align	2
.L129:
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
	.type	__PRETTY_FUNCTION__.1882, %object
	.size	__PRETTY_FUNCTION__.1882, 29
__PRETTY_FUNCTION__.1882:
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
	.ascii	"test_opt.c\000"
	.space	1
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
