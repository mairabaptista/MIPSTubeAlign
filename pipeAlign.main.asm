.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"
.include "pipeAlign.displayService.asm"
.include "pipeAlign.gameService.asm"

.data	
	# Data Segment
.text
	.globl main
			
	main:
		jal fillBackgroundColor		
				
		# arguments: line number, color
		sendParameters(10, BLACK_COLOR)
		jal drawEntireLine
		
		sendParameters(2)
		jal drawVerticalTube
		
		
		
		# arguments: initial line, final line, block number, color
		sendParameters(12,13,42,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(12,14,44,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(12,13,47,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(12,12,49,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(12,14,51,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(12,13,53,STRIPE_TUBE)
		jal drawVerticalLine
		
		
		# arguments: initial line, final line, block number, color
		sendParameters(31,31,41,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(29,31,43,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(30,31,45,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(31,31,48,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(29,31,50,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(30,31,52,STRIPE_TUBE)
		jal drawVerticalLine
		
		# arguments: initial line, final line, block number, color
		sendParameters(31,31,54,STRIPE_TUBE)
		jal drawVerticalLine
			
			
			
			
			
			
			
			
			
			
			
		sendParameters(RED_COLOR)
		jal createCursor
					
		jal setMaxCursorTop
		jal setMaxCursorLeft
		
		readInput:
			lw $t1, BASE_INPUT_ADDRESS
			
			beq $t1, LETTER_W, onWPress 
			beq $t1, LETTER_X, onXPress 
			beq $t1, LETTER_A, onAPress 
			beq $t1, LETTER_D, onDPress 
			beq $t1, LETTER_S, onSPress 					
						
			j notKeyPressValid
			
			onWPress:
				jal moveCursorUp
			j beforeKeyPress
			
			onXPress:
				jal moveCursorDown
			j beforeKeyPress
			
			onAPress:
				jal moveCursorLeft
			j beforeKeyPress
			
			onDPress:
				jal moveCursorRight
			j beforeKeyPress
			
			onSPress:
				jal toggleTube
			j beforeKeyPress
			
			beforeKeyPress:		
				sw $zero, BASE_INPUT_ADDRESS
							
			notKeyPressValid:
			
		j readInput   
									
	return_EXIT_SUCCESS
