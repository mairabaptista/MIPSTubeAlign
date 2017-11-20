.data


.text 

	#arguments: top screen slot number in $a0, letter code in ascii $a1
	drawLetters:
		pushInStack($ra, $a0)
		sendParameters($a0)
		jal getBlockFromTopScreenSlot
		popFromStack($ra, $a0)

		move $t0, $v0
        move $t1, $v1
        add $t0, $t0, 3 					#margin    		   	

        drawLeftVerticalLine:
        	add $t2, $t0, 10				#letter height
        	add $t3, $t1, 1	
        	pushInStack($ra, $t0, $t1)
       		sendParameters($t0, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)

        drawTopHorizontalLine:
        	add $t2, $t0, 1
        	add $t3, $t1, 7
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)

        drawMiddleHalfHorizontalLine:
        	add $t3, $t1, 5
        	add $t4, $t0, 5
        	add $t2, $t4, 1
        	pushInStack($ra, $t0, $t1)
       		sendParameters($t4, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)

        drawBottomHorizontalLine:
        	add $t2, $t0, 10
        	add $t3, $t1, 7
        	add $t4, $t2, 1
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t2, $t1, $t4, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)

        drawRightVerticalLine: 
        	add $t2, $t1, 7
        	add $t3, $t0, 11
        	add $t4, $t2, 1
        	pushInStack($ra, $t0, $t1)
       		sendParameters($t0, $t2, $t3, $t4, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)

	jr $ra