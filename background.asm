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

.text
	.globl main

	main:		
		jal fillBackgroundColor
				
		li $a0, 8
		la $a1, greenColor	
		
		jal drawLine
	
		li $v0, 10
		syscall
		
	# arguments: line number, color
	drawLine:
		move $t0, $a1						# save color in temp
		
		sub $sp, $sp, 8						# adjust to push temp
		sw  $ra, 4($sp)						# push $ra in stack
		sw  $t0, 0($sp)						# push $t0 in stack
		
		li $a1, 1							# column 1 (first column in line)
		
		jal getPositionFromBlock			# return Position to $v0
		
		lw $t0, 0($sp)						# restore $t0 from stack
		lw $ra, 4($sp)						# restore $ra from stack
		add $sp, $sp, 8						# adjust $sp
				
		move $a0, $v0						# send Position to draw
		
		la $t1, screenWidth
		la $t2, unitWidth
		
		div $t1, $t2						
		mflo $t1				
		
		move $a1, $t1						# send entire line to draw
		move $a2, $t0						# send color
		
		sub $sp, $sp, 4						# adjust to push temp
		sw  $ra, 0($sp)						# push $ra in stack
				  
		jal drawHorizontaly
		
		lw $ra, 0($sp)						# restore $ra from stack
		add $sp, $sp, 4						# adjust $sp
	jr $ra
		
	# arguments: position (of memory), sizeOfLine, color
	drawHorizontaly:
		la $t0, baseAddress					# base address
		move $t1, $t0						# aux address
						
		move $t2, $a0						# initial		
		add $t1, $t1, $t2					# base + initial
						
		li $t3, 0 							# i
		move $t4, $a1						# length
		
		loop:								# draw horizontaly
			sw $a2, 0($t1)
			addi $t1, $t1, 4
			addi $t3, $t3, 1
			beq $t3, $t4, end_loop
			j loop
		end_loop:				
	jr $ra
	
	drawVertically:
		#TODO
	jr $ra
		
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
	
	# arguments: line, column
	getPositionFromBlock:
		move $t0, $a0
		subi $t0, $t0, 1
		
		la $t1, screenWidth
		la $t2, unitWidth
		
		div $t1, $t2						# number of blocks
		
		mflo $t1
		
		mul $t1, $t1, 4						# block * 4
		
		mul $t0, $t0, $t1					# multiply lines
		
		mul $t1, $a1, 4
		subi $t0, $t0, 4
		add $t0, $t0, $t1					# add columns
		
		move $v0, $t0
	jr $ra
	
	# arguments: position
	getBlockFromPosition:
		#TODO
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
