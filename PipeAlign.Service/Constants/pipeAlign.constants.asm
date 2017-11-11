.data
	# Display 
	.eqv SCREEN_WIDTH 			1024
	.eqv SCREEN_HEIGHT			512
	.eqv UNIT_WIDTH				2
	.eqv UNIT_HEIGHT			2
	.eqv BASE_ADDRESS 			0x10040000
	
	# Input Data
	.eqv BASE_INPUT_ADDRESS			0xffff0004
	.eqv LETTER_W				119
	.eqv LETTER_X				120
	.eqv LETTER_A				97
	.eqv LETTER_D				100
	.eqv LETTER_S				115
			
	# Screen Game
	.eqv HORIZONTAL_SLOTS			9	
	.eqv VERTICAL_SLOTS			6
	
	.eqv SLOT_HEIGHT			38	
	.eqv SLOT_WIDTH				54	
	.eqv CURSOR_SIZE			4
		
	.eqv MARGIN_TOP				22
	.eqv MARGIN_LEFT			6
	.eqv MARGIN_RIGHT			14
	.eqv MARGIN_BOTTOM			4
		
	# Colors	
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