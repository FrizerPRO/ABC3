Лебедев Петр Андреевич БПИ217 
Вариант 22:
Разработать программу вычисления числа π с точностью не хуже 0,1% посредством дзета-функции Римана
Тесты программы размещены в файлах input1.txt, ... , input3.txt. Соответственно выводы к ним в фалах output1.txt, ... , output3.txt

Отчет о выполнении задачи:

1 Написал программу на 9 баллов
  1.1 Правила работы программы:
  Ввод для программы  - это число(Необязательно целое)  (0,100] - процент точности.
  ./res <1 или ничего> - ввод из консоли, вывод в консоль
  ./res <2> <имя входного файла> <имя выходного файла> - ввод из файла, вывод в консоль и в файл
  ./res <3> <колличество повторных запусков (по умолчанию == 1)> - ввод рандомом, вывод в консоль
  
2 Получаю Ассемблерный файл с помощью комманда:
  "gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./main.c -S -o ./main.s"
  
3 Убираю лишние строки в программе:
  3.1 заменил или удалил:
  
-  	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
-	.section	.note.GNU-stack,"",@progbits
-	.section	.note.gnu.property,"a"
-	.align 8
-	.long	1f - 0f
-	.long	4f - 1f
-	.long	5
-0:
-	.string	"GNU"
-1:
-	.align 8
-	.long	0xc0000002
-	.long	3f - 2f
-2:
-	.long	0x3
-3:
-	.align 8
-4:
-	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
-	.section	.note.GNU-stack,"",@progbits
-	.section	.note.gnu.property,"a"
-	.align 8
-	.long	1f - 0f
-	.long	4f - 1f
-	.long	5
-0:
-	.string	"GNU"
-1:
-	.align 8
-	.long	0xc0000002
-	.long	3f - 2f
-2:
-	.long	0x3
-3:
-	.align 8
-4:

	-mov	rax, rsi	# tmp88, timeA
	-mov	r8, rdi	# tmp87, tmp87
	-mov	rsi, r8	# tmp86, tmp87
	-mov	rdi, r9	#,
	-mov	rdi, rax	#, tmp88
	-mov	QWORD PTR -32[rbp], rsi	# timeA.tv_sec
	-mov	QWORD PTR -24[rbp], rdi	# timeA.tv_nsec
	-mov	QWORD PTR -48[rbp], rdx	# timeB.tv_sec
	-mov	QWORD PTR -40[rbp], rcx	# timeB.tv_nsec
	на
	+mov	QWORD PTR -32[rbp], rdi	# timeA.tv_sec
	+mov	QWORD PTR -24[rbp], rsi	# timeA.tv_nsec
	+mov	QWORD PTR -48[rbp], rdx	# timeB.tv_sec
	+mov	QWORD PTR -40[rbp], rcx	# timeB.tv_nsec
	
	-endbr64
	-mov	rax, QWORD PTR [rax]	# _2, *_1
	-lea	rdx, .LC0[rip]	# tmp111,
	-mov	rsi, rdx	#, tmp111
	-mov	rdi, rax	#, _2
	на
	+lea	rdx, .LC2[rip]	# tmp115,
	+mov	rsi, rdx	#, tmp115
	+mov	rdi, QWORD PTR [rax]	# argv[1] в 1-й параметр

	
	-mov	rax, QWORD PTR [rax]	# _5, *_4
	-lea	rdx, .LC2[rip]	# tmp115,
	-mov	rsi, rdx	#, tmp115
	-mov	rdi, rax	# argv[1] в 1-й параметр
	на
	+lea	rdx, .LC2[rip]	# tmp115,
	+mov	rsi, rdx	#, tmp115
	+mov	rdi, QWORD PTR [rax]	# argv[1] в 1-й параметр
	
	-mov	rax, QWORD PTR [rax]	# _5, *_4
	-lea	rdx, .LC3[rip]	# tmp115,
	-mov	rsi, rdx	#, tmp115
	-mov	rdi, rax	# argv[2] в 1-й параметр
	на
	+lea	rdx, .LC3[rip]	# tmp115,
	+mov	rsi, rdx	#, tmp115
	+mov	rdi, QWORD PTR [rax]	# argv[2] в 1-й параметр
	
	-mov	rax, QWORD PTR [rax]	# _18, *_17
	-mov	rdi, rax	#, _18
	на
	+mov	rdi, QWORD PTR [rax]	# _18, *_17
	
	-mov	rax, QWORD PTR -80[rbp]	# Передача begin.tv_nsec в 3 параметр
	-mov	rdx, QWORD PTR -72[rbp]	# Передача begin.tv_sec в 4 параметр
	-mov	rdi, QWORD PTR -96[rbp]	# Передача end.tv_sec в 1 параметр
	-mov	rsi, QWORD PTR -88[rbp]	# Передача end.tv_nsec в 2 параметр
	-mov	rcx, rdx	#,
	-mov	rdx, rax	#, tmp137
	на
	+mov	rdx, QWORD PTR -80[rbp]	# Передача begin.tv_nsec в 3 параметр
	+mov	rcx, QWORD PTR -72[rbp]	# Передача begin.tv_sec в 4 параметр
	+mov	rdi, QWORD PTR -96[rbp]	# Передача end.tv_sec в 1 параметр
	+mov	rsi, QWORD PTR -88[rbp]	# Передача end.tv_nsec в 2 параметр
	
	-mov	rax, QWORD PTR [rax]	# _23, *_22
	-lea	rdx, .LC2[rip]	# tmp146,
	-mov	rsi, rdx	#, tmp146
	-mov	rdi, rax	#, _23
	на
	+mov	rdi, QWORD PTR [rax]	# _23, *_22
	+lea	rdx, .LC2[rip]	# tmp146,
	+mov	rsi, rdx	#, tmp146
	
	-mov	rax, QWORD PTR -40[rbp]	# tmp141, elapsed_ns
	-mov	rsi, rax	#, tmp141
	на
	+mov	rsi, QWORD PTR -40[rbp]	#  elapsed_ns во второй параметр
	
