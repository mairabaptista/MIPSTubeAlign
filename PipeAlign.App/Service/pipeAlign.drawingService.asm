.data	
	# Data Segment	
.text
	#arguments: Cursor top in $a0, Cursor left in $a1
	clearSlot:			
		pushInStack($ra)
		jal getSlotFromBlock
		popFromStack($ra)
		
		move $t1, $v0
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
			
			lb $t2, ($t2)
			lb $t4, ($t4)
			
			beq $t2, VERTICAL_TUBE, clearVerticalTop
			beq $t2, THIRD_TUBE_ELBOW, clearVerticalTop
			beq $t2, FOURTH_TUBE_ELBOW, clearVerticalTop
			beq $v0, 10, clearVerticalTop
			
			li $t5, 0
					
			continue_vertical_clear:
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
