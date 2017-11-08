.data	
	cursorTop:		.word 	11				
	cursorLeft: 	.word 	6
		
	maxCursorTop: 	.word 	0	
	maxCursorLeft: 	.word 	0
.text
	# arguments: color
	createCursor:
		li $t9, 0
				
		lw $t0, cursorTop
		move $t3, $a0
		
		addi $t0, $t0, 1
		
		loop_cursor_horizontal:	
			lw $t1, cursorLeft
			addi $t1, $t1, 1
				
			addi $t2, $t1, CURSOR_SIZE
			subi $t2, $t2, 1
				
			sendParameters($t0, $t1, $t2, $t3)	
			pushInStack($ra)
			pushInStack($t0, $t1, $t2, $t3)
			jal drawHorizontalLine
			popFromStack($t0, $t1, $t2, $t3)
			popFromStack($ra)
		
			addi $t2, $t1, SLOT_WIDTH			
			subi $t1, $t2, CURSOR_SIZE
			addi $t1, $t1, 1
		
			sendParameters($t0, $t1, $t2, $t3)	
			pushInStack($ra)
			pushInStack($t0, $t1, $t2, $t3)
			jal drawHorizontalLine
			popFromStack($t0, $t1, $t2, $t3)
			popFromStack($ra)
			
			bnez $t9, end_loop_cursor_horizontal
			
			li $t9, 1
					
			addi $t0, $t0, SLOT_HEIGHT
					
			j loop_cursor_horizontal		
		end_loop_cursor_horizontal:
		
		li $t9, 0
		lw $t0, cursorTop
		addi $t0, $t0, 1
		
		loop_cursor_vertical:	
			lw $t2, cursorLeft
			addi $t2, $t2, 1
					
			addi $t1, $t0, CURSOR_SIZE
			subi $t1, $t1, 1
										
			sendParameters($t0, $t1, $t2, $t3)	
			pushInStack($ra)
			pushInStack($t0, $t1, $t2, $t3)
			jal drawVerticalLine
			popFromStack($t0, $t1, $t2, $t3)
			popFromStack($ra)
		
			addi $t2, $t2, SLOT_WIDTH			
					
			sendParameters($t0, $t1, $t2, $t3)	
			pushInStack($ra)
			pushInStack($t0, $t1, $t2, $t3)
			jal drawVerticalLine
			popFromStack($t0, $t1, $t2, $t3)
			popFromStack($ra)
			
			bnez $t9, end_loop_cursor_vertical
			
			li $t9, 1
					
			addi $t1, $t0, SLOT_HEIGHT
			subi $t0, $t1, CURSOR_SIZE
			addi $t0, $t0, 1
					
			j loop_cursor_vertical		
		end_loop_cursor_vertical:
	jr $ra
		
	moveCursorUp:
		lw $t0, cursorTop
		li $t1, MARGIN_TOP
		
		ble $t0, $t1, end_movimentation_up
		
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorTop
		
		subi $t0, $t0, SLOT_HEIGHT
		
		sw $t0, cursorTop
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_up:
	jr $ra
	
	moveCursorDown:
		lw $t0, cursorTop
		lw $t1, maxCursorTop
		
		bge $t0, $t1, end_movimentation_down
				
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorTop
		
		addi $t0, $t0, SLOT_HEIGHT
		
		sw $t0, cursorTop
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_down:
	jr $ra
		
	moveCursorLeft:
		lw $t0, cursorLeft
		li $t1, MARGIN_LEFT
		
		ble $t0, $t1, end_movimentation_left		
	
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorLeft
		
		subi $t0, $t0, SLOT_WIDTH
		
		sw $t0, cursorLeft
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_left:
	jr $ra
	
	moveCursorRight:	
		lw $t0, cursorLeft
		lw $t1, maxCursorLeft
		
		bge $t0, $t1, end_movimentation_right
	
		sendParameters(BACKGROUND_COLOR)
		pushInStack($ra)
		jal createCursor	
		popFromStack($ra)	
		
		lw $t0, cursorLeft
		
		addi $t0, $t0, SLOT_WIDTH
		
		sw $t0, cursorLeft
		
		sendParameters(RED_COLOR)
		pushInStack($ra)
		jal createCursor
		popFromStack($ra)
		
		end_movimentation_right:
	jr $ra
	
	toggleTube:
		#TODO
	jr $ra
	
	setMaxCursorTop:
		li $t0, VERTICAL_SLOTS
		subi $t0, $t0, 1
		
		li $t1, SLOT_HEIGHT
		mul $t0, $t0, $t1
		
		addi $t0, $t0, MARGIN_TOP
		sw $t0, maxCursorTop						
	jr $ra
	
	setMaxCursorLeft:		
		li $t0, HORIZONTAL_SLOTS
		subi $t0, $t0, 1
		
		li $t1, SLOT_WIDTH
		mul $t0, $t0, $t1
		
		addi $t0, $t0, MARGIN_LEFT
		sw $t0, maxCursorLeft
	jr $ra