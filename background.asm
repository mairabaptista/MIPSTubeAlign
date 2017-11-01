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
	.globl main
	
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
	
	main:		
		jal fillBackgroundColor
				
		li $a0, 8
		la $a1, greenColor	
		
		jal drawEntireLine
	
		li $v0, 10
		syscall
		
	# arguments:
	drawVerticalLine:
		#TODO
	jr $ra
	
	# arguments:
	drawHorizontalLine:
		#TODO
	jr $ra
	
	# arguments:
	drawRectangle:
		#TODO
	jr $ra		
		
	drawVerticalTube:
		#TODO
	jr $ra
	
	drawHorizontalTube:
		#TODO
	jr $ra
	
	drawFirstTubeElbow:
		#TODO
	jr $ra
	
	drawSecondTubeElbow:
		#TODO
	jr $ra
	
	drawThirdTubeElbow:
		#TODO
	jr $ra
	
	drawFourthTubeElbow:
		#TODO
	jr $ra
	
	# arguments: line number, color
	drawEntireLine:
		move $t0, $a1						# save color in temp
			
		pushInStack($ra, $t0)
		
		li $a1, 1							# column 1 (first column in line)
		
		jal getPositionFromBlock			# return Position to $v0
		
		popFromStack($ra, $t0)
				
		move $a0, $v0						# send Position to draw
				
		pushInStack($ra, $t0)
				
		jal getNumberOfBlocksInLine
		
		popFromStack($ra, $t0)				
		
		move $a1, $v0						# send entire line to draw
		la $a2, horizontal					# send horizontal line
		move $a3, $t0						# send color
		
		pushInStack($ra)
				  
		jal drawContinuosBlocks
		
		popFromStack($ra)	
	jr $ra
	
	# arguments: 
	drawEntireColumn:
		#TODO
	jr $ra
	
	# arguments: position (of memory), blocksToFill, orientation, color
	drawContinuosBlocks:
		la $t0, baseAddress					# base address
		move $t1, $t0						# aux address
						
		move $t2, $a0						# initial		
		add $t1, $t1, $t2					# base + initial
						
		li $t3, 0 							# i
		move $t4, $a1						# length
		
		beq $a2, horizontal, if_horizontal
						
		pushInStack($ra, $t1)		
						
		jal getSizeOfLine
		
		popFromStack($ra, $t1)	
		
		move $t5, $v0
		
		beq $a2, vertical, loop		
		beq $a2, mainDiagonal, if_main_diagonal
		beq $a2, secondaryDiagonal, if_secondary_diagonal
		
		j end_loop
		
		if_horizontal:
			li $t5, 4
		j loop
		
		if_main_diagonal:			
			addi $t5, $t5, 4
		j loop
		
		if_secondary_diagonal:			
			subi $t5, $t5, 4		
		
		loop:								# draw horizontaly
			sw $a3, 0($t1)
			add $t1, $t1, $t5				# add $t5 (orientation)
			addi $t3, $t3, 1
			beq $t3, $t4, end_loop
			j loop
		end_loop:				
	jr $ra	
	
	# arguments: line, column
	getPositionFromBlock:
	
		pushInStack($ra)
				
		jal getSizeOfLine		
		
		popFromStack($ra)
		
		move $t0, $a0
		subi $t0, $t0, 1
		
		mul $t0, $t0, $v0					# multiply lines
		
		mul $t1, $a1, 4
		subi $t0, $t0, 4
		add $t0, $t0, $t1					# add columns
		
		move $v0, $t0
	jr $ra
	
	# arguments: position
	getBlockFromPosition:
		#TODO
	jr $ra
	
	# no arguments
	getNumberOfBlocksInLine:
		la $t0, screenWidth
		la $t1, unitWidth
		
		div $t0, $t1						# number of blocks
		
		mflo $t0
				
		move $v0, $t0						# return number of blocks in line
	jr $ra
	
	# no arguments
	getSizeOfLine:
		
		pushInStack($ra)	
				
		jal getNumberOfBlocksInLine	
		
		popFromStack($ra)
			
		mul $v0, $v0, 4						# return number of blocks * 4
	jr $ra
			
	# void
	fillBackgroundColor:
		la $t0, screenWidth
		la $t1, screenHeight
		
		la $t2, unitWidth
		la $t3, unitHeight
		
		mul $t4, $t0, $t1					# pixels in screen
		mul $t5, $t2, $t3					# size of unit
						
		div $t4, $t5							
		mflo $t4							# number of units in screen
						
		mul $t4, $t4, 4						# 4 bytes / word
						
		la $t0, baseAddress					# base address for display
		add  $t4, $t4, $t0  				# last unit address
				
		la $t1, backgroundColor
		
		fillLoop:
			beq $t0, $t4, exit_fillloop	
			sw $t1, 0($t0) 					# fill unit
			addiu $t0, $t0, 4
			j fillLoop
		exit_fillloop:		
	jr $ra
