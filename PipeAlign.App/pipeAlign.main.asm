# Import macros lib
.include "../MipsMacroLibrary/Macros/mipsMacroLibrary.functionMacros.asm"
.include "../MipsMacroLibrary/Macros/mipsMacroLibrary.memoryMacros.asm"


# Import display lib
.include "../MipsDisplayLibrary/Constants/mipsDisplayLibrary.constants.asm"
.include "../MipsDisplayLibrary/mipsDisplayLibrary.displayService.asm"
.include "../MipsDisplayLibrary/mipsDisplayLibrary.drawingService.asm"


# Import files of application

.include "Constants/pipeAlign.constants.asm"

.include "Factories/pipeAlign.tubeFactory.asm"

.include "Service/pipeAlign.displayService.asm"
.include "Service/pipeAlign.drawingService.asm"
.include "Service/pipeAlign.gameService.asm"


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
		
		sendParameters(53, FOURTH_TUBE_ELBOW)
		jal setTubeType	
		sendParameters(53)
		jal drawFourthTubeElbow


		#TODO: Criar uma função para esse trecho de código
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
