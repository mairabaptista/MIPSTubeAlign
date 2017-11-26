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
		
		getBitmapCache(FIRST_PHASE_CACHE)
						
		move $s7, $v0	
		
		playSound(IN_GAME_SOUND, -3, LOOP_SOUND)																												
		
		sendParameters(BACKGROUND_COLOR)
		jal fillBackgroundColor
		sendParameters(NOT_CLEAR_SLOTS)
		jal createFirstPhase
		
		beq $s7, -1, updateBitmapAndCache
		
		j before_refresh_cache
		
		updateBitmapAndCache:
			refreshBitmap()
			setBitmapCache(FIRST_PHASE_CACHE)
		
		before_refresh_cache:	
						
		#sendParameters(40, 65)		
		#jal drawLetters
		
		#sendParameters(41, 32)		
		#jal drawLetters		
		
		#sendParameters(42, 69)		
		#jal drawLetters
		
		jal readInput
						
		#finishGame:	

	return_EXIT_SUCCESS
