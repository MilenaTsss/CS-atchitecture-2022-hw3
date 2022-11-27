	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%u"
	
	.align 8
.LC1:										# 1.0
	.long	0
	.long	1072693248
	
	.align 8
.LC2:										# 10
	.long	0
	.long	1076101120
	
	.align 8
.LC3:										# 93555
	.long	0
	.long	1089918768
	
	.align 8
.LC4:										# 0.1
	.long	2576980378
	.long	1069128089

	.text
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp				# rdi = FILE* input_
	mov	rdx, rsi				# rdx = rsi = precision
	lea	rsi, .LC0[rip]				# rsi = "%u"
	mov	eax, 0
	call	__isoc99_fscanf@PLT			# call fscanf (input_, "%u", precision)
	pop	rbp
	ret
	.size	input, .-input
	
	.globl	compute
	.type	compute, @function
compute:
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 24
	movsd	xmm2, QWORD PTR .LC1[rip]			# xmm2 = 1.0
	movsd	QWORD PTR -24[rbp], xmm2			# [rbp - 24] = res = 1.0 - записываем на стек, т.к. не сможем сохранить никакой регистр
	mov	ebx, 2						# ebx = i = 2
	jmp	.L3
.L4:
	cvtsi2sd	xmm0, ebx
	movsd	xmm1, QWORD PTR .LC2[rip]			# xmm1 = 10
	call	pow@PLT					# xmm0 = pow(i, 10)
	movsd	xmm1, QWORD PTR .LC1[rip]			# xmm1 = 1.0
	divsd	xmm1, xmm0					# xmm1 = 1 / pow(i, 10)
	movapd	xmm0, xmm1					# xmm0 = 1 / pow(i, 10)
	addsd	xmm0, QWORD PTR -24[rbp]			# xmm0 += res
	movsd	QWORD PTR -24[rbp], xmm0			# res = xmm0  = res + 1 / pow(i, 10)
	add	ebx, 1						# i++
.L3:
	cmp	ebx, 37					# if (i > 38) continue to end
	jle	.L4						# if (i <= 37) -> L6
	movsd	xmm0, QWORD PTR .LC3[rip]			# xmm0 = 93555
	mulsd	xmm0, QWORD PTR -24[rbp]			# xmm0 = 93555 * res
	movsd	xmm1, QWORD PTR .LC4[rip]			# xmm1 = 0.1
	call	pow@PLT					# return pow(res * 93555, 0.1)
	add	rsp, 24
	pop	rbx
	pop	rbp
	ret
	.size	compute, .-compute
	
	.globl	output
	.type	output, @function
output:
	push	rbp
	mov	rbp, rsp					# prologue
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	mov	r12, rdi					# r12 = rdi = FILE* output
	movsd	QWORD PTR -40[rbp], xmm0			# [ebp - 40] = double out
	mov	r13d, esi					# r13d = esi = precision
	mov	edi, 20					# edi = 20 = size of format str
	call	malloc@PLT
	mov	rbx, rax					# rbx = char* format
	mov	BYTE PTR [rbx], '%'				# format[0] = '%'
	mov	BYTE PTR 1[rbx], '.'				# format[1] = '.'
	mov	BYTE PTR 2[rax], 0				# format[2] = '\0'
	mov	edx, r13d					# edx = precision
	lea	rsi, .LC0[rip]					# rsi = "%u"
	lea	rdi, 2[rbx]					# rdi = rbx + 2 = format + 2
	mov	eax, 0
	call	sprintf@PLT					# sprintf(format + 2, "%u", precision)
	mov	rax, rbx					# ниже выполняется функция strcat к строке format
	mov	rcx, -1
	mov	rdx, rax
	mov	eax, 0
	mov	rdi, rdx
	repnz scasb
	mov	rax, rcx
	not	rax
	sub	rax, 1
	add	rax, rbx
	mov	WORD PTR [rax], 2662				# дописываем "f\n"
	mov	BYTE PTR 2[rax], 0				# дописываем '\0'
	movsd	xmm0, QWORD PTR -40[rbp]			# xmm0 = out
	mov	rsi, rbx					# rsi = format
	mov	rdi, r12					# rdi = output
	mov	eax, 1
	call	fprintf@PLT					# fprintf(output_, format, out);
	add	rsp, 24					# epilogue
	pop	rbx
	pop	r12
	pop	r13
	pop	rbp
	ret
	.size	output, .-output
