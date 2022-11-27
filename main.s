	.intel_syntax noprefix
	.section	.rodata
.LC5:
	.string	"Please give input and output file"
.LC6:
	.string	"stdin"
.LC7:
	.string	"r"
.LC8:
	.string	"BAD INPUT FILE"
.LC9:
	.string	"stdout"
.LC10:
	.string	"w"
.LC11:
	.string	"BAD OUTPUT FILE"
	
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	mov	eax, edi					# eax = argc
	mov	r12, rsi					# r12 = argv
	mov	rdx, QWORD PTR fs:40				# сохраняем данные чтобы позже проверить стек на корректность
	mov	QWORD PTR -40[rbp], rdx
	xor	edx, edx
	cmp	eax, 3						# if (argc != 3) -> end
	je	.L11						# else continue
	lea	rdi, .LC5[rip]					
	mov	eax, 0
	call	printf@PLT					# printf("Please give input and output file"), rdi = .LC5
	mov	eax, 0
	jmp	.L17						# -> end
.L11:
	lea	rax, 8[r12]					# rax = argv + 1
	mov	rax, QWORD PTR [rax]				# rax = argv[1]
	lea	rsi, .LC6[rip]					# rsi = "stdin"
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L13						# if (argv[1] != "stdin") -> L13
	mov	rbx, QWORD PTR stdin[rip]			# rbx = stdin
	jmp	.L14						# -> L14
.L13:
	lea	rax, 8[r12]
	mov	rax, QWORD PTR [rax]				# rax = argv[1]
	lea	rsi, .LC7[rip]					# rsi = "r"
	mov	rdi, rax
	call	fopen@PLT					# call fopen with rdi = argv[1], rsi = "r"
	mov	rbx, rax					# rbx = FILE* input_
	test	rbx, rbx
	jne	.L14						# if input_ != 0 -> L14 (файл открылся)
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT					# else printf "BAD INPUT FILE"
	mov	eax, 0
	jmp	.L17						# -> end
.L14:
	lea	rax, 16[r12]
	mov	rax, QWORD PTR [rax]				# rax = argv[2]
	lea	rsi, .LC9[rip]					# rsi = "stdout"
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L15						# if argv[2] != "stdout" -> open file in L15
	mov	r12, QWORD PTR stdout[rip]			# r12 = stdout
	jmp	.L16						# -> L16
.L15:
	lea	rax, 16[r12]
	mov	rax, QWORD PTR [rax]				# rax = argv[2]
	lea	rsi, .LC10[rip]				# rsi = "w"
	mov	rdi, rax					# rdi = argv[2]
	call	fopen@PLT					# fopen with rdi = argv[2], esi = "w" 
	mov	r12, rax
	test	r12, r12
	jne	.L16						# if r12 != 0 -> L16
	mov	rdi, rbx
	call	fclose@PLT					# close input_, rdi = input_
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT					# printf "BAD OUTPUT FILE"
	mov	eax, 0
	jmp	.L17						# -> end
.L16:
	lea	rax, -44[rbp]					# на стеке т.к. мы отдаём её адрес в функцию, rax = precision
	mov	rsi, rax					# rsi = precision
	mov	rdi, rbx					# rdi = rbx = input_
	call	input						# input(input_, precision)
	mov	r13d, DWORD PTR -44[rbp]			# r13d = precision
	mov	eax, 0
	call	compute					# xmm0 = compute()
	mov	esi, r13d					# esi = precision
	mov	rdi, r12					# rdi = r12 = output_
	call	output						# output(rdi = output_, esi = precision, xmm0 = compute())
	mov	rdi, rbx
	call	fclose@PLT					# fclose input_
	mov	rdi, r12
	call	fclose@PLT					# fclose output_
	mov	eax, 0
.L17:
	mov	rcx, QWORD PTR -40[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L18
	call	__stack_chk_fail@PLT				# проверка на корректность стека
.L18:
	add	rsp, 24					# epilogue
	pop	rbx
	pop	r12
	pop	r13
	pop	rbp
	ret
	.size	main, .-main
