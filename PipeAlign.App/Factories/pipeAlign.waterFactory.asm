.data

.text

	#arguments:
	drawWaterWinningPipes:

	la $t0, slotPathWin				
	addi $t1, $t0, 1
	addi $t7, $t0, 2

		waterLoop:

		lb $t4, 0($t0)				#$t4 represent the slots 
		lb $t5, 0($t1)				#$t5 represent type of pipe
		lb $t6, 0($t7)				#$t6 represent direction

		pushInStack($ra, $t0, $t1, $t7)
		pushInStack($t4, $t5, $t6)

		sendParameters($t4)
		jal getBlockFromSlot

		popFromStack($t4, $t5, $t6)
		popFromStack($ra, $t0, $t1, $t7)


		move $t2, $v0
		move $t3, $v1


		beq $t5, EMPTY_TUBE, exitWaterLoop
		beq $t5, VERTICAL_TUBE, verticalWater
		beq $t5, HORIZONTAL_TUBE, horizontalWater
		beq $t5, FIRST_TUBE_ELBOW, firstElbowWater
		beq $t5, SECOND_TUBE_ELBOW, secondElbowWater
		beq $t5, THIRD_TUBE_ELBOW, thirdElbowWater
		beq $t5, FOURTH_TUBE_ELBOW, fourthElbowWater


		j finishDrawWater

		verticalWater:
			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)
			pushInStack($t7)
			sendParameters($t6, $t2, $t3)
			jal drawVerticalWater
			popFromStack($t7)
			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)

			j finishDrawWater

		horizontalWater:
			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)
			pushInStack($t7)
			sendParameters($t6, $t2, $t3)
			jal drawHorizontalWater
			popFromStack($t7)
			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)

			j finishDrawWater

		firstElbowWater:
			
			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)
			pushInStack($t7)
			sendParameters($t6, $t2, $t3)
			jal firstTubeElbowWater
			popFromStack($t7)
			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)

			j finishDrawWater


		secondElbowWater:

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)
			pushInStack($t7)
			sendParameters($t6, $t2, $t3)
			jal secondTubeElbowWater
			popFromStack($t7)
			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)

			j finishDrawWater

		thirdElbowWater:

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)
			pushInStack($t7)
			sendParameters($t6, $t2, $t3)
			jal thirdTubeElbowWater
			popFromStack($t7)
			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)

			j finishDrawWater

		fourthElbowWater:

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)
			pushInStack($t7)
			sendParameters($t6, $t2, $t3)
			jal fourthTubeElbowWater
			popFromStack($t7)
			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)

			j finishDrawWater


		finishDrawWater:

		addi $t0, $t0, 3
		addi $t1, $t1, 3
		addi $t7, $t7, 3

		j waterLoop


		exitWaterLoop:

	jr $ra

	#arguments: direction, line, column
	drawVerticalWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		addi $t5, $t2, 21
		addi $t6, $t2, 33

		beq $t0, UP, setParametersToUp

		#Set set set parameters to down
		addi $t4, $t1, 6
		addi $t8, $t4, 25
		li $t3, 1

		j verticalLoop


		setParametersToUp:

			addi $t4, $t1, 32
			addi $t8, $t1, 7
			li $t3, -1

		
		verticalLoop:

			beq $t4, $t8, exitVerticalLoop

			add $t4, $t4, $t3

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t4, $t5, $t6, $t3)
			sendParameters($t4, $t5, $t6, WATER_COLOR)
			jal drawHorizontalLine
			popFromStack($t4, $t5, $t6, $t3)
			popFromStack($ra, $t0, $t1, $t2)
			
			li $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j verticalLoop

		exitVerticalLoop:

	jr $ra

	#arguments: direction, line, column
	drawHorizontalWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		add $t3, $t1, 13
		add $t4, $t1, 25

		beq $t0, LEFT, setParametersToLeft

		#Set set set parameters to rigth
		add $t5, $t2, 6
		add $t8, $t5, 41
		li $t6, 1

		j horizontalLoop

		setParametersToLeft:

			add $t5, $t2, 48
			add $t8, $t2, 7
			li $t6, -1

		horizontalLoop:

			beq $t5, $t8, exitHorizontalLoop

			add $t5, $t5, $t6

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)
			sendParameters($t3, $t4, $t5, WATER_COLOR)
			jal drawVerticalLine
			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)
	
			li  $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j horizontalLoop

		exitHorizontalLoop:

	jr $ra


	#arguments: direction, line, column
	firstTubeElbowWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2


		beq $t0, UP, firstTubeLeftWaterFirst

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawVerticalTopWater
		popFromStack($ra, $t0, $t1, $t2)

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawHorizontalLeftWater
		popFromStack($ra, $t0, $t1, $t2)

		j exitFirstTubeElbowWater


		firstTubeLeftWaterFirst:

			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawHorizontalLeftWater
			popFromStack($ra, $t0, $t1, $t2)


			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawVerticalTopWater
			popFromStack($ra, $t0, $t1, $t2)

		exitFirstTubeElbowWater:

	jr $ra


	#arguments: direction, line, column
	secondTubeElbowWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		beq $t0, UP, secondTubeRigthWaterFirst

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawVerticalTopWater
		popFromStack($ra, $t0, $t1, $t2)

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawHorizontalRightWater
		popFromStack($ra, $t0, $t1, $t2)

		j exitSecondTubeElbowWater

		secondTubeRigthWaterFirst:

			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawHorizontalRightWater
			popFromStack($ra, $t0, $t1, $t2)

			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawVerticalTopWater
			popFromStack($ra, $t0, $t1, $t2)

		exitSecondTubeElbowWater:

	jr $ra

	#arguments: direction, line, column
	thirdTubeElbowWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		beq $t0, DOWN, thirdTubeLeftWaterFirst

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawVerticalBottomWater
		popFromStack($ra, $t0, $t1, $t2)

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawHorizontalLeftWater
		popFromStack($ra, $t0, $t1, $t2)


		j exitThirdTubeElbowWater


		thirdTubeLeftWaterFirst: 

			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawHorizontalLeftWater
			popFromStack($ra, $t0, $t1, $t2)

			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawVerticalBottomWater
			popFromStack($ra, $t0, $t1, $t2)

		exitThirdTubeElbowWater:

	jr $ra

	#arguments: direction, line, column
	fourthTubeElbowWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		beq $t0, DOWN, fourthTubeRigthWaterFirst

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawVerticalBottomWater
		popFromStack($ra, $t0, $t1, $t2)

		pushInStack($ra, $t0, $t1, $t2)
		sendParameters($t0, $t1, $t2)
		jal drawHorizontalRightWater
		popFromStack($ra, $t0, $t1, $t2)


		j exitFourthTubeElbowWater


		fourthTubeRigthWaterFirst: 

			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawHorizontalRightWater
			popFromStack($ra, $t0, $t1, $t2)

			pushInStack($ra, $t0, $t1, $t2)
			sendParameters($t0, $t1, $t2)
			jal drawVerticalBottomWater
			popFromStack($ra, $t0, $t1, $t2)

		exitFourthTubeElbowWater:

	jr $ra


	#arguments: direction, line, column
	drawVerticalTopWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		addi $t5, $t2, 21
		addi $t6, $t2, 33


		beq $t0, UP, setVerticalTopWaterParameters

		addi $t4, $t1, 6
		addi $t8, $t1, 25
		li $t3, 1

		j verticalTopWaterLoop


		setVerticalTopWaterParameters:

			addi $t4, $t1, 26
			addi $t8, $t1, 7
			li $t3, -1


		verticalTopWaterLoop:

			beq $t4, $t8, exitVerticalTopWaterLoop

			add $t4, $t4, $t3		

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t4, $t5, $t6, $t3)
			sendParameters($t4, $t5, $t6, WATER_COLOR)

			jal drawHorizontalLine

			popFromStack($t4, $t5, $t6, $t3)
			popFromStack($ra, $t0, $t1, $t2)
			
			li $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j verticalTopWaterLoop

		exitVerticalTopWaterLoop:

	jr $ra

	#arguments: direction, line, column
	drawVerticalBottomWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		addi $t5, $t2, 21
		addi $t6, $t2, 33


		beq $t0, DOWN, setVerticalBottomWaterParameters

		addi $t4, $t1, 32
		addi $t8, $t1, 13
		li $t3, -1

		j verticalBottomWaterLoop


		setVerticalBottomWaterParameters:

			addi $t4, $t1, 12
			addi $t8, $t1, 31
			li $t3, 1


		verticalBottomWaterLoop:

			beq $t4, $t8, exitVerticalBottomWaterLoop

			add $t4, $t4, $t3		

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t4, $t5, $t6, $t3)
			sendParameters($t4, $t5, $t6, WATER_COLOR)

			jal drawHorizontalLine

			popFromStack($t4, $t5, $t6, $t3)
			popFromStack($ra, $t0, $t1, $t2)
			
			li $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j verticalBottomWaterLoop

		exitVerticalBottomWaterLoop:

	
	jr $ra

	#arguments: direction, line, column
	drawHorizontalLeftWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		add $t3, $t1, 13
		add $t4, $t1, 25

		beq $t0, LEFT, setParametersToHorizontalLeft

		add $t5, $t2, 6
		add $t8, $t2, 20
		li $t6, 1

		j horizontalLeftLoop

		setParametersToHorizontalLeft:

			add $t5, $t2, 21
			add $t8, $t2, 7
			li $t6, -1

		horizontalLeftLoop:

			beq $t5, $t8, exitHorizontalLeftLoop

			add $t5, $t5, $t6
				

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)

			sendParameters($t3, $t4, $t5, WATER_COLOR)
			jal drawVerticalLine

			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)
	
			li  $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j horizontalLeftLoop

		exitHorizontalLeftLoop:
		
	jr $ra

	#arguments: direction, line, column
	drawHorizontalRightWater:

		move $t0, $a0
		move $t1, $a1
		move $t2, $a2

		add $t3, $t1, 13
		add $t4, $t1, 25

		beq $t0, RIGHT, setParametersToHorizontalRight

		add $t5, $t2, 48
		add $t8, $t2, 34
		li $t6, -1

		j horizontalRightLoop

		setParametersToHorizontalRight:

			add $t5, $t2, 33
			add $t8, $t2, 47
			li $t6, 1

		horizontalRightLoop:

			beq $t5, $t8, exitHorizontalRightLoop

			add $t5, $t5, $t6
				

			pushInStack($ra, $t0, $t1, $t2)
			pushInStack($t3, $t4, $t5, $t6)

			sendParameters($t3, $t4, $t5, WATER_COLOR)
			jal drawVerticalLine

			popFromStack($t3, $t4, $t5, $t6)
			popFromStack($ra, $t0, $t1, $t2)
	
			li  $v0, 32
    		li $a0, WATER_TIME_OUT
    		syscall
	
			j horizontalRightLoop

		exitHorizontalRightLoop:		

	jr $ra