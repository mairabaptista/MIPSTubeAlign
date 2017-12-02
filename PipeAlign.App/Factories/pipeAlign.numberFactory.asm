.data


.text

	#arguments: top screen slot number in $a0, number in $a1, color in $a2
	drawNumbers:
        
		pushInStack($ra, $a0, $a1, $a2)
		sendParameters($a0)
		jal getBlockFromTopScreenSlot
		popFromStack($ra, $a0, $a1, $a2)

		move $t0, $v0                         #line
        move $t1, $v1                         #column
        add $t0, $t0, 2

        move $t5, $a2                         #color


        #Cases to draw the top right

        beq $a1, 0, drawTopRight
        beq $a1, 1, drawTopRight
        beq $a1, 2, drawTopRight
        beq $a1, 3, drawTopRight
        beq $a1, 4, drawTopRight
        beq $a1, 5, drawTopleft
        beq $a1, 6, drawTop
        beq $a1, 7, drawTopRight
        beq $a1, 8, drawTopRight
        beq $a1, 9, drawTopRight


        drawTopRight:
            pushInStack($ra, $t0, $t1, $a0)
            pushInStack($a1, $t5)
            sendParameters($t0, $t1, $t5)
            jal drawRigthVerticalLineTop
            popFromStack($a1, $t5)
            popFromStack($ra, $t0, $t1, $a0)

            beq $a1, 0, drawBottomRight
            beq $a1, 1, drawBottomRight
            beq $a1, 2, drawMiddle
            beq $a1, 3, drawBottomRight
            beq $a1, 4, drawBottomRight
            beq $a1, 7, drawBottomRight
            beq $a1, 8, drawBottomRight
            beq $a1, 9, drawBottomRight


        drawBottomRight:
            
            pushInStack($ra, $t0, $t1, $a0)
            pushInStack($a1, $t5)
            sendParameters($t0, $t1, $t5)
            jal drawRigthVerticalLineBottom
            popFromStack($a1, $t5)
            popFromStack($ra, $t0, $t1, $a0)

            beq $a1, 0, drawTop
            beq $a1, 1, finish_drawing_number
            beq $a1, 3, drawTop
            beq $a1, 4, drawMiddle
            beq $a1, 5, drawBottom
            beq $a1, 6, drawBottom
            beq $a1, 7, drawTop
            beq $a1, 8, drawTopleft
            beq $a1, 9, drawMiddle


        drawTopleft:

            pushInStack($ra, $t0, $t1, $a0)
            pushInStack($a1, $t5)
            sendParameters($t0, $t1, $t5)
            jal drawLeftVeticalLineTop
            popFromStack($a1, $t5)
            popFromStack($ra, $t0, $t1, $a0)


            beq $a1, 0, drawBottomLeft
            beq $a1, 4, finish_drawing_number
            beq $a1, 5, drawMiddle
            beq $a1, 6, drawMiddle
            beq $a1, 8, drawBottomLeft
            beq $a1, 9, drawTop

        drawBottomLeft:

            pushInStack($ra, $t0, $t1, $a0)
            pushInStack($a1, $t5)
            sendParameters($t0, $t1, $t5)
            jal drawLeftVerticalLineBottom
            popFromStack($a1, $t5)
            popFromStack($ra, $t0, $t1, $a0)

            beq $a1, 0, finish_drawing_number
            beq $a1, 2, drawBottom
            beq $a1, 6, finish_drawing_number
            beq $a1, 8, drawTop

        drawTop:

            pushInStack($ra, $t0, $t1, $a0)
            pushInStack($a1, $t5)
            sendParameters($t0, $t1, $t5)
            jal drawTopHorizontalLineNumber
            popFromStack($a1, $t5)
            popFromStack($ra, $t0, $t1, $a0)

            beq $a1, 0, drawBottom
            beq $a1, 2, finish_drawing_number
            beq $a1, 3, drawMiddle
            beq $a1, 5, finish_drawing_number
            beq $a1, 6, drawTopleft
            beq $a1, 7, finish_drawing_number
            beq $a1, 8, drawMiddle
            beq $a1, 9, finish_drawing_number

        drawMiddle:
            pushInStack($ra, $t0, $t1, $a0)
            pushInStack($a1, $t5)
            sendParameters($t0, $t1, $t5)
            jal drawMiddleHorizontalLineNumber
            popFromStack($a1, $t5)
            popFromStack($ra, $t0, $t1, $a0)

            beq $a1, 2, drawBottomLeft
            beq $a1, 3, drawBottom
            beq $a1, 4, drawTopleft
            beq $a1, 5, drawBottomRight
            beq $a1, 6, drawBottomRight
            beq $a1, 8, drawBottom
            beq $a1, 9, drawTopleft


        drawBottom:

            pushInStack($ra, $t0, $t1, $a0)
            pushInStack($a1, $t5)
            sendParameters($t0, $t1, $t5)
            jal drawBottomHorizontalLineNumber
            popFromStack($a1, $t5)
            popFromStack($ra, $t0, $t1, $a0)

            beq $a1, 0, drawTopleft
            beq $a1, 2, drawTop
            beq $a1, 3, finish_drawing_number
            beq $a1, 5, drawTop
            beq $a1, 6, drawBottomLeft
            beq $a1, 8, finish_drawing_number


        finish_drawing_number:
            refreshBitmap()

	jr $ra


    #arguments: line in $a0, column in $a1, color in $a2
    drawRigthVerticalLineTop:

        addi $t1, $a1, 12   #Initial column
        addi $t2, $t1, 1    #Final column

        addi $t3, $a0, 1    #Initial Line  
        addi $t4, $a0, 7   #Final line

        move $t5, $a2

        pushInStack($ra, $t0, $t1)
        sendParameters($t3, $t1, $t4, $t2, $t5, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)

    jr $ra

    #arguments: line in $a0, column in $a1, color in $a2
    drawRigthVerticalLineBottom:

        addi $t1, $a1, 12   #Initial column
        addi $t2, $t1, 1    #Final column

        addi $t3, $a0, 6   #Initial Line  
        addi $t4, $a0, 12   #Final line

        move $t5, $a2      #Color

        pushInStack($ra, $t0, $t1)
        sendParameters($t3, $t1, $t4, $t2, $t5, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)

    jr $ra

    #arguments: line in $a0, column in $a1, color in $a2
    drawLeftVeticalLineTop:

        addi $t1, $a1, 4
        addi $t2, $t1, 1    #Final column

        addi $t3, $a0, 1    #Initial Line  
        addi $t4, $a0, 7   #Final line

        move $t5, $a2      #Color

        pushInStack($ra, $t0, $t1)
        sendParameters($t3, $t1, $t4, $t2, $t5, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)


    jr $ra

    #arguments: line in $a0, column in $a1, color in $a2
    drawLeftVerticalLineBottom:

        addi $t1, $a1, 4   #Initial column
        addi $t2, $t1, 1   #Final column

        addi $t3, $a0, 6   #Initial Line  
        addi $t4, $a0, 12  #Final line

        move $t5, $a2      #Color

        pushInStack($ra, $t0, $t1)
        sendParameters($t3, $t1, $t4, $t2, $t5, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)

    jr $ra

    #arguments: line in $a0, column in $a1, color in $a2
    drawTopHorizontalLineNumber:

        addi $t1, $a1, 4   #Initial column
        addi $t2, $a1, 13    #Final column

        addi $t3, $a0, 1   #Initial Line  
        addi $t4, $t3, 1   #Final line

        move $t5, $a2      #Color

        pushInStack($ra, $t0, $t1)
        sendParameters($t3, $t1, $t4, $t2, $t5, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)

    jr $ra


    #arguments: line in $a0, column in $a1, color in $a2
    drawMiddleHorizontalLineNumber:

        addi $t1, $a1, 6   #Initial column
        addi $t2, $a1, 11   #Final column

        addi $t3, $a0, 6   #Initial Line  
        addi $t4, $t3, 1   #Final line

        move $t5, $a2      #Color

        pushInStack($ra, $t0, $t1)
        sendParameters($t3, $t1, $t4, $t2, $t5, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)

    jr $ra


    #arguments: line in $a0, column in $a1, color in $a2
    drawBottomHorizontalLineNumber:

        addi $t1, $a1, 4  #Initial column
        addi $t2, $a1, 12    #Final column

        addi $t3, $a0, 11   #Initial Line  
        addi $t4, $t3, 1   #Final line

        move $t5, $a2

        pushInStack($ra, $t0, $t1)
        sendParameters($t3, $t1, $t4, $t2, $t5, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)

    jr $ra