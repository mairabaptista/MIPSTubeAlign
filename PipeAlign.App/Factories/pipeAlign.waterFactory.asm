.data

.text

	#arguments:
	drawWaterWinningPipes:

	la $t0, slotPathWin				
	addi $t1, $t0, 1


		waterLoop:

		lb $t4, 0($t0)				#$t4 represent the slots and $t5 represnt type of pipe
		lb $t5, 0($t1)

		pushInStack($ra, $t0, $t1)
		pushInStack($t4, $t5)

		sendParameters($t4)
		jal getBlockFromSlot

		popFromStack($t4, $t5)
		popFromStack($ra, $t0, $t1)


		move $t2, $v0
		move $t3, $v1


		beq $t5, EMPTY_TUBE, exitWaterLoop
		beq $t5, VERTICAL_TUBE, verticalWater
		beq $t5, HORIZONTAL_TUBE, horizontalWater


		j finishDrawWater

		verticalWater:
			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5)

			sendParameters(0, $t2, $t3)
			jal drawVerticalWater

			popFromStack($t3, $t4, $t5)
			popFromStack($ra, $t0, $t1, $t2)
			j finishDrawWater

		horizontalWater:
			pushInStack($ra, $t0, $t1, $t2 )
			pushInStack($t3, $t4, $t5)

			sendParameters(0, $t2, $t3)
			jal drawHorizontalWater

			popFromStack($t3, $t4, $t5)
			popFromStack($ra, $t0, $t1, $t2)
			j finishDrawWater


		finishDrawWater:

		addi $t0, $t0, 2
		addi $t1, $t1, 2

		j waterLoop


		exitWaterLoop:

	jr $ra

	#arguments: direction, line, column
	drawVerticalWater:
	#TODO: Implement direction

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2


		addi $t4, $t1, 6
		addi $t8, $t4, 25

		addi $t5, $t2, 21
		addi $t6, $t2, 33

			verticalLoop:

			beq $t4, $t8, exitVerticalLoop

			addi $t4, $t4, 1		

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t4, $t5, $t6)
			sendParameters($t4, $t5, $t6, WATER_COLOR)

			# arguments: line number, initial block, final block, color  (REMOVER COMENTÃ?RIO)
			jal drawHorizontalLine

			popFromStack($t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)
			
			li $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j verticalLoop

		exitVerticalLoop:

	jr $ra

	#arguments: direction, line, column
	drawHorizontalWater:
	#TODO: Implement direction	

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		add $t3, $t1, 13
		add $t4, $t1, 25

		add $t5, $t2, 6
		add $t8, $t5, 41


			horizontalLoop:

			beq $t5, $t8, exitHorizontalLoop

			add $t5, $t5, 1
				

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5)

			sendParameters($t3, $t4, $t5, WATER_COLOR)
			jal drawVerticalLine

			popFromStack($t3, $t4, $t5)
			popFromStack($ra, $t0, $t1, $t2)
	
			li  $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j horizontalLoop

		exitHorizontalLoop:

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
