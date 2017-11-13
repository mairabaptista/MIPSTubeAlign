.data	
	
.text
	moveCursorUp:		
		lw $t0, cursorTop
		lw $t1, cursorLeft
		li $t2, MARGIN_TOP
		
		beq $t1, MARGIN_LEFT, break_first_slot_up
		
		j verify_movement_valid_up	
								
		break_first_slot_up:
			addi $t2, $t2, SLOT_HEIGHT
		
		verify_movement_valid_up:
			ble $t0, $t2, end_movimentation_up
				
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorTop
		
		subi $t0, $t0, SLOT_HEIGHT
		
		sw $t0, cursorTop
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_up:

	jr $ra
	
	moveCursorDown:
		lw $t0, cursorTop
		lw $t1, maxCursorTop
		
		bge $t0, $t1, end_movimentation_down
				
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorTop
		
		addi $t0, $t0, SLOT_HEIGHT
		
		sw $t0, cursorTop
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_down:

	jr $ra
		
	moveCursorLeft:
		lw $t0, cursorLeft
		lw $t1, cursorTop
		li $t2, MARGIN_LEFT
		
		beq $t1, MARGIN_TOP, break_first_slot_left
		
		j verify_movement_valid_left	
								
		break_first_slot_left:
			addi $t2, $t2, SLOT_WIDTH		
		
		verify_movement_valid_left:
			ble $t0, $t2, end_movimentation_left	
	
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorLeft
		
		subi $t0, $t0, SLOT_WIDTH
		
		sw $t0, cursorLeft
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_left:

	jr $ra
	
	moveCursorRight:	
		lw $t0, cursorLeft
		lw $t1, maxCursorLeft
		
		bge $t0, $t1, end_movimentation_right
	
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorLeft
		
		addi $t0, $t0, SLOT_WIDTH
		
		sw $t0, cursorLeft
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_right:

	jr $ra
	
	setMaxCursorLeft:		
		li $t0, HORIZONTAL_SLOTS
		subi $t0, $t0, 1
		
		li $t1, SLOT_WIDTH
		mul $t0, $t0, $t1
		
		addi $t0, $t0, MARGIN_LEFT
		subi $t0, $t0, SLOT_WIDTH
				
		sw $t0, maxCursorLeft

	jr $ra
		
	setMaxCursorTop:
		li $t0, VERTICAL_SLOTS
		subi $t0, $t0, 1
		
		li $t1, SLOT_HEIGHT
		mul $t0, $t0, $t1
		
		addi $t0, $t0, MARGIN_TOP
		sw $t0, maxCursorTop

	jr $ra

	
	#arguments: No parameters
	toggleTube:
		la $t1 ,slotMapping
		lw $t2, cursorTop
		lw $t3, cursorLeft
		
		pushInStack($ra, $t1, $t2, $t3)
		sendParameters($t2, $t3)
		jal clearSlot
		popFromStack($ra, $t1, $t2, $t3)
			
		pushInStack($ra, $t1)
		sendParameters($t2, $t3)
		jal getSlotFromBlock
		popFromStack($ra, $t1)
		
		move $t4, $v0
		
		subi $t5, $t4, 1
		add $t1, $t1, $t5
		
		lb $t5, 0($t1)
		
		beq $t5, 0, finishDraw
		beq $t5, HORIZONTAL_TUBE, toVertical
		beq $t5, VERTICAL_TUBE, toHorizontal
		beq $t5, FIRST_TUBE_ELBOW, toSecondElbow
		beq $t5, SECOND_TUBE_ELBOW, toFourthElbow
		beq $t5, THIRD_TUBE_ELBOW, toFirstElbow
		beq $t5, FOURTH_TUBE_ELBOW, toThirdElbow
	
		toVertical:
			pushInStack($ra,$t4)
			sendParameters($t4)
			jal drawVerticalTube
			popFromStack($ra, $t4)
	
			pushInStack($ra, $t4)
			sendParameters($t4, VERTICAL_TUBE)
			jal setTubeType
			popFromStack($ra, $t4)
			j finishDraw
		
		toHorizontal:
			pushInStack($ra, $t4)
			sendParameters($t4)
			jal drawHorizontalTube
			popFromStack($ra, $t4)
		
			pushInStack($ra, $t4)
			sendParameters($t4, HORIZONTAL_TUBE)
			jal setTubeType
			popFromStack($ra, $t4)
		
			j finishDraw
			
		toSecondElbow:
			pushInStack($ra, $t4)
			sendParameters($t4)
			jal drawSecondTubeElbow
			popFromStack($ra, $t4)
		
			pushInStack($ra, $t4)
			sendParameters($t4, SECOND_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $t4)
		
			j finishDraw
		
		toFourthElbow:
			pushInStack($ra, $t4)
			sendParameters($t4)
			jal drawFourthTubeElbow
			popFromStack($ra, $t4)
		
			pushInStack($ra, $t4)
			sendParameters($t4, FOURTH_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $t4)
			
			j finishDraw
		
		toFirstElbow:
			pushInStack($ra, $t4)
			sendParameters($t4)
			jal drawFirstTubeElbow
			popFromStack($ra, $t4)
		
			pushInStack($ra, $t4)
			sendParameters($t4, FIRST_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $t4)
				
			j finishDraw
		
		toThirdElbow:	
			pushInStack($ra, $t4)
			sendParameters($t4)
			jal drawThirdTubeElbow
			popFromStack($ra, $t4)
		
			pushInStack($ra, $t4)
			sendParameters($t4, THIRD_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $t4)
						
		finishDraw:
			
	jr $ra

	
	#arguments: No parameters
	initializeSlotMapping:
		
		li $t0, 0
		li $t1, 0
		la $t2, slotMapping
	
		while: beq $t1, 54, exit
			
			sb $t0, 0($t2)
			
			add $t2, $t2, 1
			add $t1, $t1, 1
		j while
		
		exit:
		
	jr $ra
	
	#arguments: Slot in $a0 ,Type of tube in $a1
	setTubeType:	
		la $t1, slotMapping

		subi $a0, $a0, 1
		add $t1, $t1, $a0
		
		sb $a1, 0($t1)

	jr $ra

	readInput:
			readInputLoop:
				lw $t1, BASE_INPUT_ADDRESS
				
				beq $t1, LETTER_W, onWPress			
				beq $t1, LETTER_A, onAPress 
				beq $t1, LETTER_D, onDPress 
				beq $t1, LETTER_S, onSPress
				beq $t1, SPACE_KEY, onSpacePress  					
						
				j notKeyPressValid
			
				onWPress:
					pushInStack($ra)
					jal moveCursorUp
					popFromStack($ra)
				j beforeKeyPress			
			
				onAPress:
					pushInStack($ra)
					jal moveCursorLeft
					popFromStack($ra)
				j beforeKeyPress
			
				onDPress:
					pushInStack($ra)
					jal moveCursorRight
					popFromStack($ra)
				j beforeKeyPress
			
				onSPress:
					pushInStack($ra)
					jal moveCursorDown
					popFromStack($ra)
				j beforeKeyPress

				onSpacePress:
					pushInStack($ra)
					jal toggleTube
					popFromStack($ra)
				j beforeKeyPress
			
				beforeKeyPress:		
					sw $zero, BASE_INPUT_ADDRESS
							
				notKeyPressValid:

			j readInputLoop
		jr $ra    