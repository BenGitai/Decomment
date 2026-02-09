	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleNormal
	.type	handleNormal, %function
handleNormal:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 1
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L5
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
.L3:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormal, .-handleNormal
	.align	2
	.global	handleSlash
	.type	handleSlash, %function
handleSlash:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 44]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	w0, [sp, 44]
	cmp	w0, 42
	bne	.L7
	mov	w0, 32
	bl	putchar
	ldr	x0, [sp, 32]
	ldr	w1, [x0]
	ldr	x0, [sp, 24]
	str	w1, [x0]
	mov	w0, 2
	b	.L8
.L7:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
	cmp	w0, 47
	bne	.L9
	mov	w0, 1
	b	.L8
.L9:
	ldr	w0, [sp, 44]
	cmp	w0, 34
	bne	.L10
	ldr	w0, [sp, 44]
	bl	putchar
	mov	w0, 4
	b	.L8
.L10:
	ldr	w0, [sp, 44]
	cmp	w0, 39
	bne	.L11
	ldr	w0, [sp, 44]
	bl	putchar
	mov	w0, 4
	b	.L8
.L11:
	ldr	w0, [sp, 44]
	bl	putchar
	mov	w0, 0
.L8:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleSlash, .-handleSlash
	.align	2
	.global	handleComment
	.type	handleComment, %function
handleComment:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L13
	mov	w0, 3
	b	.L14
.L13:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L15
	mov	w0, 10
	bl	putchar
.L15:
	mov	w0, 2
.L14:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleComment, .-handleComment
	.align	2
	.global	handleStar
	.type	handleStar, %function
handleStar:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L17
	mov	w0, 0
	b	.L18
.L17:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L19
	mov	w0, 3
	b	.L18
.L19:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L20
	mov	w0, 10
	bl	putchar
.L20:
	mov	w0, 2
.L18:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleStar, .-handleStar
	.align	2
	.global	handleChar
	.type	handleChar, %function
handleChar:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L22
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
	b	.L23
.L22:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L24
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	b	.L23
.L24:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
.L23:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleChar, .-handleChar
	.align	2
	.global	handleEscapeChar
	.type	handleEscapeChar, %function
handleEscapeChar:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleEscapeChar, .-handleEscapeChar
	.align	2
	.global	handleString
	.type	handleString, %function
handleString:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L28
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
	b	.L29
.L28:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L30
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	b	.L29
.L30:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
.L29:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleString, .-handleString
	.align	2
	.global	handleEscapeString
	.type	handleEscapeString, %function
handleEscapeString:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleEscapeString, .-handleEscapeString
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	w0, 1
	str	w0, [sp, 20]
	str	wzr, [sp, 16]
	str	wzr, [sp, 28]
	b	.L34
.L45:
	ldr	w0, [sp, 24]
	cmp	w0, 10
	bne	.L35
	ldr	w0, [sp, 20]
	add	w0, w0, 1
	str	w0, [sp, 20]
.L35:
	ldr	w0, [sp, 28]
	cmp	w0, 7
	beq	.L36
	ldr	w0, [sp, 28]
	cmp	w0, 7
	bhi	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 6
	beq	.L38
	ldr	w0, [sp, 28]
	cmp	w0, 6
	bhi	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 5
	beq	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 5
	bhi	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 4
	beq	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 4
	bhi	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 3
	beq	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bhi	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L42
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bhi	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 0
	beq	.L43
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L44
	b	.L37
.L43:
	add	x0, sp, 20
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleNormal
	str	w0, [sp, 28]
	b	.L34
.L44:
	add	x1, sp, 16
	add	x0, sp, 20
	mov	x2, x1
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleSlash
	str	w0, [sp, 28]
	b	.L34
.L42:
	add	x0, sp, 20
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleComment
	str	w0, [sp, 28]
	b	.L34
.L41:
	add	x0, sp, 20
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleStar
	str	w0, [sp, 28]
	b	.L34
.L39:
	add	x0, sp, 20
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleChar
	str	w0, [sp, 28]
	b	.L34
.L36:
	add	x0, sp, 20
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleEscapeChar
	str	w0, [sp, 28]
	b	.L34
.L40:
	add	x0, sp, 20
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleString
	str	w0, [sp, 28]
	b	.L34
.L38:
	add	x0, sp, 20
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleEscapeString
	str	w0, [sp, 28]
	b	.L34
.L37:
.L50:
	nop
.L34:
	bl	getchar
	str	w0, [sp, 24]
	ldr	w0, [sp, 24]
	cmn	w0, #1
	bne	.L45
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L46
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bne	.L47
.L46:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w0, [sp, 16]
	mov	w2, w0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	b	.L49
.L47:
	mov	w0, 0
.L49:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-11)"
	.section	.note.GNU-stack,"",@progbits
