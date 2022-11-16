	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fstack-clash-protection -fcf-protection
	# -32[rbp] ->rbx # timeA.tv_sec
	# -24[rbp] ->r12d # timeA.tv_nsec
	# -48[rbp] ->r13 # timeB.tv_sec
	# -40[rbp] ->r14 # timeB.tv_nsec
	# -8[rbp]  ->r15 # nsecA

	
	.text
	.globl	timespecDiff
	.type	timespecDiff, @function
timespecDiff:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	mov	rbx, rdi	# timeA.tv_sec из 1-го параметра 
	mov	r12, rsi	# timeA.tv_nsec из 2-го параметра
	mov	r13, rdx	# timeB.tv_sec  из 3-го параметра
	mov	r14, rcx	# timeB.tv_nsec  из 4-го параметра
# ./main.c:16:     nsecA = timeA.tv_sec;
	mov	rax, rbx	# rax <- timeA.tv_sec
	mov	r15, rax	# nsecA <- rax
# ./main.c:17:     nsecA *= 1000000000;
	mov	rax, r15	# rax <- nsecA
	imul	rax, rax, 1000000000	# rax*=100000000
	mov	r15, rax	# nsecA <- rax
# ./main.c:18:     nsecA += timeA.tv_nsec;
	mov	rax, r12	# _1, timeA.tv_nsec
# ./main.c:18:     nsecA += timeA.tv_nsec;
	add	r15, rax	# nsecA, _1
# ./main.c:20:     nsecB = timeB.tv_sec;
	mov	rax, r13	# rax <- timeB.tv_sec
	mov	QWORD PTR -16[rbp], rax	# nsecB <- rax
# ./main.c:21:     nsecB *= 1000000000;
	mov	rax, QWORD PTR -16[rbp]	# rax <- nsecB
	imul	rax, rax, 1000000000	# rax*=100000000
	mov	QWORD PTR -16[rbp], rax	# nsecB <- rax
# ./main.c:22:     nsecB += timeB.tv_nsec;
	mov	rax, r14	# _2, timeB.tv_nsec
# ./main.c:22:     nsecB += timeB.tv_nsec;
	add	QWORD PTR -16[rbp], rax	# nsecB, _2
# ./main.c:24:     return nsecA - nsecB;
	mov	rax, r15	# tmp95, nsecA
	sub	rax, QWORD PTR -16[rbp]	# _10, nsecB
# ./main.c:25: }
	pop	rbp	#
	ret	
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 112	#,
	mov	DWORD PTR -100[rbp], edi	# argc из 1-го параметра
	mov	QWORD PTR -112[rbp], rsi	# argv из 2-го параметра
# ./main.c:31:     int count = 1;
	mov	DWORD PTR -12[rbp], 1	# count,
# ./main.c:36:     int i = 0;
	mov	DWORD PTR -20[rbp], 0	# i,
# ./main.c:39:     if(argc == 1 || strcmp(argv[1], "1") == 0){
	cmp	DWORD PTR -100[rbp], 1	# argc,
	je	.L4	#,
# ./main.c:39:     if(argc == 1 || strcmp(argv[1], "1") == 0){
	mov	rax, QWORD PTR -112[rbp]	# tmp110, argv
	add	rax, 8	# _1,
# ./main.c:39:     if(argc == 1 || strcmp(argv[1], "1") == 0){
	
	lea	rdx, .LC0[rip]	# tmp111,
	mov	rsi, rdx	# текст в 2-й параметр
	mov	rdi, QWORD PTR [rax]	# argv[1] в 1-й параметр

	call	strcmp@PLT	#
# ./main.c:39:     if(argc == 1 || strcmp(argv[1], "1") == 0){
	test	eax, eax	# _3
	jne	.L5	#,
.L4:
# ./main.c:40:         scanf("%lf",&accuracy);
	lea	rax, -56[rbp]	# tmp112,
	mov	rsi, rax	# accuracy как 2 параметр
	lea	rax, .LC1[rip]	# tmp113,
	mov	rdi, rax	# текст в 1-й параметр
	mov	eax, 0	#,
	call	__isoc99_scanf@PLT	#
	jmp	.L6	#
