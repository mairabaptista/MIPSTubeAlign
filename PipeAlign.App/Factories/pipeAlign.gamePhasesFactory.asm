.data	
	#Data Segment
.text
	# arguments: phaseNumber
	createPhase:
		blez $a0, finish_create
		bgt $a0, MAX_PHASES, finish_create	
			
		sw $a0, currentPhase
		li $t0, CURSOR_TOP_DEFAULT
		li $t1, CURSOR_LEFT_DEFAULT
			
		sw $t0, cursorTop
		sw $t1, cursorLeft
	
		beq $a0, 1, create_first_phase
		beq $a0, 2, create_second_phase
		
		j finish_create
		
		create_first_phase:				
			pushInStack($ra)
			sendParameters(CLEAR_SLOTS)
			jal createFirstPhase
			popFromStack($ra)			
		j finish_create
		
		create_second_phase:			
			pushInStack($ra)
			jal createSecondPhase
			popFromStack($ra)
		
		finish_create:
	jr $ra
	
	createNextPhase:
		lw $t0, currentPhase
		
		addi $t0, $t0, 1
		
		pushInStack($ra)
		sendParameters($t0)
		jal createPhase
		popFromStack($ra)
	jr $ra

	#TODO: Verificar se essa função ficará aqui

	#arguments: hundred in $a0, ten in $a1, unity $a2
	crateMovesDisplay:

		move $t0, $a0
		move $t1, $a1

		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal initializeMovesDisplayMemory
		popFromStack($ra, $t0, $t1)

		pushInStack($ra, $t1)
		sendParameters(38, $t0, NUMBER_COLOR)
		jal drawNumbers
		popFromStack($ra, $t1)
		
		pushInStack($ra)
		sendParameters(39, $t1, NUMBER_COLOR)
		jal drawNumbers
		popFromStack($ra)

	jr $ra


	#arguments: clearTubeSlots
	createBasePhase:
		bne $a0, CLEAR_SLOTS, notClearTubeSlots
	
		#Fill background color
		pushInStack($ra)		
		jal clearAllTubeGameSlots
		popFromStack($ra)
		
		refreshBitmap()

		notClearTubeSlots:
		
		#Clear slot mapping vector 
		pushInStack($ra)
		jal initializeSlotMapping
		popFromStack($ra)

		#Draw cursor	
		pushInStack($ra)
		sendParameters(RED_COLOR)
		jal createCursor	
		popFromStack($ra)
		
		pushInStack($ra)
		jal setMaxCursorTop	
		popFromStack($ra)
		
		pushInStack($ra)
		jal setMaxCursorLeft	
		popFromStack($ra)

		#Draw initial tube					
		pushInStack($ra)
		jal drawInitalTube
		popFromStack($ra)

		#Draw final tube
		pushInStack($ra)
		jal drawFinalTube
		popFromStack($ra)
					
		#Draw line below phase header
		pushInStack($ra)
		sendParameters(18, BORDER_TOP_COLOR)
		jal drawEntireLine
		popFromStack($ra)		

		#Draw phase header			
		pushInStack($ra)
		sendParameters(1, 1, 17, 512, TOP_SCREEN_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra)

		#drawNumbers
		pushInStack($ra)
		sendParameters(9, 9)
		jal crateMovesDisplay		
		popFromStack($ra)

		# Draw Moves
		pushInStack($ra)
		sendParameters(32, 77)		
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, 79)		
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)		
		sendParameters(34, 86)		
		jal drawLetters
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(35, 69)		
		jal drawLetters
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(36, 83)	
		jal drawLetters
		popFromStack($ra)

		#Draw phase border
		pushInStack($ra)
		sendParameters(1, 1, 256, 512, BLACK_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra)
	jr $ra
	
	#arguments: clearTubeSlots
	createFirstPhase:
		pushInStack($ra)
		sendParameters($a0)
		jal createBasePhase
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(2)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawSecondTubeElbow
		popFromStack($ra)
	jr $ra
	
	createSecondPhase:	
		getBitmapCache(SECOND_PHASE_CACHE)
		
		move $s6, $v0
		
		beq $s6, -1, clear_slots_second_phase
		
		sendParameters(NOT_CLEAR_SLOTS)
		
		j before_clear_slots_second_phase
		
		clear_slots_second_phase:
			sendParameters(CLEAR_SLOTS)
		
		before_clear_slots_second_phase:
		
		pushInStack($ra)		
		jal createBasePhase
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(2)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawVerticalTube
		popFromStack($ra)
		
		beq $s6, -1, updateBitmapAndCache_second_phase
		
		jr $ra
		
		updateBitmapAndCache_second_phase:
			refreshBitmap()
			setBitmapCache(SECOND_PHASE_CACHE)
	jr $ra
