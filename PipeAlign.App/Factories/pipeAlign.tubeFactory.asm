.data


.text
	drawInitalTube:
		pushInStack($ra)
        	sendParameters(1)
	    	jal getBlockFromSlot
        	popFromStack($ra)
        
	    	move $t0, $v0
        	move $t1, $v1
        
        	#Draw horizontal initial tube
			add $t2, $t0, 0
	    	add $t3, $t0, 20
	        
        	add $t4, $t1, -6
        	add $t5, $t1, 13

       		pushInStack($ra, $t0, $t1)
        	sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
        	jal drawRectangle
       		popFromStack($ra, $t0, $t1)
       		
       		#Draw vertical initial tube		
		add $t2, $t0, 0
        	add $t3, $t0, 27
        	       
        	add $t4, $t1, 14
        	add $t5, $t1, 40
        
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t2, $t4, $t3, $t5, TUBE_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)
        	
        	#Draw connector
		add $t5, $t0, 28
		add $t3, $t0, 37

		add $t2, $t1, 11
		add $t4, $t1, 43
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t5, $t2, $t3, $t4, CONNECT_INITIAL_TUBE, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)
		
     		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawBottomPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)        	
        	
	jr $ra
	

	#arguments: SlotNumber
	drawVerticalTube:			
		pushInStack($ra)
		jal getBlockFromSlot
		popFromStack($ra)
		
		move $t0, $v0
		move $t1, $v1

		#Draw middle tuble
		add $t2, $t0, 7
		add $t3, $t0, 31
								
		add $t4, $t1, 20
		add $t5, $t1, 34
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, TUBE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)
	
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawTopPipeConnector
		popFromStack($ra, $t0, $t1)
	
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawBottomPipeConnector
		popFromStack($ra, $t0, $t1)
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawTopPipeConnectorStripes
		popFromStack($ra, $t0, $t1)
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawBottomPipeConnectorStripes
		popFromStack($ra, $t0, $t1)
						
	jr $ra
	
	#arguments: SlotNumber
	drawHorizontalTube:
			
		pushInStack($ra)
		jal getBlockFromSlot
		popFromStack($ra)
		
		move $t0, $v0
		move $t1, $v1
		
		#Draw the middle tube
		add $t2, $t0, 12
		add $t3, $t0, 26

		add $t4, $t1, 7	
		add $t5, $t1, 47

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawLeftPipeConnector
		popFromStack($ra, $t0, $t1)
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawRightPipeConnector
		popFromStack($ra, $t0, $t1)
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawRightPipeConnectorStripes
		popFromStack($ra, $t0, $t1)
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawLeftPipeConnectorStripes
		popFromStack($ra, $t0, $t1)
																																																																																																																																																	
	jr $ra
	
	# arguments: SlotNumber
	drawFirstTubeElbow:
			        
        	pushInStack($ra)
	    	jal getBlockFromSlot
        	popFromStack($ra)
        
	   	move $t0, $v0
       		move $t1, $v1
        
		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalLeftElbow
       		popFromStack($ra, $t0, $t1)
                
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
		jal drawVerticalTopElbow
        	popFromStack($ra, $t0, $t1)
        	       		
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawTopPipeConnector
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawLeftPipeConnector
        	popFromStack($ra, $t0, $t1)
        	
     		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawTopPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)
        	
       	 	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawLeftPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)	
        	        
	jr $ra
	
	# arguments: SlotNumber
	drawSecondTubeElbow:
	
		pushInStack($ra)
	    	jal getBlockFromSlot
        	popFromStack($ra)
        
	    	move $t0, $v0
        	move $t1, $v1
        
		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalRigthElbow
        	popFromStack($ra, $t0, $t1)
        	
	    	pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t1)
		jal drawVerticalTopElbow
        	popFromStack($ra, $t0, $t1)
        	        	
       		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawTopPipeConnector
        	popFromStack($ra, $t0, $t1)
        	
    		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawRightPipeConnector
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawTopPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawRightPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)
        		
	jr $ra
	
	# arguments: SlotNumber
	drawThirdTubeElbow:
		
		pushInStack($ra)
	    	jal getBlockFromSlot
       		popFromStack($ra)
        
	    	move $t0, $v0
        	move $t1, $v1
        
		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalLeftElbow
       		popFromStack($ra, $t0, $t1)
       		
		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawVerticalBottomElbow
        	popFromStack($ra, $t0, $t1)
        
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawBottomPipeConnector
        	popFromStack($ra, $t0, $t1)
        
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawLeftPipeConnector
        	popFromStack($ra, $t0, $t1)
        
     		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
       		jal drawBottomPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawLeftPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)
		
	jr $ra
	
	# arguments: SlotNumber
	drawFourthTubeElbow:
	
		pushInStack($ra)
	    	jal getBlockFromSlot
        	popFromStack($ra)
        
	    	move $t0, $v0
        	move $t1, $v1
        		
		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalRigthElbow
        	popFromStack($ra, $t0, $t1)
       	    		
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawVerticalBottomElbow
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawBottomPipeConnector
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawRightPipeConnector
        	popFromStack($ra, $t0, $t1)
        	
     		pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawBottomPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawRightPipeConnectorStripes
        	popFromStack($ra, $t0, $t1)
		
	jr $ra

	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawTopPipeConnector:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t1, 14
		add $t4, $t2, 26
				
		add $t3, $t0, 6
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, $t4, CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)
		
	jr $ra

	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawBottomPipeConnector:
		move $t0, $a0
		move $t1, $a1
		
		add $t5, $t0, 32
		add $t3, $t5, 6

		add $t2, $t1, 14
		add $t4, $t2, 26
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t5, $t2, $t3, $t4, CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

	jr $ra
		
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawLeftPipeConnector:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t0, 7
		add $t3, $t0, 31
		add $t4, $t1, 6
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t1 ,$t3 ,$t4 ,CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

	jr $ra

	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawRightPipeConnector:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t0, 7
		add $t3, $t0, 31
		
		add $t4, $t1, 48
		add $t5, $t1, 54
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t4 ,$t3 ,$t5 ,CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawTopPipeConnectorStripes:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t0, 4
		add $t3, $t1, 16
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
	
		add $t2, $t0, 4
		add $t3, $t1, 20
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 2
		add $t3, $t1, 26
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t3, $t1, 30
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t0, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 4
		add $t3, $t1, 34
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 2
		add $t3, $t1, 38
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)

	jr $ra

	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawBottomPipeConnectorStripes:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t0, 38
		add $t3, $t0, 38
		add $t4, $t1, 14
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 38
		add $t3, $t0, 34
		add $t4, $t1, 18
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 38
		add $t3, $t0, 36
		add $t4, $t1, 22
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
				
		add $t2, $t0, 38
		add $t3, $t0, 38
		add $t4, $t1, 28
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 38
		add $t3, $t0, 34
		add $t4, $t1, 32
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)

		add $t2, $t0, 38
		add $t3, $t0, 36
		add $t4, $t1, 36
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)

	jr $ra

	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawLeftPipeConnectorStripes:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t0, 10
		add $t3, $t1, 0
		add $t4, $t1, 4

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 16
		add $t3, $t1, 0
		add $t4, $t1, 0	

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 22
		add $t3, $t1, 0
		add $t4, $t1, 2

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 26
		add $t3, $t1, 0
		add $t4, $t1, 4

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 30
		add $t3, $t1, 0
		add $t4, $t1, 0

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)

	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawRightPipeConnectorStripes:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t0, 28
		add $t3, $t1, 52 
		add $t4, $t1, 54		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 24
		add $t3, $t1, 50
		add $t4, $t1, 54		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		
		add $t2, $t0, 20
		add $t3, $t1, 52
		add $t4, $t1, 54		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 12
		add $t3, $t1, 50
		add $t4, $t1, 54		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 8
		add $t3, $t1, 52
		add $t4, $t1, 54		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawVerticalTopElbow:
		move $t0, $a0
		move $t1, $a1
		
		add $t2, $t0, 7
		add $t3, $t0, 26
		    
        	add $t4, $t1, 20
        	add $t5, $t1, 34
        
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t2, $t4, $t3, $t5, TUBE_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)

	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawVerticalBottomElbow:
		move $t0, $a0
		move $t1, $a1
		
		add $t2, $t0, 12
        	add $t3, $t0, 31
        	       
        	add $t4, $t1, 20
        	add $t5, $t1, 34
        
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t2, $t4, $t3, $t5, TUBE_COLOR, FILLED)
        	jal drawRectangle
        	popFromStack($ra, $t0, $t1)

	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawHorizontalRigthElbow:
		
		move $t0, $a0
		move $t1, $a1
		
		add $t2, $t0, 12
	   	add $t3, $t0, 26
	        
        	add $t4, $t1, 35
        	add $t5, $t1, 47

       		pushInStack($ra, $t0, $t1)
        	sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
        	jal drawRectangle
       		popFromStack($ra, $t0, $t1)

	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawHorizontalLeftElbow:
		move $t0, $a0
		move $t1, $a1
		
		add $t2, $t0, 12
	    	add $t3, $t0, 26
	        
        	add $t4, $t1, 7
        	add $t5, $t1, 19

       		pushInStack($ra, $t0, $t1)
        	sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
        	jal drawRectangle
       		popFromStack($ra, $t0, $t1)	
	
	jr $ra
