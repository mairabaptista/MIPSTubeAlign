.data
	# Data Segment
.text
		createMenu:

		#Fill background color
		pushInStack($ra)
		sendParameters(BACKGROUND_COLOR)
		jal fillBackgroundColor	
		popFromStack($ra)

			readOptionsLoop: 
				lw $t1, BASE_INPUT_ADDRESS

				beq $t1, LETTER_K, startGame
				beq $t1, LETTER_L, finishGame
			j readOptionsLoop

		jr $ra
		
											
	
