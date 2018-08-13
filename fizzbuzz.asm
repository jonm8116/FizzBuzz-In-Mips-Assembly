#This program was written because I lost a bet
#Thanks Stanley....

.data 
fizz: .asciiz "Fizz"
buzz: .asciiz "Buzz"
space: .asciiz " "
newline: .asciiz "\n"
end_program: .asciiz "End program"

.text 
main:
	######################################
	#	register declarations
	#	$t0 = loop counter
	#	$t1 = holds string fizz
	#	$t2 = holds string buzz
	#	$t3 = number 3	
	#	$t5 = number 5
	#	$t7 = loop end number
	#
	######################################
	
	######################################
	#
	#	Set loop conditions
	#
	######################################
	
	li $t0, 0
	la $t1, fizz
	la $t2, buzz 
	li $t3, 3
	li $t5, 5
	li $t7, 100
	
	startloop:
		addi $t0, $t0, 1 
		
		la $a0, ($t0)	#Print current integer
		li $v0, 1
		syscall
		la $a0, space	#print space
		li $v0, 4 
		syscall
		
		#################################################
		#	$t8 = remainder from division
		#
		#################################################
		
		div $t0, $t3 		#check divisibility by 3
		mfhi $t8
		
		beqz $t8, checkDivBy5	#first check if divisible by 3
		
		div $t0, $t5		#check divisibility by 3
		mfhi $t8
		
		beqz $t8, printBuzz		#check if div by 5  
		
		resumeloop:
		
			li $v0, 4	#resume loop after 
			la $a0, newline
			syscall
														
			beq $t0, $t7, endloop
			j startloop	
	
	checkDivBy5:
		div $t0, $t5
		mfhi $t8
		beqz $t8 printFizzBuzz	#check if div by 3 & 5 
		j printFizz
	
	printFizz:
		la $a0, fizz	#print fizz
		li $v0, 4 
		syscall
		j resumeloop
		
	printBuzz:
		la $a0, buzz	#print buzz
		li $v0, 4 
		syscall
		j resumeloop
	
	printFizzBuzz:
		la $a0, fizz	#print fizz buzz
		li $v0, 4
		syscall
		la $a0, space 
		syscall
		la $a0, buzz 
		syscall
		j resumeloop
		
	
endloop:
	la $a0, end_program
	li $v0, 4 
	syscall
	
	