.L5:
# ./main.c:41:     } else if(strcmp(argv[1], "2") == 0){
	mov	rax, QWORD PTR -112[rbp]	# rax<-argv
	add	rax, 8	# _4,
# ./main.c:41:     } else if(strcmp(argv[1], "2") == 0){
	lea	rdx, .LC2[rip]	# tmp115,
	mov	rsi, rdx	# текст в 2-й параметр
	mov	rdi, QWORD PTR [rax]	# argv[1] в 1-й параметр
	call	strcmp@PLT	#
# ./main.c:41:     } else if(strcmp(argv[1], "2") == 0){
	test	eax, eax	# _6
	jne	.L7	#,
# ./main.c:42:         FILE *fread = fopen(argv[2], "r");
	mov	rax, QWORD PTR -112[rbp]	#  rax<-argv
	add	rax, 16	# _7,
# ./main.c:42:         FILE *fread = fopen(argv[2], "r");
	lea	rdx, .LC3[rip]	# tmp117,
	mov	rsi, rdx	# текст в 2-й параметр
	mov	rdi, QWORD PTR [rax]	# argv[2] в 1 параметр
	call	fopen@PLT	#
	mov	QWORD PTR -32[rbp], rax	# fread, tmp118
# ./main.c:43:         if(fread == NULL){
	cmp	QWORD PTR -32[rbp], 0	# fread,
	jne	.L8	#,
# ./main.c:44:             printf("File doesn't exist.");
	lea	rax, .LC4[rip]	# tmp119,
	mov	rdi, rax	# текст в 1-й параметр
	mov	eax, 0	#,
	call	printf@PLT	#
# ./main.c:45:             return 0;
	mov	eax, 0	# _30,
	jmp	.L17	#
.L8:
# ./main.c:47:             fscanf(fread,"%lf",&accuracy);
	lea	rdx, -56[rbp]	# tmp120,
	mov	rdi, QWORD PTR -32[rbp]	# fread в первый параметр
	lea	rcx, .LC1[rip]	# tmp122,
	mov	rsi, rcx	# текст в 2-й параметр
	mov	eax, 0	#,
	call	__isoc99_fscanf@PLT	#
# ./main.c:49:          fclose(fread);
	mov	rax, QWORD PTR -32[rbp]	# tmp123, fread
	mov	rdi, rax	#, tmp123
	call	fclose@PLT	#
	jmp	.L6	#
.L7:
# ./main.c:50:     } else if(strcmp(argv[1], "3") == 0){
	mov	rax, QWORD PTR -112[rbp]	# rax<-argv
	add	rax, 8	# _9,
# ./main.c:50:     } else if(strcmp(argv[1], "3") == 0){
	mov	rax, QWORD PTR [rax]	# _10, *_9
	lea	rdx, .LC5[rip]	# tmp125,
	mov	rsi, rdx	# текст в 2-й параметр
	mov	rdi, rax	#, _10
	call	strcmp@PLT	#
# ./main.c:50:     } else if(strcmp(argv[1], "3") == 0){
	test	eax, eax	# _11
	jne	.L6	#,
# ./main.c:51:         accuracy = 100*(double)rand()/RAND_MAX;
	call	rand@PLT	#
# ./main.c:51:         accuracy = 100*(double)rand()/RAND_MAX;
	pxor	xmm1, xmm1	# _13
	cvtsi2sd	xmm1, eax	# _13, _12
# ./main.c:51:         accuracy = 100*(double)rand()/RAND_MAX;
	movsd	xmm0, QWORD PTR .LC6[rip]	# tmp126,
	mulsd	xmm0, xmm1	# _14, _13
# ./main.c:51:         accuracy = 100*(double)rand()/RAND_MAX;
	movsd	xmm1, QWORD PTR .LC7[rip]	# tmp127,
	divsd	xmm0, xmm1	# _15, tmp127
