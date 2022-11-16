	.file	"func.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fstack-clash-protection -fcf-protection
	.text
	.globl	findPi
	.type	findPi, @function
findPi:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 32	#,
	movsd	QWORD PTR -24[rbp], xmm0	# получаю accuracy из 1-го параметра accurancy
# ./func.c:3:     double res = 0;
	pxor	xmm0, xmm0	# tmp93
	movsd	QWORD PTR -8[rbp], xmm0	# res, tmp93
# ./func.c:4:     int counter = 1;
	mov	DWORD PTR -12[rbp], 1	# counter,
# ./func.c:5:     while(100*(M_PI - sqrt(6*res))/M_PI > accurancy){
	jmp	.L2	#
.L3:
# ./func.c:6:         res += 1/pow(counter,2);
	pxor	xmm2, xmm2	# _1
	cvtsi2sd	xmm2, DWORD PTR -12[rbp]	# _1, counter
	movq	rax, xmm2	# _1, _1
	movsd	xmm0, QWORD PTR .LC1[rip]	# tmp94,
	movapd	xmm1, xmm0	# 2 как 2 параметр
	movq	xmm0, rax	# counter как 1 параметр
	call	pow@PLT	#
# ./func.c:6:         res += 1/pow(counter,2);
	movsd	xmm1, QWORD PTR .LC2[rip]	# tmp95,
	divsd	xmm1, xmm0	# деление
# ./func.c:6:         res += 1/pow(counter,2);
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp97, res
	addsd	xmm0, xmm1	# tmp96, _20
	movsd	QWORD PTR -8[rbp], xmm0	# res, tmp96
# ./func.c:7:         counter += 1;    
	add	DWORD PTR -12[rbp], 1	# counter,
.L2:
# ./func.c:5:     while(100*(M_PI - sqrt(6*res))/M_PI > accurancy){
	movsd	xmm1, QWORD PTR -8[rbp]	# tmp98, res
	movsd	xmm0, QWORD PTR .LC3[rip]	# tmp99,
	mulsd	xmm1, xmm0	# tmp98, tmp99
	movq	rax, xmm1	# _3, tmp98
	movq	xmm0, rax	# 6*res как 1 параметр
	call	sqrt@PLT	#
# ./func.c:5:     while(100*(M_PI - sqrt(6*res))/M_PI > accurancy){
	movsd	xmm1, QWORD PTR .LC4[rip]	# tmp100,
	subsd	xmm1, xmm0	# _5, _4
# ./func.c:5:     while(100*(M_PI - sqrt(6*res))/M_PI > accurancy){
	movsd	xmm0, QWORD PTR .LC5[rip]	# tmp101,
	mulsd	xmm0, xmm1	# _6, _5
# ./func.c:5:     while(100*(M_PI - sqrt(6*res))/M_PI > accurancy){
	movsd	xmm1, QWORD PTR .LC4[rip]	# tmp102,
	divsd	xmm0, xmm1	# _7, tmp102
# ./func.c:5:     while(100*(M_PI - sqrt(6*res))/M_PI > accurancy){
	comisd	xmm0, QWORD PTR -24[rbp]	# _7, accurancy
	ja	.L3	#,
# ./func.c:10:     return sqrt(6*res);
	movsd	xmm1, QWORD PTR -8[rbp]	# tmp103, res
	movsd	xmm0, QWORD PTR .LC3[rip]	# tmp104,
	mulsd	xmm1, xmm0	# tmp103, tmp104
	movq	rax, xmm1	# _8, tmp103
	movq	xmm0, rax	# 6*res как 1 параметр
	call	sqrt@PLT	#
	movq	rax, xmm0	# _18,
# ./func.c:11: }
	movq	xmm0, rax	#, <retval>
	leave	
	ret	
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
