.data
	# Display 
	.eqv SCREEN_WIDTH 			1024
	.eqv SCREEN_HEIGHT			512
	.eqv UNIT_WIDTH				4
	.eqv UNIT_HEIGHT			4
	.eqv BASE_ADDRESS 			0x10040000
	
	# Input Data
	.eqv BASE_INPUT_ADDRESS		0xffff0004
	.eqv LETTER_W				119
	.eqv LETTER_X				120
	.eqv LETTER_A				97
	.eqv LETTER_D				100
	.eqv LETTER_S				115
			
	# Screen Game
	.eqv HORIZONTAL_SLOTS			9	
	.eqv VERTICAL_SLOTS			6
	
	.eqv SLOT_HEIGHT			19	
	.eqv SLOT_WIDTH				27	
	.eqv CURSOR_SIZE			3
		
	.eqv MARGIN_TOP				11
	.eqv MARGIN_LEFT			6
	.eqv MARGIN_RIGHT			7
	.eqv MARGIN_BOTTOM			2
		
	# Colors	
	#.eqv BACKGROUND_COLOR			0x00ff00
	.eqv BACKGROUND_COLOR			0x000000
	.eqv RED_COLOR		 		0xff0000
	.eqv GREEN_COLOR 			0x00ff00
	.eqv BLUE_COLOR				0x0000ff
	.eqv BLACK_COLOR			0x000000
	.eqv WHITE_COLOR			0xffffff
	.eqv TUBE_COLOR				0xb5bec6
	.eqv CONNECT_TUBE			0x84a5ac
	.eqv STRIPE_TUBE			0x5a6e71
	
	# Orientation
	.eqv HORIZONTAL				0
	.eqv VERTICAL				1
	.eqv MAIN_DIAGONAL			2
	.eqv SECONDARY_DIAGONAL			3
	
	# Rectangule
	.eqv FILLED				1
	.eqv NOT_FILLED				0
		
.text
	# Macros
	.macro pushInStack(%x)
		sub $sp, $sp, 4								# adjust to push in stack
		sw  %x, 0($sp)								# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y)
		sub $sp, $sp, 8								# adjust to push in stack
		sw  %x, 4($sp)								# push register in stack
		sw  %y, 0($sp)								# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y, %z)
		sub $sp, $sp, 12							# adjust to push in stack
		sw  %x, 8($sp)								# push register in stack
		sw  %y, 4($sp)								# push register in stack
		sw  %z, 0($sp)								# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y, %z, %w)
		sub $sp, $sp, 16							# adjust to push in stack
		sw  %x, 12($sp)								# push register in stack
		sw  %y, 8($sp)								# push register in stack
		sw  %z, 4($sp)								# push register in stack
		sw  %w, 0($sp)								# push register in stack
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
	
	.macro popFromStack(%x, %y, %z)
		lw  %z, 0($sp)								# restore register from stack
		lw  %y, 4($sp)								# restore register from stack
		lw  %x, 8($sp)								# restore register from stack
		add $sp, $sp, 12							# adjust $sp
	.end_macro
	
	.macro popFromStack(%x, %y, %z, %w)
		lw  %w, 0($sp)								# restore register from stack
		lw  %z, 4($sp)								# restore register from stack
		lw  %y, 8($sp)								# restore register from stack
		lw  %x, 12($sp)								# restore register from stack
		add $sp, $sp, 16							# adjust $sp
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
