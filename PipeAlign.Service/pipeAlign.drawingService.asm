.data
	# Data Segment	
.text
	# arguments: line number, initial block, final block, color
	drawHorizontalLine:
		move $t0, $a0										# line number
				
		sendParameters($a1, $a2)		
				
		pushInStack($ra)		
				
		jal getMinMax					
				
		popFromStack($ra)		
			
		move $t1, $v0										# new initial block
		move $t2, $v1										# new final block
								
		sendParameters($t0, $t1)							# send line number, initial block
				
		pushInStack($ra, $t1)			
					
		jal getPositionFromBlock							# return Position to $v0
					
		popFromStack($ra, $t1)			
							
		sub $t3, $t2, $t1								
		addi $t3, $t3, 1									# number of blocks to draw
					
		sendParameters($v0, $t3, HORIZONTAL)				# send position, blocks to draw, orientation
		
		pushInStack($ra)
				  
		jal drawContinuosBlocks
		
		popFromStack($ra)		
	jr $ra
	
	# arguments: initial line, final line, block number, color
	drawVerticalLine:	
		pushInStack($ra)
		
		jal getMinMax			
		
		popFromStack($ra)
	
		move $t1, $v0										# new initial line
		move $t2, $v1										# new final line
					
		sendParameters($t1, $a2)							# send line number, initial block
							
		pushInStack($ra, $t1)			
					
		jal getPositionFromBlock							# return Position to $v0
					
		popFromStack($ra, $t1)			
							
		sub $t3, $t2, $t1								
		addi $t3, $t3, 1									# number of blocks to draw
				
		sendParameters($v0, $t3, VERTICAL)					# send position, blocks to draw, orientation
		
		pushInStack($ra)
				  
		jal drawContinuosBlocks
		
		popFromStack($ra)			
	jr $ra
		
	# arguments: initial line, initial block, final line, final block, color, isFilled
	drawRectangle:
		popFromStack($t0, $t1)								# $t0 = color, $t1 = isFilled
	
		pushInStack($a0, $a1)		
		sendParameters($a0, $a2)
		
		pushInStack($ra)
		jal getMinMax
		popFromStack($ra)
		
		popFromStack($a0, $a1)	
		
		beq $v0, $a0, draw									# if in order, draw
		
		move $a0, $v0
		move $a2, $v1
		
		move $t2, $a1										# if not in order, adjust arguments
		move $a1, $a3
		move $a3, $t2
		
		draw:
			move $t6, $a0
			addi $t6, $t6, 1								# $t6 start in a second line
			pushInStack($a0, $a1, $a2, $a3)	
									
		draw_horizontal:
			sendParameters($a0, $a1, $a3, $t0)				# line number, initial block, final block, color						
			pushInStack($ra, $t0, $t1)		
			jal drawHorizontalLine			
			popFromStack($ra, $t0, $t1)			
			popFromStack($a0, $a1, $a2, $a3)
			
			bgt $t6, $a2, end_draw_horizontal				# if $t6 == final line, end loop
			
			pushInStack($a0, $a1, $a2, $a3)
						
			beqz $t1, not_filled
			
			sendParameters($t6)								# draw horizontal lines
			addi $t6, $t6, 1
						
			j draw_horizontal
			
			not_filled:				
				move $t6, $a2				
				sendParameters($t6)							# draw bottom line
				addi $t6, $t6, 1
			j draw_horizontal			
		end_draw_horizontal:
			
			bnez $t1, end_draw_vertical						# dont need draw vertical if isFilled
			
			li $t6, 0		
			pushInStack($a0, $a1, $a2, $a3)	
			move $t2, $a1									# $a register are modified in sendParameters
			
		draw_vertical:												
			sendParameters($a0, $a2, $t2, $t0)				# initial line, final line, block number, color						
			pushInStack($ra, $t0, $t1)		
			jal drawVerticalLine				
			popFromStack($ra, $t0, $t1)			
			popFromStack($a0, $a1, $a2, $a3)
			
			bnez $t6, end_draw_vertical
			
			pushInStack($a0, $a1, $a2, $a3)
			move $t2, $a3									# draw right side
			addi $t6, $t6, 1
			j draw_vertical			
		end_draw_vertical:
								
	jr $ra		
	
	# arguments: line number, color
	drawEntireLine:
		move $t0, $a1										# save color in temp
					
		pushInStack($ra, $t0)							
		sendParameters($a0, 1)								# column 1 (first column in line)		
		jal getPositionFromBlock							# return Position to $v0		
		popFromStack($ra, $t0)		
						
		sendParameters($v0)									# send Position to drawContinuosBlocks					
		pushInStack($ra, $t0)						
		jal getNumberOfBlocksInLine				
		popFromStack($ra, $t0)						
						
		sendParameters($a0, $v0, HORIZONTAL, $t0)			# send: position, entire line, horizontal line, color
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
		la $t0, BASE_ADDRESS								# base address
		move $t1, $t0										# aux address
								
		move $t2, $a0										# initial		
		add $t1, $t1, $t2									# base + initial
								
		li $t3, 0 											# i
		move $t4, $a1										# length
		
		beq $a2, HORIZONTAL, if_horizontal
						
		pushInStack($ra, $t1)		
						
		jal getSizeOfLine
		
		popFromStack($ra, $t1)	
		
		move $t5, $v0
		
		beq $a2, VERTICAL, loop		
		beq $a2, MAIN_DIAGONAL, if_main_diagonal
		beq $a2, SECONDARY_DIAGONAL, if_secondary_diagonal
		
		j end_loop
		
		if_horizontal:
			li $t5, 4
		j loop
		
		if_main_diagonal:			
			addi $t5, $t5, 4
		j loop
		
		if_secondary_diagonal:			
			subi $t5, $t5, 4		
		
		loop:												# draw horizontaly
			sw $a3, 0($t1)		
			add $t1, $t1, $t5								# add $t5 (orientation)
			addi $t3, $t3, 1		
			beq $t3, $t4, end_loop		
			j loop		
		end_loop:						
	jr $ra		
			
	# no arguments		
	fillBackgroundColor:		
		la $t0, SCREEN_WIDTH		
		la $t1, SCREEN_HEIGHT		
				
		la $t2, UNIT_WIDTH		
		la $t3, UNIT_HEIGHT		
				
		mul $t4, $t0, $t1									# pixels in screen
		mul $t5, $t2, $t3									# size of unit
								
		div $t4, $t5									
		mflo $t4											# number of units in screen
								
		mul $t4, $t4, 4										# 4 bytes / word
								
		li $t0, BASE_ADDRESS								# base address for display
		add  $t4, $t4, $t0  								# last unit address
						
		li $t1, BACKGROUND_COLOR		
				
		fillLoop:		
			beq $t0, $t4, exit_fillloop			
			sw $t1, 0($t0) 									# fill unit
			addiu $t0, $t0, 4
			j fillLoop
		exit_fillloop:		
	jr $ra
