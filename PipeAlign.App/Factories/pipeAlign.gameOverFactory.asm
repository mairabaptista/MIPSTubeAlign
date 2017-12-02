.data	
	# Data Segment
.text

	drawGameOverScreen:

		pushInStack($ra)
		sendParameters(BACKGROUND_COLOR)
		jal fillBackgroundColor
		popFromStack($ra)

		pushInStack($ra)
		jal drawGameOverPhrase
		popFromStack($ra)

		refreshBitmap()

	jr $ra

	
	drawGameOverPhrase:

		pushInStack($ra)
		sendParameters(271, 71, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(272, 65, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(273, 77, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(274, 69, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(275, 32, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(276, 79, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(277, 86, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(278, 69, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(279, 82, WHITE_COLOR)
		jal drawLetters
		popFromStack($ra)


	jr $ra


	drawDinosaur:



	jr $ra
