.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"

# NOTE: Go Settings and check "Initialize Program Counter to global 'main' if defined"

.data
	# data Segment
.text
	.globl main
			
	main:		
		jal fillBackgroundColor
					
		sendParameters(8, 1, 128, greenColor)
		
		jal drawHorizontalLine
					
		return_EXIT_SUCCESS
	
	# arguments: line, column
	# return position of memory
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
	
	# arguments: position of memory
	# return line, column
	getBlockFromPosition:
			
		pushInStack($ra)
		
		jal getSizeOfLine
		
		popFromStack($ra)		
		
		div $a0, $v0
				
		mflo $v0							# division value is a line - 1
		addi $v0, $v0, 1					# line
		
		mfhi $v1							# remainder of division is a column * 4 - 1
		
		li $t0, 4							# load 4 in $t0
		div $v1, $t0						# $v1 / 4
		
		mflo $v1							# set division value in $v1
		
		addi $v1, $v1, 1					# column		
	jr $ra	
	
	# return number of blocks in line
	getNumberOfBlocksInLine:
		la $t0, screenWidth
		la $t1, unitWidth
		
		div $t0, $t1						# number of blocks
		
		mflo $t0
				
		move $v0, $t0						# return number of blocks in line
	jr $ra
	
	# return number of blocks * 4
	getSizeOfLine:
	
		pushInStack($ra)
				
		jal getNumberOfBlocksInLine	
		
		popFromStack($ra)
			
		mul $v0, $v0, 4						# return number of blocks * 4
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