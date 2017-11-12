.data	
	# Data Segment	
.text

	#arguments: Cursor top in $a0, Cursor left in $a1
	clearSlot:
	
		#Removes the vertical drawing
		add $t1, $a0, 1
		add $t2, $a0, 39		
		
		add $t3, $a1, 15
		add $t4, $a1, 41
		
		pushInStack($ra, $a0, $a1)
		sendParameters($t1, $t3, $t2, $t4, BACKGROUND_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $a0, $a1)
		
		#Removes left horizontal drawing
		add $t1, $a0, 8
		add $t2, $a0, 32		
		
		add $t3, $a1, 1
		add $t4, $a1, 14
		
		pushInStack($ra, $a0, $a1)
		sendParameters($t1, $t3, $t2, $t4, BACKGROUND_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $a0, $a1)
		
		
		#Removes right horizontal drawing
		add $t1, $a0, 8
		add $t2, $a0, 32		
		
		add $t3, $a1, 42
		add $t4, $a1, 55
		
		pushInStack($ra, $a0, $a1)
		sendParameters($t1, $t3, $t2, $t4, BACKGROUND_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $a0, $a1)		
	jr $ra
