main:
	;prologue
	push   rbp
  mov    rbp, rsp

  mov r8, 0x00636e2f6e69622f ; /bin/nc - create string in mem
  push r8
  mov r15, rsp ; save pointer to r15
  mov rdi, r15 ; push pointer into rdi, where it has to be on syscall for execve
  
  mov r8, 0x0000000033343420 ; 443 as part of arg
  push r8
	mov r12, rsp ; same thing - saving pointer to r12 for later assembly
	
  mov r8, 0x0000000000000031 ; 1
	push r8
  mov r8, 0x2e302e302e373231 ; 127.0.0 <- got cut off at 8 chars
  push r8
	mov r11, rsp ;save pointer
	
	; argv
	xor r8, r8 ; need a null terminator for argv
	;assemble the news team!!!!
	push r8 ; NULL TERMINATOR - didn't mean to yell at myself, sry
	push r12; 443
	push r11 ; 127.0.0.1 |=| even though it's more than 8 chars, they were pushed together and rsp saved together so it works
	push r15 ; /bin/nc
	mov rsi, rsp

		
	;env. Nothing really needed here, so just a null byte pushed to stack, then pointer saved
  push r8
  mov rdx, rsp
	; prepare 0x3b for execve
  mov rax, 0x3b
  syscall
	;epilogue
  mov rsp, rbp
  pop rbp
  ret
