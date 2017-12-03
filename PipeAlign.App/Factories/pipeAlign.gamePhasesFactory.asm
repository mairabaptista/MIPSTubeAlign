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
		beq $a0, 3, create_third_phase
		beq $a0, 4, create_fourth_phase
		beq $a0, 5, create_fifth_phase
		beq $a0, 6, create_sixth_phase
		beq $a0, 7, create_seventh_phase
		beq $a0, 8, create_eighth_phase
		beq $a0, 9, create_ninth_phase
		beq $a0, 10, create_tenth_phase
		beq $a0, 11, create_eleven_phase
		beq $a0, 12, create_twelve_phase
		beq $a0, 13, create_thirteen_phase
		beq $a0, 14, create_fourteen_phase
		beq $a0, 15, create_fifteen_phase

		j finish_create
		
		create_first_phase:				
			pushInStack($ra)
			sendParameters(CLEAR_SLOTS, 0)
			jal createFirstPhase
			popFromStack($ra)			
		j finish_create
		
		create_second_phase:			
			pushInStack($ra)
			jal createSecondPhase
			popFromStack($ra)
		j finish_create
				
		create_third_phase:			
			pushInStack($ra)
			jal createThirdPhase
			popFromStack($ra)
		j finish_create
		
		create_fourth_phase:			
			pushInStack($ra)
			jal createFourthPhase
			popFromStack($ra)
		j finish_create
				
		create_fifth_phase:			
			pushInStack($ra)
			jal createFifthPhase
			popFromStack($ra)
		j finish_create
				
		create_sixth_phase:			
			pushInStack($ra)
			jal createSixthPhase
			popFromStack($ra)
		j finish_create
				
		create_seventh_phase:			
			pushInStack($ra)
			jal createSeventhPhase
			popFromStack($ra)
		j finish_create
				
		create_eighth_phase:			
			pushInStack($ra)
			jal createEighthPhase
			popFromStack($ra)
		j finish_create
				
		create_ninth_phase:			
			pushInStack($ra)
			jal createNinthPhase
			popFromStack($ra)	
		j finish_create
		
		create_tenth_phase:			
			pushInStack($ra)
			jal createTenthPhase
			popFromStack($ra)	

		create_eleven_phase:			
			pushInStack($ra)
			jal createElevenPhase
			popFromStack($ra)

		create_twelve_phase:
			pushInStack($ra)
			jal createTwelvePhase
			popFromStack($ra)

		create_thirteen_phase:
			pushInStack($ra)
			jal createThirteenPhase
			popFromStack($ra)

		create_fourteen_phase:
			pushInStack($ra)
			jal createFourteenPhase
			popFromStack($ra)

		create_fifteen_phase:
			pushInStack($ra)
			jal createFifteenPhase
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
		
		# Draw two points
		pushInStack($ra)
		sendParameters(37, 58, BLACK_COLOR)		
		jal drawLetters
		popFromStack($ra)

		# Draw Moves
		pushInStack($ra)
		sendParameters(32, 77, BLACK_COLOR)		
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, 79, BLACK_COLOR)		
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)		
		sendParameters(34, 86, BLACK_COLOR)		
		jal drawLetters
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(35, 69, BLACK_COLOR)		
		jal drawLetters
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(36, 83, BLACK_COLOR)	
		jal drawLetters
		popFromStack($ra)

		#Draw level		
		pushInStack($ra)
		sendParameters(5, 76, BLACK_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, 69, BLACK_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, 86, BLACK_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, 69, BLACK_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(9, 76, BLACK_COLOR)
		jal drawLetters
		popFromStack($ra)


		#Draw phase border
		pushInStack($ra)
		sendParameters(1, 1, 256, 512, BLACK_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra)
	jr $ra
	
	#arguments: clearTubeSlots, hasCache
	createFirstPhase:
		pushInStack($ra, $a1)
		sendParameters($a0)
		jal createBasePhase
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(10, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra, $a1)
		
		#drawNumbers
		pushInStack($ra, $a1)
		sendParameters(3, 8)
		jal crateMovesDisplay		
		popFromStack($ra, $a1)
				
		pushInStack($ra, $a1)
		sendParameters(2, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(3, $a1)
		jal createHorizontalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(4, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(10, $a1)
		jal createHorizontalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(11, $a1)
		jal createFourthTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(12, $a1)
		jal createSecondTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(13, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(14, $a1)
		jal createFirstTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(19, $a1)
		jal createFourthTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(20, $a1)
		jal createHorizontalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(21, $a1)
		jal createThirdTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(22, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(23, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(25, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(28, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(29, $a1)
		jal createHorizontalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(31, $a1)
		jal createFirstTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(32, $a1)
		jal createFourthTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(34, $a1)
		jal createSecondTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(35, $a1)
		jal createThirdTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(38, $a1)
		jal createHorizontalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(40, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(41, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(42, $a1)
		jal createThirdTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(43, $a1)
		jal createThirdTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(44, $a1)
		jal createFourthTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(48, $a1)
		jal createFirstTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(49, $a1)
		jal createSecondTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(50, $a1)
		jal createVerticalTube
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(51, $a1)
		jal createFirstTubeElbow
		popFromStack($ra, $a1)

		pushInStack($ra, $a1)
		sendParameters(52, $a1)
		jal createSecondTubeElbow
		popFromStack($ra, $a1)
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
		sendParameters(10, 2, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(3, 8)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createVerticalTube
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_second_phase

		jr $ra

		updateBitmapAndCache_second_phase:
			refreshBitmap()
			setBitmapCache(SECOND_PHASE_CACHE)
	jr $ra

	createThirdPhase:
		getBitmapCache(THIRD_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_third_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_third_phase

		clear_slots_third_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_third_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 3, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(3, 1)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_third_phase

		jr $ra

		updateBitmapAndCache_third_phase:
			refreshBitmap()
			setBitmapCache(THIRD_PHASE_CACHE)
	jr $ra

	createFourthPhase:
		getBitmapCache(FOURTH_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_fourth_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_fourth_phase

		clear_slots_fourth_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_fourth_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 4, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(2, 9)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createVerticalTube
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_fourth_phase

		jr $ra

		updateBitmapAndCache_fourth_phase:
			refreshBitmap()
			setBitmapCache(FOURTH_PHASE_CACHE)
	jr $ra

	createFifthPhase:
		getBitmapCache(FIFTH_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_fifth_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_fifth_phase

		clear_slots_fifth_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_fifth_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 5, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(4, 2)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_fifth_phase

		jr $ra

		updateBitmapAndCache_fifth_phase:
			refreshBitmap()
			setBitmapCache(FIFTH_PHASE_CACHE)
	jr $ra

	createSixthPhase:
		getBitmapCache(SIXTH_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_sixth_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_sixth_phase

		clear_slots_sixth_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_sixth_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 6, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(3, 3)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_sixth_phase

		jr $ra

		updateBitmapAndCache_sixth_phase:
			refreshBitmap()
			setBitmapCache(SIXTH_PHASE_CACHE)
	jr $ra

	createSeventhPhase:
		getBitmapCache(SEVENTH_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_seventh_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_seventh_phase

		clear_slots_seventh_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_seventh_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 7, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(3, 8)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_seventh_phase

		jr $ra

		updateBitmapAndCache_seventh_phase:
			refreshBitmap()
			setBitmapCache(SEVENTH_PHASE_CACHE)
	jr $ra

	createEighthPhase:
		getBitmapCache(EIGHTH_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_eighth_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_eighth_phase

		clear_slots_eighth_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_eighth_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 8, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(3, 7)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_eighth_phase

		jr $ra

		updateBitmapAndCache_eighth_phase:
			refreshBitmap()
			setBitmapCache(EIGHTH_PHASE_CACHE)
	jr $ra

	createNinthPhase:
		getBitmapCache(NINTH_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_ninth_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_ninth_phase

		clear_slots_ninth_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_ninth_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 9, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(3, 8)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_ninth_phase

		jr $ra

		updateBitmapAndCache_ninth_phase:
			refreshBitmap()
			setBitmapCache(NINTH_PHASE_CACHE)
	jr $ra

	createTenthPhase:
		getBitmapCache(TENTH_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_tenth_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_tenth_phase

		clear_slots_tenth_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_tenth_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, 0, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(4, 1)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_tenth_phase

		jr $ra

		updateBitmapAndCache_tenth_phase:
			refreshBitmap()
			setBitmapCache(TENTH_PHASE_CACHE)
	jr $ra

	createElevenPhase:
		getBitmapCache(ELEVEN_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_eleven_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_eleven_phase

		clear_slots_eleven_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_eleven_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(5, 8)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_eleven_phase

		jr $ra

		updateBitmapAndCache_eleven_phase:
			refreshBitmap()
			setBitmapCache(ELEVEN_PHASE_CACHE)
	jr $ra

	createTwelvePhase:
		getBitmapCache(TWELVE_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_twelve_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_twelve_phase

		clear_slots_twelve_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_twelve_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, 2, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(4, 8)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_twelve_phase

		jr $ra

		updateBitmapAndCache_twelve_phase:
			refreshBitmap()
			setBitmapCache(TWELVE_PHASE_CACHE)
	jr $ra

	createThirteenPhase:
		getBitmapCache(THIRTEEN_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_thirteen_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_thirteen_phase

		clear_slots_thirteen_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_thirteen_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(11, 3, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(6, 6)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_thirteen_phase

		jr $ra

		updateBitmapAndCache_thirteen_phase:
			refreshBitmap()
			setBitmapCache(THIRTEEN_PHASE_CACHE)
	jr $ra

		createFourteenPhase:
		getBitmapCache(FOURTEEN_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_fourteen_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_fourteen_phase

		clear_slots_fourteen_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_fourteen_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, 4, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(5, 8)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_fourteen_phase

		jr $ra

		updateBitmapAndCache_fourteen_phase:
			refreshBitmap()
			setBitmapCache(FOURTEEN_PHASE_CACHE)
	jr $ra

	createFifteenPhase:
		getBitmapCache(FIFTEEN_PHASE_CACHE)

		move $s6, $v0

		beq $s6, -1, clear_slots_fifteen_phase

		sendParameters(NOT_CLEAR_SLOTS)

		j before_clear_slots_fifteen_phase

		clear_slots_fifteen_phase:
			sendParameters(CLEAR_SLOTS)

		before_clear_slots_fifteen_phase:

		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, 1, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, 5, BLACK_COLOR)
		jal drawNumbers
		popFromStack($ra)

		sendParameters(5, 6)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42, $s6)
		jal createFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43, $s6)
		jal createFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47, $s6)
		jal createVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48, $s6)
		jal createSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52, $s6)
		jal createHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53, $s6)
		jal createThirdTubeElbow
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_fifteen_phase

		jr $ra

		updateBitmapAndCache_fifteen_phase:
			refreshBitmap()
			setBitmapCache(FIFTEEN_PHASE_CACHE)
	jr $ra
