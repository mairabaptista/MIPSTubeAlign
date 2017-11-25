.data

.text
	# arguments: musicId,  volumeDecibels, loop
	.macro playSound(%x, %y, %z)
		li $v0, 37
		add $a0, $zero, %x
		li $a1, PLAY_SOUND	
		add $a2, $zero, %z
		add $a3, $zero, %y		
		syscall	
	.end_macro
	
	# arguments: musicId
	.macro stopSound(%x)
		li $v0, 37
		add $a0, $zero, %x
		li $a1, STOP_SOUND	
		li $a2, -1
		li $a3, -1
		syscall	
	.end_macro
	
	# arguments: no
	.macro stopAllSounds()
		li $v0, 37
		li $a0, -1
		li $a1, STOP_ALL_SOUNDS
		li $a2, -1
		li $a3, -1
		syscall	
	.end_macro
