.include "../PipeAlign.Service/Constants/pipeAlign.constants.asm"
.include "../PipeAlign.Common/Macros/pipeAlign.macros.asm"
.include "../PipeAlign.Service/pipeAlign.drawingService.asm"
.include "../PipeAlign.Service/pipeAlign.displayService.asm"
.include "../PipeAlign.Service/pipeAlign.gameService.asm"
.include "Factories/pipeAlign.tubeFactory.asm"

.data	
	# Data Segment
.text
	.globl main
			
	main:
		#jal initializeSlotMapping				
			
		jal fillBackgroundColor		
			
		sendParameters(RED_COLOR)
		jal createCursor
					
		jal setMaxCursorTop
		jal setMaxCursorLeft
		
		sendParameters(20, BLACK_COLOR)
		jal drawEntireLine
		
		sendParameters(4, VERTICAL_TUBE)
		jal setTubeType		
		sendParameters(4)
		jal drawVerticalTube

		sendParameters(2, HORIZONTAL_TUBE)
		jal setTubeType		
		sendParameters(2)
		jal drawHorizontalTube
		
		sendParameters(3, FIRST_TUBE_ELBOW)
		jal setTubeType	
		sendParameters(3)
		jal drawFirstTubeElbow
		
		sendParameters(10, SECOND_TUBE_ELBOW)
		jal setTubeType	
		sendParameters(10)
		jal drawSecondTubeElbow
		
		sendParameters(11, THIRD_TUBE_ELBOW)
		jal setTubeType	
		sendParameters(11)
		jal drawThirdTubeElbow
		
		sendParameters(12, FOURTH_TUBE_ELBOW)
		jal setTubeType	
		sendParameters(12)
		jal drawFourthTubeElbow
		
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
