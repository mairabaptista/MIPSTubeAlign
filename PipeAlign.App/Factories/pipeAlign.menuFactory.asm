.data
	# Data Segment
.text
	# return address to jump
	createMenu:
		getBitmapCache(START_GAME_CACHE)
				
		beqz $v0, before_cache_menu
		
		move $t0, $v0
		
		playSound(MENU_SOUND, KEEP_VOLUME, LOOP_SOUND)
							
		#Print start screen
		#pushInStack($ra, $t0)
		#jal createStartScreen
		#popFromStack($ra, $t0)
		
		#Draw border
		pushInStack($ra, $t0)
		sendParameters(1, 1, 256, 512, BLACK_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra, $t0)
		
		pushInStack($ra, $t0)
		sendParameters(MENU_LETTER_COLOR)
		jal print_PRESS_P_TO_START				
		popFromStack($ra, $t0)
		
		beq $t0, -1, updateBitmapAndCacheMenu
		
		j before_cache_menu
		
		updateBitmapAndCacheMenu:
			refreshBitmap()
			setBitmapCache(START_GAME_CACHE)
			
		before_cache_menu:
		
		playSound(MENU_SOUND, KEEP_VOLUME, LOOP_SOUND)
		
		li $t0, 0
		li $t2, 1										# onScreen	

		readOptionsLoop: 
			lw $t1, BASE_INPUT_ADDRESS

			beq $t1, LETTER_P, start_game
			beq $t1, LETTER_E, finish_game
			
			beq $t0, 50000, refresh_letter_menu
		
			j before_refresh_letter_menu
			
			refresh_letter_menu:
				beq $t2, 1, drop_letter_menu	
				
				pushInStack($ra, $t0, $t2)
				sendParameters(MENU_LETTER_COLOR)
				jal print_PRESS_P_TO_START				
				popFromStack($ra, $t0, $t2)
				refreshBitmap()
				li $t2, 1
				li $t0, 0
				
				j before_refresh_letter_menu
				
				drop_letter_menu:
					pushInStack($ra, $t0, $t2)
					sendParameters(MENU_BACKGROUND_COLOR)
					jal print_PRESS_P_TO_START				
					popFromStack($ra, $t0, $t2)
					refreshBitmap()
					li $t2, 0
							
				li $t0, 0
			before_refresh_letter_menu:
			
			addi $t0, $t0, 1
							
		j readOptionsLoop
		
		start_game:
			la $v0, startGame
			jr $ra
			
		finish_game:
			la $v0, finishGame
	jr $ra
	
	# arguments: color
	print_PRESS_P_TO_START:	
		move $t0, $a0
			
		pushInStack($ra, $t0)
		sendParameters(516, 80, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(517, 82, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(518, 69, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(519, 83, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(520, 83, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(521, 32, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(522, 80, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(523, 32, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(524, 84, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(525, 79, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(526, 32, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(527, 83, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(528, 84, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(529, 65, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(530, 82, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(531, 84, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(532, 32, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(533, 71, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(534, 65, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(535, 77, $t0)
		jal drawLetters
		popFromStack($ra, $t0)

		pushInStack($ra, $t0)
		sendParameters(536, 69, $t0)
		jal drawLetters
		popFromStack($ra, $t0)
	jr $ra
