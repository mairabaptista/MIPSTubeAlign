.data


.text 

	#arguments: top screen slot number in $a0, letter code in ascii $a1 
	drawLetters:
		pushInStack($ra)
		sendParameters(28)
		jal getBlockFromTopScreenSlot
		popFromStack($ra)

		move $t0, $v0
        move $t1, $v1

        #add $t2, $t0, 10
        add $t0, $t0, 3
        add $t2, $t0, 10				#letter height
        add $t3, $t1, 1					#vertical line width

        pushInStack($ra, $t0, $t1)
        sendParameters($t0, $t1, $t2, $t3, RED_COLOR, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)

        add $t2, $t0, 1
        add $t3, $t1, 7
        pushInStack($ra, $t0, $t1, $t3)
        sendParameters($t0, $t1, $t2, $t3, RED_COLOR, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1, $t3)

        sub $t3, $t3, 2
        add $t0, $t0, 5
        add $t2, $t0, 1
        pushInStack($ra, $t0, $t1)
        sendParameters($t0, $t1, $t2, $t3, RED_COLOR, FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)            

	jr $ra