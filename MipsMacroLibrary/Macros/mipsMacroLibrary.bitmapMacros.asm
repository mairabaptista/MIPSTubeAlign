.data
		
.text	
	.macro refreshBitmap					
		li $v0, 39				
		syscall
	.end_macro
	
	.macro getBitmapCache(%x)
		li $v0, 38
		li $a0, 0
		add $a1, $zero, %x
		syscall	
	.end_macro
	
	.macro setBitmapCache(%x)						
		li $v0, 38
		li $a0, 1
		add $a1, $zero, %x
		syscall
	.end_macro
