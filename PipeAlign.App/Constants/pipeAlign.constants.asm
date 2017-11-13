.data

# Screen Game
	.eqv HORIZONTAL_SLOTS		9	
	.eqv VERTICAL_SLOTS			6

	.eqv SLOT_HEIGHT			38	
	.eqv SLOT_WIDTH				54	
	.eqv CURSOR_SIZE			4
		
	.eqv MARGIN_TOP				22
	.eqv MARGIN_LEFT			6
	.eqv MARGIN_RIGHT			14
	.eqv MARGIN_BOTTOM			4

# Input Data
	.eqv BASE_INPUT_ADDRESS		0xffff0004
	.eqv LETTER_W				119
	.eqv LETTER_X				120
	.eqv LETTER_A				97
	.eqv LETTER_D				100
	.eqv LETTER_S				115

# TubeTypes
	.eqv EMPTY _TUBE			0
	.eqv HORIZONTAL_TUBE 		1
	.eqv VERTICAL_TUBE 			2
	.eqv FIRST_TUBE_ELBOW		3
	.eqv SECOND_TUBE_ELBOW		4
	.eqv THIRD_TUBE_ELBOW		5
	.eqv FOURTH_TUBE_ELBOW		6

# Tube Colors	
	.eqv TUBE_COLOR				0xb5bec6
	.eqv CONNECT_TUBE			0x84a5ac
	.eqv STRIPE_TUBE			0x5a6e71
	.eqv CONNECT_INITIAL_TUBE	0x84a5ac
	
#Memory game service

	cursorTop:		.word 			22			#TODO: Create description
	cursorLeft: 	.word 			60			#TODO: Create description
		
	maxCursorTop: 	.word 			0			#TODO: Create description
	maxCursorLeft: 	.word 			0			#TODO: Create description
	
	slotMapping:	.space			54 			#It is the memory space where the slots are mapped so that we know what kind of pipe is in each slot
