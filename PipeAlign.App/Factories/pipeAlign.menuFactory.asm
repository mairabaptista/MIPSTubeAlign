.data
	# Data Segment
.text
	# return address to jump
	createMenu:
		getBitmapCache(START_GAME_CACHE)
		
		beqz $v0, before_cache_menu
						
		move $t0, $v0
		
		#Print start screen
		pushInStack($ra, $t0)
		jal createStartScreen
		popFromStack($ra, $t0)
		
		#Draw border
		pushInStack($ra, $t0)
		sendParameters(1, 1, 256, 512, BLACK_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra, $t0)
		
		pushInStack($ra, $t0)
		jal print_PRESS_P_TO_START				
		popFromStack($ra, $t0)
		
		beq $t0, -1, updateBitmapAndCacheMenu
		
		j before_cache_menu
		
		updateBitmapAndCacheMenu:
			refreshBitmap()
			setBitmapCache(START_GAME_CACHE)
			
		before_cache_menu:	

		readOptionsLoop: 
			lw $t1, BASE_INPUT_ADDRESS

			beq $t1, LETTER_P, start_game
			beq $t1, LETTER_E, finish_game				
		j readOptionsLoop
		
		start_game:
			la $v0, startGame
			jr $ra
			
		finish_game:
			la $v0, finishGame
	jr $ra
			
	print_PRESS_P_TO_START:		
		pushInStack($ra)
		sendParameters(516, 80, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(517, 82, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(518, 69, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(519, 83, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(520, 83, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(521, 32, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(522, 80, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(523, 32, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(524, 84, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(525, 79, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(526, 32, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(527, 83, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(528, 84, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(529, 65, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(530, 82, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(531, 84, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(532, 32, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(533, 71, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(534, 65, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(535, 77, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(536, 69, MENU_LETTER_COLOR)
		jal drawLetters
		popFromStack($ra)
	jr $ra
