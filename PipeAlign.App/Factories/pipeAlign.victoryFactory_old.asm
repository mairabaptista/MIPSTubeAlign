.data	
	# Data Segment
.text

	drawWinnerScreen:

		getBitmapCache(VICTORY_CACHE)

		move $t0, $v0
		
		beq $t0, 0, hasVictoryCache
				
		pushInStack($ra)
		sendParameters(WINNER_BACKGROUD_COLOR)
		jal fillBackgroundColor
		popFromStack($ra)

		pushInStack($ra)
		jal drawWinnerPhrase
		popFromStack($ra)

		refreshBitmap()
		setBitmapCache(VICTORY_CACHE)

		hasVictoryCache:

	jr $ra

	
	drawWinnerPhrase:
		
		pushInStack($ra)
		sendParameters(230, 71, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(231, 82, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(232, 69, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(233, 65, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(234, 84, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

	jr $ra
