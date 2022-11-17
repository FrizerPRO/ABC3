	.file	"func.c"
	.intel_syntax noprefix
	.text
	.globl	findPi
	.type	findPi, @function
findPi:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	movsd	QWORD PTR -24[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 1
	jmp	.L2
.L3:
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, DWORD PTR -12[rbp]
	movq	rax, xmm2
	movsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L2:
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1
	movq	xmm0, rax
	call	sqrt@PLT
	movsd	xmm1, QWORD PTR .LC4[rip]
	subsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC5[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -24[rbp]
	ja	.L3
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1
	movq	xmm0, rax
	call	sqrt@PLT
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	findPi, .-findPi
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1075314688
	.align 8
.LC4:
	.long	1413754136
	.long	1074340347
	.align 8
.LC5:
	.long	0
	.long	1079574528
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