-		.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
-	.section	.note.GNU-stack,"",@progbits
-	.section	.note.gnu.property,"a"
-	.align 8
-	.long	1f - 0f
-	.long	4f - 1f
-	.long	5
-0:
-	.string	"GNU"
-1:
-	.align 8
-	.long	0xc0000002
-	.long	3f - 2f
-2:
-	.long	0x3
-3:
-	.align 8
-4:

	
4 Нашел соответствие переменных в коде.
	В main.c:
	getPi:
	-32[rbp]  # timeA.tv_sec
	-24[rbp]  # timeA.tv_nsec
	-48[rbp]  # timeB.tv_sec
	-40[rbp]  # timeB.tv_nsec
	-8[rbp]   # nsecA
	-16[rbp]  # nsecB
	main:
	-100[rbp] # argc
	-112[rbp] # argv
	-12[rbp]  # count
	-20[rbp]  # i
	-80[rbp]  # begin.tv_nsec
	-72[rbp]  # begin.tv_sec
	-96[rbp]  # end.tv_sec
	-88[rbp]  # end.tv_nsec
	-16[rbp]  # j
	-48[rbp]  # fwrite
	-8[rbp]	  # result
	-32[rbp]  # fread 
	-40[rbp]  # elapsed_ns
	-56[rbp]  # accuracy
	В func.c:
	-24[rbp]  # accurancy
	-8[rbp]   # res
	-12[rbp]  # counter
	
5 Заменил на регистры:
	main.c:
	-32[rbp] ->rbx # timeA.tv_sec
	-24[rbp] ->r12d # timeA.tv_nsec
	-48[rbp] ->r13 # timeB.tv_sec
	-40[rbp] ->r14 # timeB.tv_nsec
	-8[rbp]  ->r15 # nsecA
6 Примечание:
	Тестировал программу после каждого измененного регистра и каждого пункта 1-5. Тестировал в  том числе и на входных данных из файлов.
	
7 Сравнение размеров программ:
  Откоммпилированная без регистров с модификациями (М): 16 792 байта
  Откмпелированная с регистрами и модификацией (Р и М): 16 712 байт
  Откоммпилированная без регистров без модификаций (0): 16 840 байт
  Откмпелированная с регистрами и модификацией + O3(O3): 16 720 байт
  Откмпелированная с регистрами и модификацией + Osize(Osize): 16 720 байт
  
8 Результаты временного прогона:
				Р и М			М		0		 O3		Osize
  Тест 1: ./res 3 2000000    2307552371 ns	  2387445020 ns	    2432668351 ns   2315038717 ns   2305728132 ns 
  Тест 2: ./res 3 3000000    3484263481 ns        3703214945 ns	    3594983224 ns   3463528649 ns   3502321252 ns
  Тест 3: ./res 3 4000000    4610257214 ns	  4893721839 ns	    4797594704 ns   4698245252 ns   4615878260 ns
  
9 Вывод выполнил задание на 9 баллов.
