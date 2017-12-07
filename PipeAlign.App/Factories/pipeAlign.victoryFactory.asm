.data	
	# Data Segment
.text

	drawWinnerScreen:
		getBitmapCache(VICTORY_CACHE)

		move $t0, $v0
		
		beq $t0, 0, hasVictoryCache
		
		#Print victory screen
		#pushInStack($ra, $t0)
		#jal createVictoryScreen
		#popFromStack($ra, $t0)
	
		refreshBitmap()
		setBitmapCache(VICTORY_CACHE)

		hasVictoryCache:
	jr $ra