.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"

# NOTE: Go Settings and check "Initialize Program Counter to global 'main' if defined"

.data
	# data Segment
.text
	.globl main
			
	main:
		jal fillBackgroundColor
				
		li $a0, 8		
		la $a1, greenColor
		
		jal drawEntireLine
	
		li $v0, 10
		syscall
	
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