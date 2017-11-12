.data	
	# Data Segment	
.text
	# arguments: line, column
	# return position of memory
	getPositionFromBlock:	
		pushInStack($ra)
				
		jal getSizeOfLine		
		
		popFromStack($ra)
		
		move $t0, $a0
		subi $t0, $t0, 1
		
		mul $t0, $t0, $v0									# multiply lines
		
		mul $t1, $a1, 4
		subi $t0, $t0, 4
		add $t0, $t0, $t1									# add columns
		
		move $v0, $t0
	jr $ra
	
	# arguments: position of memory
	# return line, column
	getBlockFromPosition:			
		pushInStack($ra)
		
		jal getSizeOfLine
		
		popFromStack($ra)		
		
		div $a0, $v0
				
		mflo $v0											# division value is a line - 1
		addi $v0, $v0, 1									# line
		
		mfhi $v1											# remainder of division is a column * 4 - 1
		
		li $t0, 4											# load 4 in $t0
		div $v1, $t0										# $v1 / 4
		
		mflo $v1											# set division value in $v1
		
		addi $v1, $v1, 1									# column		
	jr $ra	
	
	# return number of blocks in line
	getNumberOfBlocksInLine:
		la $t0, SCREEN_WIDTH
		la $t1, UNIT_WIDTH
		
		div $t0, $t1										# number of blocks
		
		mflo $t0
				
		move $v0, $t0						
	jr $ra
	
	# return number of blocks * 4
	getSizeOfLine:	
		pushInStack($ra)
				
		jal getNumberOfBlocksInLine	
		
		popFromStack($ra)
			
		mul $v0, $v0, 4
	jr $ra

	# arguments register_1, register_2
	# return min in $v0, max in $v1
	getMinMax:		
		blt $a0, $a1, isLess
		
		move $v0, $a1
		move $v1, $a0
		
		jr $ra
		
		isLess:
			move $v0, $a0
			move $v1, $a1
	jr $ra
	
	# arguments: slot_number 
	# return: line $v0, column in $v1
	getBlockFromSlot:	
		subi $a0, $a0, 1	
		div $t0, $a0, HORIZONTAL_SLOTS
		
		mflo $t1 				#Represents the slot line
		mfhi $t2				#Represents the slot column

		mul $t1, $t1, SLOT_HEIGHT		#Multiplies the slot line by slot height
		addi $t1, $t1, 1
		add $t1, $t1, MARGIN_TOP		#Adds the top margin to correct the position of the generated block column
		
		mul $t2, $t2, SLOT_WIDTH		#Multiplies the slot line by slot width
		add $t2, $t2, 1	
		add $t2, $t2, MARGIN_LEFT 		#Adds the left margin to correct the position of the generated block line
		
		move $v0, $t1
		move $v1, $t2
	jr $ra
	
	
	# arguments: line in $a0, column in $a1
	# return: Slot in $v0
	getSlotFromBlock:
		li $t8, 38
		div $a0, $t8
		
		mflo $t0 #slot line
		
		li $t8, 54
		div $a1,$t8
		
		mflo $t1 #slot column
				
		mul $t2, $t0, 9
		add $t3, $t2, $t1
		addi $t4, $t3, 1

		move $v0, $t4
	jr $ra
