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
															
	return_EXIT_SUCCESS
