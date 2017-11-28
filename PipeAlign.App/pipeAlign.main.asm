# Import macros lib
.include "../MipsMacroLibrary/Macros/mipsMacroLibrary.functionMacros.asm"
.include "../MipsMacroLibrary/Macros/mipsMacroLibrary.memoryMacros.asm"

.include "../MipsMacroLibrary/Constants/mipsMacroLibrary.bitmapConstants.asm"
.include "../MipsMacroLibrary/Macros/mipsMacroLibrary.bitmapMacros.asm"

.include "../MipsMacroLibrary/Constants/mipsMacroLibrary.soundConstants.asm"
.include "../MipsMacroLibrary/Macros/mipsMacroLibrary.soundMacros.asm"

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
.include "Factories/pipeAlign.numberFactory.asm"
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
		
		#getBitmapCache(FIRST_PHASE_CACHE)
						
		#move $s7, $v0	
		
		#playSound(IN_GAME_SOUND, -3, LOOP_SOUND)																												
		
		sendParameters(BACKGROUND_COLOR)
		jal fillBackgroundColor
		sendParameters(NOT_CLEAR_SLOTS)
		jal createFirstPhase

	
		sendParameters(1, 0)
		jal drawNumbers
		
		sendParameters(2, 1)
		jal drawNumbers
		
		sendParameters(3, 2)
		jal drawNumbers
		
		sendParameters(4, 3)
		jal drawNumbers
		
		sendParameters(5, 4)
		jal drawNumbers
		
		sendParameters(6, 5)
		jal drawNumbers
		
		sendParameters(7, 6)
		jal drawNumbers
		
		sendParameters(8, 7)
		jal drawNumbers
		
		sendParameters(9, 8)
		jal drawNumbers
		
		sendParameters(10, 9)
		jal drawNumbers
		

		#beq $s7, -1, updateBitmapAndCache
		
		#j before_refresh_cache
		
		#updateBitmapAndCache:
		#	refreshBitmap()
		#	setBitmapCache(FIRST_PHASE_CACHE)
		
		#before_refresh_cache:	
						
		sendParameters(28, 65)		
		jal drawLetters
		
		sendParameters(29, 66)		
		jal drawLetters	
		
		sendParameters(30, 67)		
		jal drawLetters	
		
		sendParameters(31, 69)		
		jal drawLetters
		
		sendParameters(32, 71)		
		jal drawLetters
		
		sendParameters(33, 73)		
		jal drawLetters
		
		sendParameters(34, 76)		
		jal drawLetters
		
		sendParameters(35, 77)		
		jal drawLetters
		
		sendParameters(36, 78)		
		jal drawLetters
		
		sendParameters(37, 79)		
		jal drawLetters
		
		sendParameters(38, 80)		
		jal drawLetters		
		
		sendParameters(39, 82)		
		jal drawLetters		
		
		sendParameters(40, 83)		
		jal drawLetters		
		
		sendParameters(41, 84)		
		jal drawLetters
		
		jal readInput
						
		#finishGame:	

	return_EXIT_SUCCESS
