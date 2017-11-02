.data
	# data Segment	
.text
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