.data


.text 

	#arguments: top screen slot number in $a0, letter code in ascii $a1 
	drawLetter:
		pushInStack($ra)
		jal getBlockFromTopScreenSlot
		popFromStack($ra)

		move $t0, $v0
        move $t1, $v1

	jr $ra


