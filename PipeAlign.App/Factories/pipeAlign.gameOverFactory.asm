.data	
	# Data Segment
.text

	drawGameOverScreen:

		getBitmapCache(GAME_OVER_CACHE)

		move $t0, $v0
		
		beq $t0, 0, hasCache

		pushInStack($ra)
		sendParameters(GAME_OVER_BACKGROUD_COLOR)
		jal fillBackgroundColor
		popFromStack($ra)

		pushInStack($ra)
		jal drawGameOverPhrase
		popFromStack($ra)

		pushInStack($ra)
		jal drawDinosaur
		popFromStack($ra)

		refreshBitmap()
		setBitmapCache(GAME_OVER_CACHE)

		hasCache:

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

		pushInStack($ra)
		sendParameters(32)
		jal getBlockFromSlot
		popFromStack($ra)

		move $t0, $v0	#line
		move $t1, $v1	#column


		#DRAW HEAD
		addi $t2, $t0, 5 	#initialLine
		addi $t3, $t2, 15	#finalLine
		addi $t4, $t1, 30	#initialBlock
		addi $t5, $t4, 15	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 7	#initialLine
		addi $t3, $t2, 11	#finalLine
		addi $t4, $t1, 28	#initialBlock
		addi $t5, $t4, 19	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		#DRAW EYES
		addi $t2, $t0, 9	#initialLine
		addi $t3, $t2, 4	#finalLine
		addi $t4, $t1, 32	#initialBlock
		addi $t5, $t4, 4	#finalBlock

		#TODO: CHANGE COLOR
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, EYE_DINOSAUR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 10	#initialLine
		addi $t3, $t2, 2	#finalLine
		addi $t4, $t1, 33	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		#TODO: CHANGE COLOR
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, EYE_DINOSAUR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)


		#DRAW BODY
		addi $t2, $t0, 19	#initialLine
		addi $t3, $t2, 15	#finalLine
		addi $t4, $t1, 26	#initialBlock
		addi $t5, $t4, 10	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 21	#initialLine
		addi $t3, $t2, 15	#finalLine
		addi $t4, $t1, 23	#initialBlock
		addi $t5, $t4, 10	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 23	#initialLine
		addi $t3, $t2, 15	#finalLine
		addi $t4, $t1, 21	#initialBlock
		addi $t5, $t4, 10	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 25	#initialLine
		addi $t3, $t2, 15	#finalLine
		addi $t4, $t1, 19	#initialBlock
		addi $t5, $t4, 10	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		#DRAW TAIL
		addi $t2, $t0, 27	#initialLine
		addi $t3, $t2, 13	#finalLine
		addi $t4, $t1, 17	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 27	#initialLine
		addi $t3, $t2, 11	#finalLine
		addi $t4, $t1, 14	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 25	#initialLine
		addi $t3, $t2, 11	#finalLine
		addi $t4, $t1, 12	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 23	#initialLine
		addi $t3, $t2, 11	#finalLine
		addi $t4, $t1, 10	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)


		addi $t2, $t0, 18	#initialLine
		addi $t3, $t2, 12	#finalLine
		addi $t4, $t1, 8	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		#DRAW ARMS

		addi $t2, $t0, 26	#initialLine
		addi $t3, $t2, 1	#finalLine
		addi $t4, $t1, 36	#initialBlock
		addi $t5, $t4, 5	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)


		addi $t2, $t0, 26	#initialLine
		addi $t3, $t2, 3	#finalLine
		addi $t4, $t1, 40	#initialBlock
		addi $t5, $t4, 1	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		#DRAW FOOT
		addi $t2, $t0, 40	#initialLine
		addi $t3, $t2, 2	#finalLine
		addi $t4, $t1, 19	#initialBlock
		addi $t5, $t4, 4	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 42	#initialLine
		addi $t3, $t2, 4	#finalLine
		addi $t4, $t1, 19	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)


		addi $t2, $t0, 46	#initialLine
		addi $t3, $t2, 2	#finalLine
		addi $t4, $t1, 19	#initialBlock
		addi $t5, $t4, 4	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)


		#DRAW FOOT
		addi $t2, $t0, 39	#initialLine
		addi $t3, $t2, 2	#finalLine
		addi $t4, $t1, 27	#initialBlock
		addi $t5, $t4, 4	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 41	#initialLine
		addi $t3, $t2, 4	#finalLine
		addi $t4, $t1, 29	#initialBlock
		addi $t5, $t4, 2	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

		addi $t2, $t0, 46	#initialLine
		addi $t3, $t2, 2	#finalLine
		addi $t4, $t1, 27	#initialBlock
		addi $t5, $t4, 4	#finalBlock

		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, WHITE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

	jr $ra
