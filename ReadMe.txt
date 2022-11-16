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
  	-mov	rax, rsi	# tmp88, timeA
	-mov	rsi, rdi	# tmp87, tmp87
	-mov	rsi, r8	# tmp86, tmp87
	-mov	rdi, r9	#,
	-mov	rdi, rax	#, tmp88
	-mov	QWORD PTR -32[rbp], rsi	# timeA, tmp86
	-mov	QWORD PTR -24[rbp], rdi	# timeA,
	на: 
    	+mov	QWORD PTR -32[rbp], rdi	# timeA, tv_sec
	+mov	QWORD PTR -24[rbp], rsi	# timeA, tv_nsec
	
	-mov	rax, QWORD PTR -480[rbp]	# tmp162, start
	-mov	rdx, QWORD PTR -472[rbp]	#, start
	-mov	rdi, QWORD PTR -496[rbp]	# tmp163, end
	-mov	rsi, QWORD PTR -488[rbp]	# tmp164, end
	-mov	rcx, rdx	#,
	-mov	rdx, rax	#, tmp162
	на
	+mov	rdx, QWORD PTR -480[rbp]	# start.tv_sec в 3 параметр
	+mov	rcx, QWORD PTR -472[rbp]	# start.tv_nsec в 4 параметр
	+mov	rdi, QWORD PTR -496[rbp]	# Передача end.tv_sec в 1 параметр
	+mov	rsi, QWORD PTR -488[rbp]	# Передача end.tv_nasec в 1 параметр
	
	-endbr64
	-cdqe
	-	.size	main, .-main
	-.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	-.section	.note.GNU-stack,"",@progbits
	-.section	.note.gnu.property,"a"
	-.align 8
	-.long	1f - 0f
	-.long	4f - 1f
	-.long	5
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
	
	-mov	rax, QWORD PTR -24[rbp]	# tmp114, seed
	-mov	rdi, rax	#, tmp114
	на
	+mov	rdi, QWORD PTR -24[rbp]	# Передаю seed в первый параметр
	
	
	-mov	rax, QWORD PTR -40[rbp]	# tmp115, destination
	-mov	rdi, rax	#, tmp115
	на
	+mov	rdi, QWORD PTR -40[rbp]	# Передаю destination в первый параметр
	
	-mov	rax, QWORD PTR -24[rbp]	# tmp116, seed
	-mov	rdi, rax	#, tmp116
	на
	+mov	rdi, QWORD PTR -24[rbp]	# tmp116, seed
	
	-mov	rax, QWORD PTR -32[rbp]	# tmp120, strC
	-mov	rdi, rax	#, tmp120
	на
	+mov	rdi, QWORD PTR -32[rbp]	# tmp120, strC

	-mov	rax, QWORD PTR -24[rbp]	# Передаю seed в первый параметр
	-mov	rdi, rax	#, tmp130
	на
	+mov	rdi, QWORD PTR -24[rbp]	# Передаю seed в первый параметр
	
	-mov	rcx, QWORD PTR -40[rbp]	# tmp119, destination
	-mov	rsi, rcx	#, tmp119
	на
	+mov	rsi, QWORD PTR -40[rbp]	# Передаю destination во второй параметр

	-mov	rdx, QWORD PTR -24[rbp]	# Передаю seed во второй параметр
	-mov	rsi, rdx	#, tmp123
	на
	+mov	rsi, QWORD PTR -24[rbp]	# Передаю seed во второй параметр
	
	-mov	rdx, QWORD PTR -32[rbp]	# Передаю strC во второй параметр
	-mov	rsi, rdx	# Передаю strC во второй параметр
	на
	+mov	rsi, QWORD PTR -32[rbp]	# Передаю strC во второй параметр
	
4 Нашел соответствие переменных в коде.
	В main.c:
	-32[rbp]  # timeA.tv_sec
	-24[rbp]  # timeA.tv_nsec
	-48[rbp]  # timeB.tv_sec
	-40[rbp]  # timeB.tv_nsec
	-8[rbp]   # nsecA
	-16[rbp]  # nsecB
	-20[rbp]  # count
	-500[rbp] # argc
	-512[rbp] # argv
	-24[rbp]  # i
	-40[rbp]  # f на чтение (передается по ссылке)
	-464[rbp] # input_line (передается по ссылке)
	-480[rbp] # start.tv_sec (передается по ссылке)
	-472[rbp] # start.tv_nsec
	-496[rbp] # end.tv_sec (передается по ссылке)
	-488[rbp] # end.tv_nsec
	-64[rbp]  # f на запись
	-56[rbp]  # elapsed_ns
	-44[rbp], # ch
	В func.c:
	-40[rbp]  # destination
	-44[rbp]  # pos
	-24[rbp]  # seed
	-32[rbp]  # strC
	
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
