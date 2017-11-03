.data
	# Data Segment	
.text
	# arguments: line number, initial block, final block, color
	drawHorizontalLine:
		move $t0, $a0							# line number
		
		sendParameters($a1, $a2)
		
		pushInStack($ra)
		
		jal getMinMax			
		
		popFromStack($ra)
	
		move $t1, $v0							# new initial block
		move $t2, $v1							# new final block
					
		sendParameters($t0, $t1)				# send line number, initial block
	
		pushInStack($ra, $t1)
		
		jal getPositionFromBlock				# return Position to $v0
		
		popFromStack($ra, $t1)
				
		sub $t3, $t2, $t1					
		addi $t3, $t3, 1						# number of blocks to draw
		
		sendParameters($v0, $t3, horizontal)	# send position, blocks to draw, orientation
		
		pushInStack($ra)
				  
		jal drawContinuosBlocks
		
		popFromStack($ra)		
	jr $ra
	
	# arguments: initial line, final line, block number, color
	drawVerticalLine:
	
		pushInStack($ra)
		
		jal getMinMax			
		
		popFromStack($ra)
	
		move $t1, $v0							# new initial line
		move $t2, $v1							# new final line
		
		sendParameters($t1, $a2)				# send line number, initial block
				
		pushInStack($ra, $t1)
		
		jal getPositionFromBlock				# return Position to $v0
		
		popFromStack($ra, $t1)
				
		sub $t3, $t2, $t1					
		addi $t3, $t3, 1						# number of blocks to draw
	
		sendParameters($v0, $t3, vertical)		# send position, blocks to draw, orientation
		
		pushInStack($ra)
				  
		jal drawContinuosBlocks
		
		popFromStack($ra)			
	jr $ra
		
	# arguments: 
	drawRectangle:
		#TODO
	jr $ra		
	
	# arguments:	
	drawVerticalTube:
		#TODO
	jr $ra
	
	# arguments:
	drawHorizontalTube:
		#TODO
	jr $ra
	
	# arguments:
	drawFirstTubeElbow:
		#TODO
	jr $ra
	
	# arguments:
	drawSecondTubeElbow:
		#TODO
	jr $ra
	
	# arguments:
	drawThirdTubeElbow:
		#TODO
	jr $ra
	
	# arguments:
	drawFourthTubeElbow:
		#TODO
	jr $ra
	
	# arguments: line number, color
	drawEntireLine:
		move $t0, $a1								# save color in temp
			
		pushInStack($ra, $t0)
				
		sendParameters($a0, 1)						# column 1 (first column in line)
		
		jal getPositionFromBlock					# return Position to $v0
		
		popFromStack($ra, $t0)
				
		sendParameters($v0)							# send Position to drawContinuosBlocks
						
		pushInStack($ra, $t0)
				
		jal getNumberOfBlocksInLine
		
		popFromStack($ra, $t0)				
				
		sendParameters($a0, $v0, horizontal, $t0)	# send: position, entire line, horizontal line, color
		
		pushInStack($ra)
				  
		jal drawContinuosBlocks
		
		popFromStack($ra)	
	jr $ra
	
	# arguments: column number, color
	drawEntireColumn:
		#TODO
	jr $ra
	
	# arguments: position of memory, blocksToFill, orientation, color
	drawContinuosBlocks:
		la $t0, baseAddress							# base address
		move $t1, $t0								# aux address
						
		move $t2, $a0								# initial		
		add $t1, $t1, $t2							# base + initial
						
		li $t3, 0 									# i
		move $t4, $a1								# length
		
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
		
		loop:										# draw horizontaly
			sw $a3, 0($t1)
			add $t1, $t1, $t5						# add $t5 (orientation)
			addi $t3, $t3, 1
			beq $t3, $t4, end_loop
			j loop
		end_loop:				
	jr $ra
	
	# no arguments
	fillBackgroundColor:
		la $t0, screenWidth
		la $t1, screenHeight
		
		la $t2, unitWidth
		la $t3, unitHeight
		
		mul $t4, $t0, $t1							# pixels in screen
		mul $t5, $t2, $t3							# size of unit
						
		div $t4, $t5							
		mflo $t4									# number of units in screen
						
		mul $t4, $t4, 4								# 4 bytes / word
						
		li $t0, baseAddress							# base address for display
		add  $t4, $t4, $t0  						# last unit address
				
		li $t1, backgroundColor
		
		fillLoop:
			beq $t0, $t4, exit_fillloop	
			sw $t1, 0($t0) 							# fill unit
			addiu $t0, $t0, 4
			j fillLoop
		exit_fillloop:		
	jr $ra
