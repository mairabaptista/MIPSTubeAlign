.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"
.include "pipeAlign.displayService.asm"

.data	
	# Data Segment	
.text
	.globl main
			
	main:		
		jal fillBackgroundColor
					
		sendParameters(8, greenColor)		# send line number, color
		
		jal drawEntireLine
					
	return_EXIT_SUCCESS