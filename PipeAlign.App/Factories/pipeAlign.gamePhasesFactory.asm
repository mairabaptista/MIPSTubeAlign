.data	
	#Data Segment
.text
	#arguments
	createBasePhase:	
		pushInStack($ra)
		jal fillBackgroundColor	
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(RED_COLOR)
		jal createCursor	
		popFromStack($ra)	
		
		pushInStack($ra)
		jal setMaxCursorTop	
		popFromStack($ra)
		
		pushInStack($ra)
		jal setMaxCursorLeft	
		popFromStack($ra)
							
		pushInStack($ra)
		jal drawInitalTube
		popFromStack($ra)
					
		pushInStack($ra)
		sendParameters(18, BORDER_TOP_COLOR)
		jal drawEntireLine
		popFromStack($ra)		
			
		pushInStack($ra)
		sendParameters(1, 1, 17, 512, TOP_SCREEN_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(1, 1, 256, 512, BLACK_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra)		
	jr $ra
	
	#arguments
	createFirstPhase:
		pushInStack($ra)
		jal createBasePhase
		popFromStack($ra)
		
		pushInStack($ra)
		sendParameters(2)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(3)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(4)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(10)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(11)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(12)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(13)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(14)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(19)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(20)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(21)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(22)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(23)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(25)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(28)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(29)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(31)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(32)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(34)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(35)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(38)
		jal drawHorizontalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(40)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(41)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(42)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(43)
		jal drawThirdTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(44)
		jal drawFourthTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(48)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(49)
		jal drawSecondTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(50)
		jal drawVerticalTube
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(51)
		jal drawFirstTubeElbow
		popFromStack($ra)

		pushInStack($ra)
		sendParameters(52)
		jal drawSecondTubeElbow
		popFromStack($ra)	
	jr $ra
