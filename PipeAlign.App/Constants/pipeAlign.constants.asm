.data

# Screen Game
	.eqv HORIZONTAL_SLOTS		9	
	.eqv VERTICAL_SLOTS			6

	.eqv SLOT_HEIGHT			38	
	.eqv SLOT_WIDTH				54	
	.eqv CURSOR_SIZE			4
	.eqv CURSOR_TOP_DEFAULT		22
	.eqv CURSOR_LEFT_DEFAULT	60	
		
	.eqv MARGIN_TOP			22
	.eqv MARGIN_LEFT		6
	.eqv MARGIN_RIGHT		14
	.eqv MARGIN_BOTTOM		4

# Top Screen
	.eqv HORIZONTAL_TOP_SCREEN_SLOTS		42
	.eqv TOP_SCREEN_SLOT_HEIGHT				18
	.eqv TOP_SCREEN_SLOT_WIDTH				12
	.eqv TOP_SCREEN_COLOR 					0xc4ccdf
	.eqv BORDER_TOP_COLOR 					0x68798e	

# Input Data
	.eqv BASE_INPUT_ADDRESS			0xffff0004
	.eqv LETTER_W					119
	.eqv LETTER_X					120
	.eqv LETTER_A					97
	.eqv LETTER_D					100
	.eqv LETTER_S					115
	.eqv LETTER_K					107
	.eqv LETTER_L					108
	.eqv SPACE_KEY					32
	.eqv ESC_KEY					27

# TubeTypes
	.eqv EMPTY_TUBE				0
	.eqv HORIZONTAL_TUBE 		1
	.eqv VERTICAL_TUBE 			2
	.eqv FIRST_TUBE_ELBOW		3
	.eqv SECOND_TUBE_ELBOW		4
	.eqv THIRD_TUBE_ELBOW		5
	.eqv FOURTH_TUBE_ELBOW		6
	
# Tube Orientation
	.eqv UP						0
	.eqv DOWN					1
	.eqv LEFT					2
	.eqv RIGHT					3

# Tube Colors	
	.eqv TUBE_COLOR				0xb5bec6
	.eqv TUBE_INITIAL_COLOR		0xb5bec6
	.eqv CONNECT_TUBE			0x84a5ac
	.eqv STRIPE_TUBE			0x4f6063
	.eqv CONNECT_INITIAL_TUBE	0x777f91
	.eqv BORDER_COLOR			0x000000

#Water constants

	.eqv WATER_COLOR			0x0d9bf6
	.eqv WATER_TIME_OUT			10
	
# Game Constants

	.eqv MAX_PHASES					2
	.eqv TRANSITION_PHASE_DELAY		500
	
	.eqv NOT_CLEAR_SLOTS			0
	.eqv CLEAR_SLOTS				1	
	
#Memory game service

	cursorTop:		.word 			22			#TODO: Create description
	cursorLeft: 	.word 			60			#TODO: Create description
			
	maxCursorTop: 	.word 			0			#TODO: Create description
	maxCursorLeft: 	.word 			0			#TODO: Create description
	
	slotMapping:	.space			54 			#It is the memory space where the slots are mapped so that we know what kind of pipe is in each slot
	slotPathWin:	.space			162			# 54 * 3 bits
	
	currentPhase:	.word			1
