.data	
	# Data Segment	
.text
	#arguments: Cursor top in $a0, Cursor left in $a1
	clearSlot:			
		pushInStack($ra)
		jal getSlotFromBlock
		popFromStack($ra)
		
		move $t1, $v0
		move $s0, $v0
		
		la $t0, slotMapping
		add $t0, $t0, $t1
		subi $t0, $t0, 1
		lb $t1, ($t0)
		
		li $t5, 0
		li $t6, 0
		li $t8, 0
		li $t9, 0
						
		clearVertical:
			subi $t2, $t0, 9
			addi $t4, $t0, 9
			
			blt $s0, 10, clear_vertical
						
			lb $t2, ($t2)
			lb $t4, ($t4)
			
			beq $t2, VERTICAL_TUBE, clearVerticalTop
			beq $t2, THIRD_TUBE_ELBOW, clearVerticalTop
			beq $t2, FOURTH_TUBE_ELBOW, clearVerticalTop
			beq $v0, 10, clearVerticalTop
			
			li $t5, 0
					
			continue_vertical_clear:
				bgt $s0, 45, clear_vertical
				beq $t4, VERTICAL_TUBE, clearVerticalBottom
				beq $t4, FIRST_TUBE_ELBOW, clearVerticalBottom
				beq $t4, SECOND_TUBE_ELBOW, clearVerticalBottom
				
				li $t6, 0
		j clear_vertical
		
		clearHorizontal:		
			subi $t2, $t0, 1
			addi $t4, $t0, 1
			
			lb $t2, ($t2)
			lb $t4, ($t4)
			
			beq $t2, HORIZONTAL_TUBE, clearHorizontalLeft
			beq $t2, SECOND_TUBE_ELBOW, clearHorizontalLeft
			beq $t2, FOURTH_TUBE_ELBOW, clearHorizontalLeft
						
			li $t8, 0
			li $t5, 0
			li $t6, 0
					
			continue_horizontal_clear:
				beq $t4, HORIZONTAL_TUBE, clearHorizontalRight
				beq $t4, FIRST_TUBE_ELBOW, clearHorizontalRight
				beq $t4, THIRD_TUBE_ELBOW, clearHorizontalRight
				beq $s0, 44, clearHorizontalRight
				
				li $t9, 0
				li $t5, 0
				li $t6, 0
		j clear_horizontal
		
		clearHorizontalLeft:	
			li $t8, 1
			li $t5, 0
			li $t6, 0
		j continue_horizontal_clear
		
		clearHorizontalRight:
			li $t9, -1
			li $t5, 0
			li $t6, 0
		j clear_horizontal
			
		clearVerticalTop:
			li $t5, 1
			li $t8, 0
			li $t9, 0
		j continue_vertical_clear
		
		clearVerticalBottom:
			li $t6, -1
			li $t8, 0
			li $t9, 0
			
		clear_vertical:			
			#Removes the vertical drawing
			add $t1, $a0, 1
			add $t1, $t1, $t5
			add $t2, $a0, 39
			add $t2, $t2, $t6		
		
			add $t3, $a1, 15
			add $t5, $a1, 41
		
			pushInStack($ra, $a0, $a1, $t0)
			pushInStack($t5, $t6, $t8, $t9)
			sendParameters($t1, $t3, $t2, $t5, BACKGROUND_COLOR, FILLED)
			jal drawRectangle
			popFromStack($t5, $t6, $t8, $t9)
			popFromStack($ra, $a0, $a1, $t0)
			
		j clearHorizontal
		
		clear_horizontal:
			#Removes left horizontal drawing		
			add $t1, $a0, 8
			add $t2, $a0, 32		
		
			add $t3, $a1, 1
			add $t3, $t3, $t8
			add $t4, $a1, 14
		
			pushInStack($ra, $a0, $a1, $t0)
			pushInStack($t5, $t6, $t8, $t9)
			sendParameters($t1, $t3, $t2, $t4, BACKGROUND_COLOR, FILLED)
			jal drawRectangle
			popFromStack($t5, $t6, $t8, $t9)
			popFromStack($ra, $a0, $a1, $t0)		
				
			#Removes right horizontal drawing
			add $t1, $a0, 8
			add $t2, $a0, 32		
		
			add $t3, $a1, 42		
			add $t4, $a1, 55
			add $t4, $t4, $t9	
		
			pushInStack($ra, $a0, $a1)
			sendParameters($t1, $t3, $t2, $t4, BACKGROUND_COLOR, FILLED)
			jal drawRectangle
			popFromStack($ra, $a0, $a1)					
		end_clear:
	jr $ra
	
	# arguments: no
	clearAllTubeGameSlots:
		sendParameters(2)
		pushInStack($ra)
		jal getBlockFromSlot
		popFromStack($ra)
		
		move $t0, $v0
		move $t1, $v1		
		
		pushInStack($ra, $t0, $t1)
		sendParameters(8)
		jal getBlockFromSlot
		popFromStack($ra, $t0, $t1)
		
		add $v0, $v0, SLOT_HEIGHT
		add $v1, $v1, SLOT_WIDTH
		move $t2, $t0
		move $t3, $v1
						
		pushInStack($ra, $t2, $t3)
		sendParameters($t0, $t1, $v0, $v1, BACKGROUND_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t2, $t3)	
		
		pushInStack($ra, $t2, $t3)
		sendParameters(45)
		jal getBlockFromSlot
		popFromStack($ra, $t2, $t3)
		
		pushInStack($ra, $t2, $t3, $v0)
		sendParameters($t2, $v0, $t3, BACKGROUND_COLOR)
		jal drawVerticalLine
		popFromStack($ra, $t2, $t3, $v0)	
		
		add $v0, $v0, SLOT_HEIGHT
		add $t2, $v0, SLOT_HEIGHT
		
		pushInStack($ra)
		sendParameters($v0, $t2, $t3, BACKGROUND_COLOR)
		jal drawVerticalLine
		popFromStack($ra)	
				
		pushInStack($ra)
		sendParameters(10)
		jal getBlockFromSlot
		popFromStack($ra)
		
		move $t0, $v0
		move $t1, $v1	
		
		pushInStack($ra, $t0, $t1)
		sendParameters(53)
		jal getBlockFromSlot
		popFromStack($ra, $t0, $t1)
		
		add $v0, $v0, SLOT_HEIGHT
		add $v1, $v1, SLOT_WIDTH		
		subi $v1, $v1, 1
		
		pushInStack($ra)
		sendParameters($t0, $t1, $v0, $v1, BACKGROUND_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra)			
	jr $ra