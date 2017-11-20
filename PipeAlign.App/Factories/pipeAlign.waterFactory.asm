.data

.text

	#arguments:
	drawWaterWinningPipes:
	
	
	la $t0, slotPathWin				#$t0 represent the slots and $t1 represnt type of pipe
	addi $t1, $t0, 1

		waterLoop:

		beq $t0, EMPTY_TUBE, exitWater


		addi $t0, $t0, 2
		addi $t1, $t1, 2

		j waterLoop


		exitWater:

	jr $ra

	#arguments: direction, line, column
	drawVerticalWater:
	#TODO: Implement direction

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		

		addi $t4, $t1, 7
		addi $t5, $t2, 21
		addi $t6, $t2, 33

			verticalLoop:

			beq $t4, 31, exitVerticalLoop

			addi $t4, $t1, 1
		

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t4, $t5, $t6)
			sendParameters($t4, $t5, $t6, WATER_COLOR)

			# arguments: line number, initial block, final block, color  (REMOVER COMENTÁRIO)
			jal drawHorizontalLine
			
			popFromStack($ra, $t0, $t1, $t2)
			popFromStack($t4, $t5, $t6)
	
			li  $v0, 32
    		move $a0, WATER_TIME_OUT
    		syscall
	
			j verticalLoop

		exitVerticalLoop:

	jr $ra

	#arguments: direction, line, column
	drawHorizontalWater:
	#TODO: Implement direction	

	jr $ra

	#arguments: direction, line, column
	drawVerticalTopWater:
	#TODO: Implement direction
	jr $ra

	#arguments: direction, line, column
	drawVerticalBottomWater:
	#TODO: Implement direction
	jr $ra

	#arguments: direction, line, column
	drawHorizontalLeftWater:
	#TODO: Implement direction
	jr $ra

	#arguments: direction, line, column
	drawHorizontalRightWater:
	#TODO: Implement direction
	jr $ra