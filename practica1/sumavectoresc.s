	.file	"sumavectoresc.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector "
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f \t/ Tama\303\261o Vectores:%u \t/V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / /V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) / \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L13
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$67108864, %ebx
	call	strtol@PLT
	cmpl	$67108864, %eax
	cmovbe	%eax, %ebx
	testl	%eax, %eax
	je	.L3
	pxor	%xmm1, %xmm1
	leaq	v1(%rip), %r12
	leaq	v2(%rip), %rbp
	movsd	.LC1(%rip), %xmm3
	xorl	%eax, %eax
	cvtsi2sd	%ebx, %xmm1
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	movapd	%xmm1, %xmm7
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	movsd	%xmm2, (%r12,%rax,8)
	movsd	%xmm7, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	ja	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	leaq	v3(%rip), %r13
	call	clock_gettime@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	(%r12,%rax,8), %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, 0(%r13,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	ja	.L5
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leal	-1(%rbx), %edx
	pxor	%xmm0, %xmm0
	leaq	.LC3(%rip), %rsi
	pxor	%xmm1, %xmm1
	movq	%rdx, %rcx
	movsd	0(%r13,%rdx,8), %xmm6
	movl	%edx, %r9d
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movsd	0(%rbp,%rdx,8), %xmm5
	movsd	(%r12,%rdx,8), %xmm4
	movl	%edx, %r8d
	movsd	v3(%rip), %xmm3
	movl	%ebx, %edx
	movsd	v2(%rip), %xmm2
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movl	$7, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	v1(%rip), %xmm1
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L14
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	leaq	v1(%rip), %r12
	call	clock_gettime@PLT
	leaq	v2(%rip), %rbp
	leaq	v3(%rip), %r13
	jmp	.L6
.L14:
	call	__stack_chk_fail@PLT
.L13:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	v3,536870912,32
	.comm	v2,536870912,32
	.comm	v1,536870912,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
