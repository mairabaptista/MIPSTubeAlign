.data


.text
	
	# arguments: Slot_number 
	# return: Line $v0, Column in $v1
	getBlockFromSlot:	
		subi $a0, $a0, 1	
		div $t0, $a0, HORIZONTAL_SLOTS
		
		mflo $t1 						#Represents the slot line
		mfhi $t2						#Represents the slot column

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
		addi $t8, $zero, SLOT_HEIGHT 	
		div $a0, $t8
		
		mflo $t0 						#Represents the slot's line
		
		addi $t8, $zero, SLOT_WIDTH
		div $a1,$t8
		
		mflo $t1 						#Represents the slot's column
				
		mul $t2, $t0, HORIZONTAL_SLOTS
		add $t3, $t2, $t1
		addi $t4, $t3, 1				#Blocks start in 1, not zero

		move $v0, $t4

	jr $ra


	#arguments: Top screen slot number
	#return: line in $v0, column in $v1
	getBlockFromTopScreenSlot:
		subi $a0, $a0, 1
		addi $t0, $t0, HORIZONTAL_TOP_SCREEN_SLOTS
		div $a0, $t0

		mflo $t0								#Represents the slot's line  
		mfhi $t1								#Represents the slot's column

		mul $t0, $t0, TOP_SCREEN_SLOT_HEIGHT	#Multiplies the slot's line by slot's height

		mul $t1, $t1, TOP_SCREEN_SLOT_WIDTH		#Multiplies the slot's column by slot's width

		move $v0, $t0
		move $v1, $t1

	jr $ra

	#arguments: line in $a0, column in $a1
	#return: slot in $v0
	getSlotFromTopScreenBlock:
		addi $t0, $zero, TOP_SCREEN_SLOT_HEIGHT
		div $a0, $t0

		mflo $t1 								#Represents the slot's line

		addi $t0, $zero, TOP_SCREEN_SLOT_WIDTH
		div $a1, $t0

		mflo $t2								#Represents the slot's column

		mul $t3, $t1, HORIZONTAL_TOP_SCREEN_SLOTS
		add $t3, $t3, $t2
		addi $t3, $t3, 1						#Blocks start in 1, not zero

		move $v0, $t3

	jr $ra
