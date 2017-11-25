.data


.text 

	#arguments: top screen slot number in $a0, letter code in ascii $a1
	drawLetters:
        beq $a1, 32 finish_drawing_letter
		pushInStack($ra, $a0, $a1)
		sendParameters($a0)
		jal getBlockFromTopScreenSlot
		popFromStack($ra, $a0, $a1)

		move $t0, $v0
        move $t1, $v1
        add $t0, $t0, 2 					#margin    		   	

        drawLeftVerticalLine:
            beq $a1, 66, drawMiddleVerticalLine
        	beq $a1, 73, drawMiddleVerticalLine
            beq $a1, 84, drawMiddleVerticalLine

        	add $t2, $t0, 13				#letter height
        	add $t3, $t1, 1					#letter width
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
       		sendParameters($t0, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        drawMiddleVerticalLine:
        	beq $a1, 65, drawTopHorizontalLine
        	beq $a1, 67, drawTopHorizontalLine
        	beq $a1, 69, drawTopHorizontalLine
        	beq $a1, 71, drawTopHorizontalLine
        	beq $a1, 76, drawTopHorizontalLine
        	beq $a1, 77, drawTopHorizontalLine
        	beq $a1, 78, drawTopHorizontalLine
        	beq $a1, 79, drawTopHorizontalLine
        	beq $a1, 80, drawTopHorizontalLine
        	beq $a1, 82, drawTopHorizontalLine
        	beq $a1, 83, drawTopHorizontalLine

        	add $t2, $t1, 3
        	add $t3, $t0, 13				#letter height
        	add $t4, $t2, 1					#letter width
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
       		sendParameters($t0, $t2, $t3, $t4, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        drawTopHorizontalLine:
        	beq $a1, 73, dropTopHalfHorizontalLine
        	beq $a1, 76, dropTopHalfHorizontalLine
        	beq $a1, 77, dropTopHalfHorizontalLine
        	beq $a1, 78, dropTopHalfHorizontalLine

       		add $t2, $t0, 1
        	add $t3, $t1, 7
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
        	sendParameters($t0, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        dropTopHalfHorizontalLine:
        	beq $a1, 65, drawMiddleHalfHorizontalLine
        	beq $a1, 66, drawMiddleHalfHorizontalLine
            beq $a1, 67, drawMiddleHalfHorizontalLine
        	beq $a1, 69, drawMiddleHalfHorizontalLine
        	beq $a1, 76, drawMiddleHalfHorizontalLine
        	beq $a1, 77, drawMiddleHalfHorizontalLine
        	beq $a1, 78, drawMiddleHalfHorizontalLine
        	beq $a1, 79, drawMiddleHalfHorizontalLine
        	beq $a1, 82, drawMiddleHalfHorizontalLine
        	beq $a1, 83, drawMiddleHalfHorizontalLine
            beq $a1, 84, drawMiddleHalfHorizontalLine


        	add $t2, $t0, 1
        	add $t3, $t1, 5
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
        	sendParameters($t0, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        drawMiddleHalfHorizontalLine:     	
            beq $a1, 65, drawMiddleHorizontalLine
        	beq $a1, 66, drawMiddleHorizontalLine
        	beq $a1, 67, drawMiddleHorizontalLine
        	beq $a1, 73, drawBottomHalfHorizontalLine
        	beq $a1, 76, drawMiddleHorizontalLine
        	beq $a1, 77, drawMiddleHorizontalLine
        	beq $a1, 78, drawMiddleHorizontalLine
        	beq $a1, 79, drawMiddleHorizontalLine
        	beq $a1, 83, drawMiddleHorizontalLine
        	beq $a1, 84, drawMiddleHorizontalLine

        	add $t3, $t1, 5
        	add $t4, $t0, 6
        	add $t2, $t4, 1
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
       		sendParameters($t4, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        drawMiddleHorizontalLine:
        	beq $a1, 67, drawBottomHorizontalLine
        	beq $a1, 69, drawBottomHorizontalLine
        	beq $a1, 71, drawBottomHorizontalLine
        	beq $a1, 76, drawBottomHorizontalLine
        	beq $a1, 77, drawBottomHorizontalLine
        	beq $a1, 78, drawBottomHorizontalLine
        	beq $a1, 79, drawBottomHorizontalLine
        	beq $a1, 80, drawBottomHorizontalLine
        	beq $a1, 82, drawBottomHorizontalLine
        	beq $a1, 84, drawBottomHorizontalLine

        	add $t3, $t1, 8
        	add $t4, $t0, 6
        	add $t2, $t4, 1
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
       		sendParameters($t4, $t1, $t2, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        drawBottomHorizontalLine:
        	beq $a1, 65, drawRightVerticalLine
        	beq $a1, 77, drawRightVerticalLine
        	beq $a1, 78, drawRightVerticalLine
        	beq $a1, 80, drawRightVerticalLine
        	beq $a1, 82, drawRightVerticalLine
        	beq $a1, 84, drawRightVerticalLine

        	add $t2, $t0, 12
        	add $t3, $t1, 7
        	add $t4, $t2, 1
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
        	sendParameters($t2, $t1, $t4, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        drawRightVerticalLine:
        	beq $a1, 67, drawBottomHalfHorizontalLine
        	beq $a1, 69, drawBottomHalfHorizontalLine
        	beq $a1, 71, drawBottomHalfHorizontalLine
        	beq $a1, 76, drawBottomHalfHorizontalLine
        	beq $a1, 80, drawBottomHalfHorizontalLine
        	beq $a1, 82, drawBottomHalfHorizontalLine
        	beq $a1, 83, drawBottomHalfHorizontalLine
        	beq $a1, 84, drawBottomHalfHorizontalLine

        	add $t2, $t1, 7
        	add $t3, $t0, 13
        	add $t4, $t2, 1
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
       		sendParameters($t0, $t2, $t3, $t4, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

       	drawBottomHalfHorizontalLine:
       		beq $a1, 65, finish_drawing_letter
            beq $a1, 67, finish_drawing_letter
       		beq $a1, 69, finish_drawing_letter
       		beq $a1, 76, finish_drawing_letter
       		beq $a1, 77, finish_drawing_letter
       		beq $a1, 78, finish_drawing_letter
       		beq $a1, 79, finish_drawing_letter
       		beq $a1, 80, finish_drawing_letter
       		beq $a1, 82, finish_drawing_letter
       		beq $a1, 83, finish_drawing_letter
       		beq $a1, 84, finish_drawing_letter

        	add $t2, $t0, 12
        	add $t3, $t1, 5
        	add $t4, $t2, 1
        	pushInStack($ra, $t0, $t1)
        	pushInStack($a0, $a1)
        	sendParameters($t2, $t1, $t4, $t3, BORDER_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($a0, $a1)
        	popFromStack($ra, $t0, $t1)

        finish_drawing_letter:
        	refreshBitmap()
	jr $ra
