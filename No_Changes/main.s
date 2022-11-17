	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	timespecDiff
	.type	timespecDiff, @function
timespecDiff:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	rax, rsi
	mov	r8, rdi
	mov	rsi, r8
	mov	rdi, r9
	mov	rdi, rax
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -48[rbp], rdx
	mov	QWORD PTR -40[rbp], rcx
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	imul	rax, rax, 1000000000
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	imul	rax, rax, 1000000000
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -8[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	timespecDiff, .-timespecDiff
	.section	.rodata
.LC0:
	.string	"1"
.LC1:
	.string	"%lf"
.LC2:
	.string	"2"
.LC3:
	.string	"r"
.LC4:
	.string	"File doesn't exist."
.LC5:
	.string	"3"
.LC8:
	.string	"%lf\n"
.LC10:
	.string	"accurancy must be >0 && <=100"
.LC11:
	.string	"Elapsed: %ld ns\n"
.LC12:
	.string	"Result = %lf"
.LC13:
	.string	"w"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	DWORD PTR -116[rbp], edi
	mov	QWORD PTR -128[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -100[rbp], 1
	mov	DWORD PTR -92[rbp], 0
	cmp	DWORD PTR -116[rbp], 1
	je	.L4
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L5
.L4:
	lea	rax, -88[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L6
.L5:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -72[rbp], rax
	cmp	QWORD PTR -72[rbp], 0
	jne	.L8
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L17
.L8:
	lea	rdx, -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L6
.L7:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L6
	call	rand@PLT
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC6[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -88[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movq	xmm0, rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	cmp	DWORD PTR -116[rbp], 3
	jne	.L6
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -100[rbp], eax
.L6:
	movsd	xmm0, QWORD PTR -88[rbp]
	comisd	xmm0, QWORD PTR .LC6[rip]
	ja	.L10
	movsd	xmm1, QWORD PTR -88[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jb	.L19
.L10:
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L17
.L19:
	lea	rax, -48[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	DWORD PTR -96[rbp], 0
	jmp	.L13
.L14:
	mov	rax, QWORD PTR -88[rbp]
	movq	xmm0, rax
	call	findPi@PLT
	movq	rax, xmm0
	mov	QWORD PTR -80[rbp], rax
	add	DWORD PTR -96[rbp], 1
.L13:
	mov	eax, DWORD PTR -96[rbp]
	cmp	eax, DWORD PTR -100[rbp]
	jl	.L14
	lea	rax, -32[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rdi, QWORD PTR -32[rbp]
	mov	rsi, QWORD PTR -24[rbp]
	mov	rcx, rdx
	mov	rdx, rax
	call	timespecDiff
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -80[rbp]
	movq	xmm0, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	cmp	DWORD PTR -116[rbp], 1
	jle	.L15
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L15
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	cmp	QWORD PTR -56[rbp], 0
	jne	.L16
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L17
.L16:
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L15:
	mov	eax, 0
.L17:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC6:
	.long	0
	.long	1079574528
	.align 8
.LC7:
	.long	-4194304
	.long	1105199103
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
