.data
	#Screen 
	.eqv SCREEN_WIDTH 			1024
	.eqv SCREEN_HEIGHT			512
	.eqv UNIT_WIDTH				8
	.eqv UNIT_HEIGHT			8
	.eqv BASE_ADDRESS 			0x10010000
	
	#Colors	
	.eqv BACKGROUND_COLOR		0x0000ff
	.eqv RED_COLOR		 		0xff0000
	.eqv GREEN_COLOR 			0x00ff00
	.eqv BLUE_COLOR				0x0000ff
	
	#Orientation
	.eqv HORIZONTAL				0
	.eqv VERTICAL				1
	.eqv MAIN_DIAGONAL			2
	.eqv SECONDARY_DIAGONAL		3	
.text
	#Macros
	.macro pushInStack(%x)
		sub $sp, $sp, 4								# adjust to push in stack
		sw  %x, 0($sp)								# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y)
		sub $sp, $sp, 8								# adjust to push in stack
		sw  %x, 4($sp)								# push register in stack
		sw  %y, 0($sp)								# push register in stack
	.end_macro
	
	.macro popFromStack(%x)
		lw  %x, 0($sp)								# restore register from stack
		add $sp, $sp, 4								# adjust $sp
	.end_macro
	
	.macro popFromStack(%x, %y)
		lw  %y, 0($sp)								# restore register from stack
		lw  %x, 4($sp)								# restore register from stack
		add $sp, $sp, 8								# adjust $sp
	.end_macro
	
	.macro sendParameters(%x)						
		add $a0, $zero, %x	
	.end_macro
	
	.macro sendParameters(%x, %y)					
		sendParameters(%x)
		add $a1, $zero, %y	
	.end_macro
	
	.macro sendParameters(%x, %y, %z)				
		sendParameters(%x, %y)
		add $a2, $zero, %z	
	.end_macro
	
	.macro sendParameters(%x, %y, %z, %w)			
		sendParameters(%x, %y, %z)
		add $a3, $zero, %w		
	.end_macro
	
	.macro sendParameters(%x, %y, %z, %w, %f)		
		sendParameters(%x, %y, %z, %w)					
		add $t8, $zero, %f		
		pushInStack($t8)
	.end_macro
	
	.macro sendParameters(%x, %y, %z, %w, %f, %g)
		sendParameters(%x, %y, %z, %w, %f)					
		add $t9, $zero, %g		
		pushInStack($t9)
	.end_macro
	
	.macro return_EXIT_SUCCESS
		li $v0, 10
		syscall
	.end_macro
