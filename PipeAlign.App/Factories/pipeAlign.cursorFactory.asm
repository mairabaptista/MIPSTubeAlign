.data

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