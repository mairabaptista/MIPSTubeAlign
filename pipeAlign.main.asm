.include "pipeAlign.constants.asm"
.include "pipeAlign.drawingService.asm"
.include "pipeAlign.displayService.asm"

.data	
	# Data Segment	
.text
	.globl main
			
	main:		
		jal fillBackgroundColor		
				
		# draw margin
		sendParameters(12, 6, 126, 249, BLUE_COLOR, NOT_FILLED)		# start in (12,6) and finish in (126,249)		
		jal drawRectangle
		#
		
		# horizontal		
		sendParameters(12, 6, 31, 33, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
		
		sendParameters(12, 33, 31, 60, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle		
		
		sendParameters(12, 60, 31, 87, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
				
		sendParameters(12, 87, 31, 114, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
				
		sendParameters(12, 114, 31, 141, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
		
		sendParameters(12, 141, 31, 168, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
				
		sendParameters(12, 168, 31, 195, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
				
		sendParameters(12, 195, 31, 222, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
		
		sendParameters(12, 222, 31, 249, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle	
		
		#vertical
		sendParameters(31, 6, 50, 33, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
				
		sendParameters(50, 6, 69, 33, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
		
		sendParameters(69, 6, 88, 33, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle		
		
		sendParameters(88, 6, 107, 33, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
				
		sendParameters(107, 6, 126, 33, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
									
	return_EXIT_SUCCESS
