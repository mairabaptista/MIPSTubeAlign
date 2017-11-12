.data


.text
	
	# arguments: Slot_number 
	# return: Line $v0, Column in $v1
	getBlockFromSlot:	
		subi $a0, $a0, 1	
		div $t0, $a0, HORIZONTAL_SLOTS
		
		mflo $t1 				#Represents the slot line
		mfhi $t2				#Represents the slot column

		mul $t1, $t1, SLOT_HEIGHT		#Multiplies the slot line by slot height
		addi $t1, $t1, 1
		add $t1, $t1, MARGIN_TOP		#Adds the top margin to correct the position of the generated block column
		
		mul $t2, $t2, SLOT_WIDTH		#Multiplies the slot line by slot width
		add $t2, $t2, 1	
		add $t2, $t2, MARGIN_LEFT 		#Adds the left margin to correct the position of the generated block line
		
		move $v0, $t1
		move $v1, $t2
	jr $ra
	
	
	# arguments: Line in $a0, Column in $a1
	# return: Slot in $v0
	getSlotFromBlock:
		li $t8, 38
		div $a0, $t8
		
		mflo $t0 #slot line
		
		li $t8, 54
		div $a1,$t8
		
		mflo $t1 #slot column
				
		mul $t2, $t0, 9
		add $t3, $t2, $t1
		addi $t4, $t3, 1

		move $v0, $t4
	jr $ra
