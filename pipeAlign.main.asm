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
				
		# arguments: line number, color
		sendParameters(10, BLUE_COLOR)
		jal drawEntireLine
				
		# draw margin
		#sendParameters(12, 7, 126, 250, BLUE_COLOR, NOT_FILLED)		# start in (12,6) and finish in (126,249)		
		#jal drawRectangle
		#
		
		# horizontal		
		#sendParameters(12, 7, 31, 34, BLUE_COLOR, NOT_FILLED)		
		#jal drawRectangle
		
		sendParameters(12, 7, 10, RED_COLOR)											# arguments: line number, initial block, final block, color
		jal drawHorizontalLine
		
		sendParameters(12, 31, 34, RED_COLOR)											# arguments: line number, initial block, final block, color
		jal drawHorizontalLine
		
		sendParameters(31, 7, 10, RED_COLOR)											# arguments: line number, initial block, final block, color
		jal drawHorizontalLine
		
		sendParameters(31, 31, 34, RED_COLOR)											# arguments: line number, initial block, final block, color
		jal drawHorizontalLine
		
		
		
		# arguments: initial line, final line, block number, color
		sendParameters(12, 15, 7, RED_COLOR)											
		jal drawVerticalLine
		
		sendParameters(12, 15, 34, RED_COLOR)										
		jal drawVerticalLine
		
		sendParameters(28, 31, 7, RED_COLOR)											
		jal drawVerticalLine
		
		sendParameters(28, 31, 34, RED_COLOR)											
		jal drawVerticalLine
		#
				
		
		#sendParameters(12, 34, 31, 61, BLUE_COLOR, NOT_FILLED)		
		#jal drawRectangle		
		
		sendParameters(12, 61, 31, 88, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
				
		sendParameters(12, 88, 31, 115, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
				
		sendParameters(12, 115, 31, 142, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
		
		sendParameters(12, 142, 31, 169, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
				
		sendParameters(12, 169, 31, 196, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
				
		sendParameters(12, 196, 31, 223, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle
		
		sendParameters(12, 223, 31, 250, BLUE_COLOR, NOT_FILLED)	
		jal drawRectangle	
		
		#vertical
		#sendParameters(31, 7, 50, 34, BLUE_COLOR, NOT_FILLED)		
		#jal drawRectangle
				
		sendParameters(50, 7, 69, 34, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
		
		sendParameters(69, 7, 88, 34, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle		
		
		sendParameters(88, 7, 107, 34, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
				
		sendParameters(107, 7, 126, 34, BLUE_COLOR, NOT_FILLED)		
		jal drawRectangle
									
	return_EXIT_SUCCESS