# ./main.c:51:         accuracy = 100*(double)rand()/RAND_MAX;
	movsd	QWORD PTR -56[rbp], xmm0	# accuracy, _15
# ./main.c:52:         printf("%lf\n", accuracy); 
	mov	rax, QWORD PTR -56[rbp]	# accuracy.0_16, accuracy
	movq	xmm0, rax	#, accuracy.0_16
	lea	rax, .LC8[rip]	# tmp128,
	mov	rdi, rax	# текст в 1-й параметр
	mov	eax, 1	#,
	call	printf@PLT	#
# ./main.c:53:         if(argc == 3){
	cmp	DWORD PTR -100[rbp], 3	# argc,
	jne	.L6	#,
# ./main.c:54:             count = atoi(argv[2]);
	mov	rax, QWORD PTR -112[rbp]	# rax<-argv
	add	rax, 16	# _17,
# ./main.c:54:             count = atoi(argv[2]);
	mov	rdi, QWORD PTR [rax]	# argv[2]
	call	atoi@PLT	#
	mov	DWORD PTR -12[rbp], eax	# count <- возвращаемое значение из функции
.L6:
# ./main.c:57:     if(accuracy > 100 || accuracy <= 0){
	movsd	xmm0, QWORD PTR -56[rbp]	# accuracy.1_19, accuracy
# ./main.c:57:     if(accuracy > 100 || accuracy <= 0){
	comisd	xmm0, QWORD PTR .LC6[rip]	# accuracy.1_19,
	ja	.L10	#,
# ./main.c:57:     if(accuracy > 100 || accuracy <= 0){
	movsd	xmm1, QWORD PTR -56[rbp]	# accuracy.2_20, accuracy
# ./main.c:57:     if(accuracy > 100 || accuracy <= 0){
	pxor	xmm0, xmm0	# tmp131
	comisd	xmm0, xmm1	# tmp131, accuracy.2_20
	jb	.L18	#,
.L10:
# ./main.c:58:         printf("accurancy must be >0 && <=100");
	lea	rax, .LC10[rip]	# tmp132,
	mov	rdi, rax	# текст в 1-й параметр
	mov	eax, 0	#,
	call	printf@PLT	#
# ./main.c:59:         return 0;
	mov	eax, 0	# _30,
	jmp	.L17	#
.L18:
# ./main.c:62:     clock_gettime(CLOCK_MONOTONIC, &start);
	lea	rax, -80[rbp]	# tmp133,
	mov	rsi, rax	# start в 2-й параметр
	mov	edi, 1	#,
	call	clock_gettime@PLT	#
# ./main.c:63:     for (int j = 0; j < count; j++)
	mov	DWORD PTR -16[rbp], 0	# j,
# ./main.c:63:     for (int j = 0; j < count; j++)
	jmp	.L13	#
.L14:
# ./main.c:65:         result = findPi(accuracy);
	mov	rax, QWORD PTR -56[rbp]	# accuracy.3_21, accuracy
	movq	xmm0, rax	#, accuracy.3_21
	call	findPi@PLT	#
	movq	rax, xmm0	# tmp134,
	mov	QWORD PTR -8[rbp], rax	#  result<-rax
# ./main.c:63:     for (int j = 0; j < count; j++)
	add	DWORD PTR -16[rbp], 1	# j,
.L13:
# ./main.c:63:     for (int j = 0; j < count; j++)
	mov	eax, DWORD PTR -16[rbp]	# tmp135, j
	cmp	eax, DWORD PTR -12[rbp]	# сравниеваю count и j
	jl	.L14	#,
# ./main.c:67:     clock_gettime(CLOCK_MONOTONIC, &end);
	lea	rax, -96[rbp]	# tmp136,
	mov	rsi, rax	# end в 2-й параметр
	mov	edi, 1	#,
	call	clock_gettime@PLT	#
