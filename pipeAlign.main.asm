.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"
.include "pipeAlign.displayService.asm"
.include "pipeAlign.tubeFactory.asm"
.include "pipeAlign.gameService.asm"

.data	
	# Data Segment
.text
	.globl main
			
	main:
		jal fillBackgroundColor		
				
		# arguments: line number, color
		sendParameters(20, BLACK_COLOR)
		jal drawEntireLine
		
		sendParameters(1)
		jal drawVerticalTube
		
		sendParameters(2)
		jal drawHorizontalTube
		
		sendParameters(3)
		jal drawFirstTubeElbow
		
		sendParameters(10)
		jal drawSecondTubeElbow
		
		sendParameters(11)
		jal drawThirdTubeElbow
		
		
		sendParameters(12)
		jal drawFourthTubeElbow
			
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
