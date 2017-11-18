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
.include "Factories/pipeAlign.cursorFactory.asm"
.include "Factories/pipeAlign.letterFactory.asm"

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
						
		jal drawInitalTube
		
		sendParameters(4, HORIZONTAL_TUBE)
		jal setTubeType		
		sendParameters(4)
		jal drawHorizontalTube

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
		
		
		sendParameters(18, BORDER_TOP_COLOR)
		jal drawEntireLine
			
		sendParameters(1, 1, 17, 512, TOP_SCREEN_COLOR, FILLED)
		jal drawRectangle
		
		sendParameters(1, 1, 256, 512, BLACK_COLOR, NOT_FILLED)
		jal drawRectangle
		

		jal readInput
									
	return_EXIT_SUCCESS
