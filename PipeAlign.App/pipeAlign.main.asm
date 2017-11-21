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
.include "Factories/pipeAlign.gamePhasesFactory.asm"
.include "Factories/pipeAlign.waterFactory.asm"
#.include "Factories/pipeAlign.menuFactory.asm"

.include "Service/pipeAlign.displayService.asm"
.include "Service/pipeAlign.drawingService.asm"
.include "Service/pipeAlign.gameService.asm"


.data	
	# Data Segment
.text
	.globl main
			
	main:

		#jal createMenu
		#startGame:

		jal createFirstPhase
		
		sendParameters(42, 10)		
		jal drawLetters	
		
		jal readInput
						
		#finishGame:	

	return_EXIT_SUCCESS
