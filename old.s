	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%u"
	.text
	.globl	input
	.type	input, @function
input:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	input, .-input
	.globl	compute
	.type	compute, @function
compute:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 2
	jmp	.L3
.L4:
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	call	pow@PLT
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L3:
	cmp	DWORD PTR -12[rbp], 37
	jle	.L4
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	call	pow@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	compute, .-compute
	.globl	output
	.type	output, @function
output:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	movsd	QWORD PTR -32[rbp], xmm0
	mov	DWORD PTR -36[rbp], esi
	mov	edi, 20
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, -1
	mov	rdx, rax
	mov	eax, 0
	mov	rdi, rdx
	repnz scasb
	mov	rax, rcx
	not	rax
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	WORD PTR [rax], 11813
	mov	BYTE PTR 2[rax], 0
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, 2[rax]
	mov	eax, DWORD PTR -36[rbp]
	mov	edx, eax
	lea	rsi, .LC0[rip]
	mov	rdi, rcx
	mov	eax, 0
	call	sprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, -1
	mov	rdx, rax
	mov	eax, 0
	mov	rdi, rdx
	repnz scasb
	mov	rax, rcx
	not	rax
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	WORD PTR [rax], 2662
	mov	BYTE PTR 2[rax], 0
	mov	rcx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rcx
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	output, .-output
	.section	.rodata
	.align 8
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
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 56
	.cfi_offset 3, -24
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -52[rbp], 3
	je	.L8
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L8:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L10
	mov	rax, QWORD PTR stdin[rip]
	mov	QWORD PTR -40[rbp], rax
	jmp	.L11
.L10:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	cmp	QWORD PTR -40[rbp], 0
	jne	.L11
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L11:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L12
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -32[rbp], rax
	jmp	.L13
.L12:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	jne	.L13
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L13:
	lea	rdx, -44[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	input
	mov	ebx, DWORD PTR -44[rbp]
	mov	eax, 0
	call	compute
	mov	rax, QWORD PTR -32[rbp]
	mov	esi, ebx
	mov	rdi, rax
	call	output
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
.L14:
	mov	rcx, QWORD PTR -24[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	add	rsp, 56
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1076101120
	.align 8
.LC3:
	.long	0
	.long	1089918768
	.align 8
.LC4:
	.long	2576980378
	.long	1069128089
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
