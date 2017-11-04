.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"
.include "pipeAlign.displayService.asm"

.data	
	# Data Segment	
.text
	.globl main
			
	main:		
		jal fillBackgroundColor
					
		sendParameters(3, 3, 62, 126, BLUE_COLOR, NOT_FILLED)		# start in (2,2) and finish in (63, 127)
		
		jal drawRectangle
					
	return_EXIT_SUCCESS