# ./main.c:68:     elapsed_ns = timespecDiff(end, start);
	mov	rdx, QWORD PTR -80[rbp]	# Передача begin.tv_nsec в 3 параметр
	mov	rcx, QWORD PTR -72[rbp]	# Передача begin.tv_sec в 4 параметр
	mov	rdi, QWORD PTR -96[rbp]	# Передача end.tv_sec в 1 параметр
	mov	rsi, QWORD PTR -88[rbp]	# Передача end.tv_nsec в 2 параметр
	call	timespecDiff	#
	mov	QWORD PTR -40[rbp], rax	# elapsed_ns, tmp140
# ./main.c:69:     printf("Elapsed: %ld ns\n", elapsed_ns);
	mov	rsi, QWORD PTR -40[rbp]	#  elapsed_ns во второй параметр
	lea	rax, .LC11[rip]	# tmp142,
	mov	rdi, rax	# текст в 1-й параметр
	mov	eax, 0	#,
	call	printf@PLT	#
# ./main.c:72:     printf("Result = %lf",result);
	mov	rax, QWORD PTR -8[rbp]	# rdx <- result
	movq	xmm0, rax	#, tmp143
	lea	rax, .LC12[rip]	# tmp144,
	mov	rdi, rax	# текст в 1-й параметр
	mov	eax, 1	#,
	call	printf@PLT	#
# ./main.c:73:      if(argc>1 && strcmp(argv[1], "2") == 0){
	cmp	DWORD PTR -100[rbp], 1	# argc,
	jle	.L15	#,
# ./main.c:73:      if(argc>1 && strcmp(argv[1], "2") == 0){
	mov	rax, QWORD PTR -112[rbp]	# rax<-argv
	add	rax, 8	# _22,
# ./main.c:73:      if(argc>1 && strcmp(argv[1], "2") == 0){
	mov	rdi, QWORD PTR [rax]	# argv[1] как первый параметр
	lea	rdx, .LC2[rip]	# tmp146,
	mov	rsi, rdx	# текст в 2-й параметр
	call	strcmp@PLT	#
# ./main.c:73:      if(argc>1 && strcmp(argv[1], "2") == 0){
	test	eax, eax	# _24
	jne	.L15	#,
# ./main.c:74:         FILE *fwrite = fopen(argv[3], "w");
	mov	rax, QWORD PTR -112[rbp]	# rax<-argv
	add	rax, 24	# _25,
# ./main.c:74:         FILE *fwrite = fopen(argv[3], "w");
	mov	rdi, QWORD PTR [rax]	# argv[3] как первый параметр
	lea	rdx, .LC13[rip]	# tmp148,
	mov	rsi, rdx	# текст в 2-й параметр

	call	fopen@PLT	#
	mov	QWORD PTR -48[rbp], rax	# fwrite, tmp149
# ./main.c:75:         if(fwrite == NULL){
	cmp	QWORD PTR -48[rbp], 0	# fwrite,
	jne	.L16	#,
# ./main.c:76:             printf("File doesn't exist.");
	lea	rax, .LC4[rip]	# tmp150,
	mov	rdi, rax	# текст в 1-й параметр
	mov	eax, 0	#,
	call	printf@PLT	#
# ./main.c:77:             return 1;
	mov	eax, 1	# _30,
	jmp	.L17	#
.L16:
# ./main.c:80:         fprintf(fwrite, "%lf\n", result);  
	mov	rdx, QWORD PTR -8[rbp]	# rdx<- result
	mov	rdi, QWORD PTR -48[rbp]	# fwrite в первый параметр
	movq	xmm0, rdx	#, tmp151
	lea	rdx, .LC8[rip]	# tmp153,
	mov	rsi, rdx	# текст в 2-й параметр
	mov	eax, 1	#,
	call	fprintf@PLT	#
# ./main.c:82:         fclose(fwrite);
	mov	rax, QWORD PTR -48[rbp]	# tmp154, fwrite
	mov	rdi, rax	#, tmp154
	call	fclose@PLT	#
.L15:
# ./main.c:84:     return 0;
	mov	eax, 0	# _30,
.L17:
# ./main.c:85: }
	leave	
	ret	
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
