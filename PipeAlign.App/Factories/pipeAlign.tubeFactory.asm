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
       	pushInStack($t2, $t4, $t3, $t5)
        sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_INITIAL_COLOR, FILLED)
        jal drawRectangle
        popFromStack($t2, $t4, $t3, $t5)
       	popFromStack($ra, $t0, $t1)
       	
       	#Draw border
       	pushInStack($ra, $t0, $t1)       
        sendParameters($t2, $t4, $t3, $t5, BORDER_COLOR, NOT_FILLED)
        jal drawRectangle        
       	popFromStack($ra, $t0, $t1)
       		
       	#Draw vertical initial tube		
		add $t2, $t0, 0
        add $t3, $t0, 27
        	       
        add $t4, $t1, 14
        add $t5, $t1, 40
        
       	pushInStack($ra, $t0, $t1)
       	pushInStack($t2, $t4, $t3, $t5)
        sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_INITIAL_COLOR, FILLED)
        jal drawRectangle
        popFromStack($t2, $t4, $t3, $t5)
       	popFromStack($ra, $t0, $t1)
        
        # draw border
        addi $t3, $t3, 1
        pushInStack($ra, $t0, $t1)
        sendParameters($t2, $t4, $t3, $t5,  BORDER_COLOR, NOT_FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)
        
        # draw correction border
        add $t2, $t0, 1
        add $t3, $t0, 19
        	       
        add $t4, $t1, 13
        add $t5, $t1, 14
        
        pushInStack($ra, $t0, $t1)
        sendParameters($t2, $t4, $t3, $t5,  TUBE_INITIAL_COLOR, NOT_FILLED)
        jal drawRectangle
        popFromStack($ra, $t0, $t1)
        	
        #Draw connector
		add $t5, $t0, 28
		add $t3, $t0, 38

		add $t2, $t1, 11
		add $t4, $t1, 43
		
		pushInStack($ra, $t0, $t1)
		pushInStack($t5, $t2, $t3, $t4)
		sendParameters($t5, $t2, $t3, $t4, CONNECT_INITIAL_TUBE, FILLED)
		jal drawRectangle
		popFromStack($t5, $t2, $t3, $t4)
		popFromStack($ra, $t0, $t1)
		
		# draw border
		pushInStack($ra, $t0, $t1)
		sendParameters($t5, $t2, $t3, $t4, BORDER_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)	
				
     	pushInStack($ra, $t0, $t1)
        sendParameters($t0, $t1)
        jal drawBottomPipeConnectorStripes
        popFromStack($ra, $t0, $t1)
	jr $ra

	drawFinalTube:
		pushInStack($ra)
        sendParameters(45)
	    jal getBlockFromSlot
        popFromStack($ra)
        
	   	move $t0, $v0
       	move $t1, $v1

       	#Draw horizontal final tube
		add $t2, $t0, 7
	    add $t3, $t0, 31
	        
        add $t4, $t1, 10
        add $t5, $t1, 74

       	pushInStack($ra, $t0, $t1)
       	pushInStack($t2, $t4, $t3, $t5)
        sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
        jal drawRectangle
        popFromStack($t2, $t4, $t3, $t5)
       	popFromStack($ra, $t0, $t1)

       	#Draw border
       	pushInStack($ra, $t0, $t1)       
        sendParameters($t2, $t4, $t3, $t5, BORDER_COLOR, NOT_FILLED)
        jal drawRectangle        
       	popFromStack($ra, $t0, $t1)

       	#Draw connector
		add $t5, $t0, 3
		add $t3, $t0, 35

		add $t2, $t1, 0
		add $t4, $t1, 10
		
		pushInStack($ra, $t0, $t1)
		pushInStack($t5, $t2, $t3, $t4)
		sendParameters($t5, $t2, $t3, $t4, CONNECT_INITIAL_TUBE, FILLED)
		jal drawRectangle
		popFromStack($t5, $t2, $t3, $t4)
		popFromStack($ra, $t0, $t1)
		
		# draw border
		pushInStack($ra, $t0, $t1)
		sendParameters($t5, $t2, $t3, $t4, BORDER_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)	

		pushInStack($ra, $t0, $t1)
        sendParameters($t0, $t1)
        jal drawLeftPipeConnectorStripes
        popFromStack($ra, $t0, $t1)

	jr $ra
	
	#arguments: SlotNumber
	drawVerticalTube:
		pushInStack($ra, $a0)
		sendParameters($a0, VERTICAL_TUBE)
		jal setTubeType
		popFromStack($ra, $a0)
						
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
		pushInStack($t2, $t4, $t3, $t5)
		sendParameters($t2, $t4, $t3, $t5, TUBE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($t2, $t4, $t3, $t5)
		popFromStack($ra, $t0, $t1)
				
		#draw border
		subi $t2, $t2, 1
		addi $t3, $t3, 1		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t4, $t3, $t5, BORDER_COLOR, NOT_FILLED)
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
	
	#arguments: SlotNumber, hasCache (0 has cache, -1 not)
	createVerticalTube:
		bnez $a1, draw_vertical_tube_no_cache
		
		pushInStack($ra, $a0, $a1)
		sendParameters($a0, VERTICAL_TUBE)
		jal setTubeType
		popFromStack($ra, $a0, $a1)
		
		jr $ra
		
		draw_vertical_tube_no_cache:
			pushInStack($ra)
			jal drawVerticalTube
			popFromStack($ra)					
	jr $ra
	
	#arguments: SlotNumber
	drawHorizontalTube:		
		pushInStack($ra, $a0)
		sendParameters($a0, HORIZONTAL_TUBE)
		jal setTubeType
		popFromStack($ra, $a0)
							
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
		pushInStack($t2 ,$t4 ,$t3 ,$t5)
		sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
		jal drawRectangle
		popFromStack($t2 ,$t4 ,$t3 ,$t5)
		popFromStack($ra, $t0, $t1)
		
		#draw border
		subi $t4, $t4, 1
		addi $t5, $t5, 1
		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t4 ,$t3 ,$t5 , BORDER_COLOR, NOT_FILLED)
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
	
	#arguments: SlotNumber, hasCache (0 has cache, -1 not)
	createHorizontalTube:
		bnez $a1, draw_horizontal_tube_no_cache
		
		pushInStack($ra, $a0, $a1)
		sendParameters($a0, HORIZONTAL_TUBE)
		jal setTubeType
		popFromStack($ra, $a0, $a1)
		
		jr $ra
		
		draw_horizontal_tube_no_cache:
			pushInStack($ra)
			jal drawHorizontalTube
			popFromStack($ra)					
	jr $ra
	
	# arguments: SlotNumber
	drawFirstTubeElbow:			 
			pushInStack($ra, $a0)
			sendParameters($a0, FIRST_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $a0)        
			                      
        	pushInStack($ra)
	    	jal getBlockFromSlot
       	 	popFromStack($ra)
        
	   		move $t0, $v0
       		move $t1, $v1
        		
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
			jal drawVerticalTopElbow
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalLeftElbow
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
	
	#arguments: SlotNumber, hasCache (0 has cache, -1 not)
	createFirstTubeElbow:
		bnez $a1, draw_first_tube_elbow_no_cache
		
		pushInStack($ra, $a0, $a1)
		sendParameters($a0, FIRST_TUBE_ELBOW)
		jal setTubeType
		popFromStack($ra, $a0, $a1)
		
		jr $ra
		
		draw_first_tube_elbow_no_cache:
			pushInStack($ra)
			jal drawFirstTubeElbow
			popFromStack($ra)					
	jr $ra
	
	# arguments: SlotNumber
	drawSecondTubeElbow:		
			pushInStack($ra, $a0)
			sendParameters($a0, SECOND_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $a0)   
	
			pushInStack($ra)
	    	jal getBlockFromSlot
        	popFromStack($ra)
        
	    	move $t0, $v0
        	move $t1, $v1
        			        	
	    	pushInStack($ra, $t0, $t1)
			sendParameters($t0, $t1)
			jal drawVerticalTopElbow
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalRigthElbow
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
	
	#arguments: SlotNumber, hasCache (0 has cache, -1 not)
	createSecondTubeElbow:
		bnez $a1, draw_second_tube_elbow_no_cache
		
		pushInStack($ra, $a0, $a1)
		sendParameters($a0, SECOND_TUBE_ELBOW)
		jal setTubeType
		popFromStack($ra, $a0, $a1)
		
		jr $ra
		
		draw_second_tube_elbow_no_cache:
			pushInStack($ra)
			jal drawSecondTubeElbow
			popFromStack($ra)					
	jr $ra
	
	# arguments: SlotNumber
	drawThirdTubeElbow:	
			pushInStack($ra, $a0)
			sendParameters($a0, THIRD_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $a0) 
		
			pushInStack($ra)
	    	jal getBlockFromSlot
       		popFromStack($ra)
        
	    	move $t0, $v0
        	move $t1, $v1
        
			pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawVerticalBottomElbow
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalLeftElbow
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
	
	#arguments: SlotNumber, hasCache (0 has cache, -1 not)
	createThirdTubeElbow:
		bnez $a1, draw_third_tube_elbow_no_cache
		
		pushInStack($ra, $a0, $a1)
		sendParameters($a0, THIRD_TUBE_ELBOW)
		jal setTubeType
		popFromStack($ra, $a0, $a1)
		
		jr $ra
		
		draw_third_tube_elbow_no_cache:
			pushInStack($ra)
			jal drawThirdTubeElbow
			popFromStack($ra)					
	jr $ra
	
	# arguments: SlotNumber
	drawFourthTubeElbow:	
			pushInStack($ra, $a0)
			sendParameters($a0, FOURTH_TUBE_ELBOW)
			jal setTubeType
			popFromStack($ra, $a0)
	
			pushInStack($ra)
	    	jal getBlockFromSlot
        	popFromStack($ra)
        
	    	move $t0, $v0
        	move $t1, $v1
        		
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawVerticalBottomElbow
        	popFromStack($ra, $t0, $t1)
        	
        	pushInStack($ra, $t0, $t1)
        	sendParameters($t0, $t1)
        	jal drawHorizontalRigthElbow
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
	
	
	#arguments: SlotNumber, hasCache (0 has cache, -1 not)
	createFourthTubeElbow:
		bnez $a1, draw_fourth_tube_elbow_no_cache
		
		pushInStack($ra, $a0, $a1)
		sendParameters($a0, FOURTH_TUBE_ELBOW)
		jal setTubeType
		popFromStack($ra, $a0, $a1)
		
		jr $ra
		
		draw_fourth_tube_elbow_no_cache:
			pushInStack($ra)
			jal drawFourthTubeElbow
			popFromStack($ra)					
	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawTopPipeConnector:
		move $t0, $a0
		move $t1, $a1

		add $t2, $t1, 14
		add $t4, $t2, 26
				
		add $t3, $t0, 6
		
		pushInStack($ra, $t0, $t1)
		pushInStack($t0, $t2, $t3, $t4)
		sendParameters($t0, $t2, $t3, $t4, CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($t0, $t2, $t3, $t4)
		popFromStack($ra, $t0, $t1)
		
		#draw border
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, $t4, BORDER_COLOR, NOT_FILLED)
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
		pushInStack($t5, $t2, $t3, $t4)
		sendParameters($t5, $t2, $t3, $t4, CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($t5, $t2, $t3, $t4)
		popFromStack($ra, $t0, $t1)
		
		#draw border
		pushInStack($ra, $t0, $t1)
		sendParameters($t5, $t2, $t3, $t4, BORDER_COLOR, NOT_FILLED)
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
		pushInStack($t2 ,$t1 ,$t3 ,$t4)
		sendParameters($t2 ,$t1 ,$t3 ,$t4 ,CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($t2 ,$t1 ,$t3 ,$t4)
		popFromStack($ra, $t0, $t1)
		
		#draw border
		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t1 ,$t3 ,$t4 ,BORDER_COLOR, NOT_FILLED)
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
		pushInStack($t2 ,$t4 ,$t3 ,$t5)
		sendParameters($t2 ,$t4 ,$t3 ,$t5 ,CONNECT_TUBE, FILLED)
		jal drawRectangle
		popFromStack($t2 ,$t4 ,$t3 ,$t5)
		popFromStack($ra, $t0, $t1)
		
		#draw border
		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t4 ,$t3 ,$t5 ,BORDER_COLOR, NOT_FILLED)
		jal drawRectangle
		popFromStack($ra, $t0, $t1)

	jr $ra
	
	#arguments: initial slot line number in $a0, initial slot column number in $a1
	drawTopPipeConnectorStripes:
		move $t0, $a0
		move $t1, $a1
		
		addi $t0, $t0, 1

		add $t2, $t0, 3
		add $t3, $t1, 16
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
	
		add $t2, $t0, 3
		add $t3, $t1, 20
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 1
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
		
		add $t2, $t0, 2
		add $t3, $t1, 34
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t0, $t2, $t3, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 1
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
		
		add $t2, $t0, 37
		add $t3, $t0, 34
		add $t4, $t1, 18
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 37
		add $t3, $t0, 36
		add $t4, $t1, 22
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
				
		add $t2, $t0, 37
		add $t3, $t0, 37
		add $t4, $t1, 28
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 37
		add $t3, $t0, 34
		add $t4, $t1, 32
		
		pushInStack($ra, $t0, $t1)
		sendParameters($t2, $t3, $t4, STRIPE_TUBE)
		jal drawVerticalLine
		popFromStack($ra, $t0, $t1)

		add $t2, $t0, 37
		add $t3, $t0, 35
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
		add $t3, $t1, 1
		add $t4, $t1, 4

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 16
		add $t3, $t1, 1
		add $t4, $t1, 1

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 22
		add $t3, $t1, 1
		add $t4, $t1, 3

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 26
		add $t3, $t1, 1
		add $t4, $t1, 4

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 30
		add $t3, $t1, 1
		add $t4, $t1, 1

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
		add $t4, $t1, 53		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 24
		add $t3, $t1, 50
		add $t4, $t1, 53		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		
		add $t2, $t0, 20
		add $t3, $t1, 52
		add $t4, $t1, 53		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 12
		add $t3, $t1, 50
		add $t4, $t1, 53		

		pushInStack($ra, $t0, $t1)
		sendParameters($t2 ,$t3 ,$t4 , STRIPE_TUBE)
		jal drawHorizontalLine
		popFromStack($ra, $t0, $t1)
		
		add $t2, $t0, 8
		add $t3, $t1, 52
		add $t4, $t1, 53		

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
        pushInStack($t2, $t4, $t3, $t5)
        sendParameters($t2, $t4, $t3, $t5, TUBE_COLOR, FILLED)
        jal drawRectangle
        popFromStack($t2, $t4, $t3, $t5)
        popFromStack($ra, $t0, $t1)
        
        #draw border
        subi $t2, $t2, 1
        pushInStack($ra, $t0, $t1)
        sendParameters($t2, $t4, $t3, $t5, BORDER_COLOR, NOT_FILLED)
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
        pushInStack($t2, $t4, $t3, $t5)
        sendParameters($t2, $t4, $t3, $t5, TUBE_COLOR, FILLED)
        jal drawRectangle
        popFromStack($t2, $t4, $t3, $t5)
        popFromStack($ra, $t0, $t1)
        
        #draw border
        addi $t3, $t3, 1
        pushInStack($ra, $t0, $t1)
        sendParameters($t2, $t4, $t3, $t5, BORDER_COLOR, NOT_FILLED)
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
       	pushInStack($t2 ,$t4 ,$t3 ,$t5)
        sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
        jal drawRectangle
        popFromStack($t2 ,$t4 ,$t3 ,$t5)
       	popFromStack($ra, $t0, $t1)
       	
       	#draw border
       	subi $t4, $t4, 1
       	addi $t5, $t5, 1
       	pushInStack($ra, $t0, $t1)
       	pushInStack($t2, $t3, $t4)
        sendParameters($t2 ,$t4 ,$t3 ,$t5 , BORDER_COLOR, NOT_FILLED)
        jal drawRectangle
        popFromStack($t2, $t3, $t4)
       	popFromStack($ra, $t0, $t1)       	
       
       	addi $t2, $t2, 1	
       	subi $t3, $t3, 1       	
       	pushInStack($ra)
        sendParameters($t2, $t3, $t4, TUBE_COLOR)
        jal drawVerticalLine
       	popFromStack($ra)
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
       	pushInStack($t2 ,$t4 ,$t3 ,$t5)
        sendParameters($t2 ,$t4 ,$t3 ,$t5 , TUBE_COLOR, FILLED)
        jal drawRectangle
        popFromStack($t2 ,$t4 ,$t3 ,$t5)
       	popFromStack($ra, $t0, $t1)	
       	
       	#draw border
       	subi $t4, $t4, 1
       	addi $t5, $t5, 1
       	pushInStack($ra, $t0, $t1)
       	pushInStack($t2, $t3, $t5)
        sendParameters($t2 ,$t4 ,$t3 ,$t5 , BORDER_COLOR, NOT_FILLED)
        jal drawRectangle
        popFromStack($t2, $t3, $t5)
       	popFromStack($ra, $t0, $t1)	
	
		addi $t2, $t2, 1	
       	subi $t3, $t3, 1       	
       	pushInStack($ra)
        sendParameters($t2, $t3, $t5, TUBE_COLOR)
        jal drawVerticalLine
       	popFromStack($ra)
	jr $ra
