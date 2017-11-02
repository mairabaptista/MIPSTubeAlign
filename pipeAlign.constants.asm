.data
	#Screen 
	.eqv screenWidth		1024
	.eqv screenHeight		512
	.eqv unitWidth			8
	.eqv unitHeight			8
	.eqv baseAddress 		0x10010000
	
	#Colors	
	.eqv backgroundColor	0x0000ff
	.eqv redColor		 	0xff0000
	.eqv greenColor 		0x00ff00
	.eqv blueColor 			0x0000ff
	
	#Orientation
	.eqv horizontal			0
	.eqv vertical			1
	.eqv mainDiagonal		2
	.eqv secondaryDiagonal	3
	
.text
	#Macros
	.macro pushInStack(%x)
		sub $sp, $sp, 4						# adjust to push in stack
		sw  %x, 0($sp)						# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y)
		sub $sp, $sp, 8						# adjust to push in stack
		sw  %x, 4($sp)						# push register in stack
		sw  %y, 0($sp)						# push register in stack
	.end_macro
	
	.macro popFromStack(%x)
		lw  %x, 0($sp)						# restore register from stack
		add $sp, $sp, 4						# adjust $sp
	.end_macro
	
	.macro popFromStack(%x, %y)
		lw  %x, 0($sp)						# restore register from stack
		lw  %y, 4($sp)						# restore register from stack
		add $sp, $sp, 8						# adjust $sp
	.end_macro
	
	.macro return_EXIT_SUCCESS
		li $v0, 10
		syscall
	.end_macro