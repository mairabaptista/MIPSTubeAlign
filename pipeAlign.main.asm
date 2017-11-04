.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"
.include "pipeAlign.displayService.asm"

.data	
	# Data Segment	
.text
	.globl main
			
	main:		
		jal fillBackgroundColor		
					
		sendParameters(3, 3, 62, 126, BLUE_COLOR, NOT_FILLED)		# start in (2,2) and finish in (63,127)		
		jal drawRectangle
		
		# draw L
		sendParameters(6, 10, 20, BLUE_COLOR)						# initial line, final line, block number, color		
		jal drawVerticalLine		
		
		sendParameters(10, 21, 22, BLUE_COLOR)						# line number, initial block, final block, color		
		jal drawHorizontalLine										
		
		# draw E
		sendParameters(6, 10, 24, BLUE_COLOR)						# initial line, final line, block number, color		
		jal drawVerticalLine		
		
		sendParameters(6, 25, 27, BLUE_COLOR)						# line number, initial block, final block, color		
		jal drawHorizontalLine		
		
		sendParameters(8, 25, 27, BLUE_COLOR)						# line number, initial block, final block, color		
		jal drawHorizontalLine										
		
		sendParameters(10, 25, 27, BLUE_COLOR)						# line number, initial block, final block, color		
		jal drawHorizontalLine
		
		# draw O
		sendParameters(6, 29, 10, 32, BLUE_COLOR, NOT_FILLED)		# start in (6,29) and finish in (10,32)		
		jal drawRectangle
								
	return_EXIT_SUCCESS
