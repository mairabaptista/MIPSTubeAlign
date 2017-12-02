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
		
		#drawNumbers
		pushInStack($ra)
		sendParameters(4, 6)
		jal crateMovesDisplay		
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
		sendParameters(6, 4)
		jal crateMovesDisplay
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
		sendParameters(4, 2)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawHorizontalTube
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
		sendParameters(4, 8)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawFirstTubeElbow
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
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawVerticalTube
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
		sendParameters(5, 2)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawSecondTubeElbow
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
		sendParameters(3, 6)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawFourthTubeElbow
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
		sendParameters(6, 2)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8)
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
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawThirdTubeElbow
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
		sendParameters(6, 0)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(8)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawThirdTubeElbow
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
		jal drawHorizontalTube
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
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawFirstTubeElbow
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
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawFourthTubeElbow
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
		sendParameters(6, 0)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(46)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47)
		jal drawHorizontalTube
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
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawFourthTubeElbow
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
		sendParameters(6, 6)
		jal crateMovesDisplay
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(2)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(5)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(6)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(7)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(15)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(16)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(17)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(24)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(26)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(30)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(33)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(37)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(39)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawFirstTubeElbow
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
		sendParameters(46)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(47)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(53)
		jal drawHorizontalTube
		popFromStack($ra)

		beq $s6, -1, updateBitmapAndCache_tenth_phase

		jr $ra

		updateBitmapAndCache_tenth_phase:
			refreshBitmap()
			setBitmapCache(TENTH_PHASE_CACHE)
	jr $ra