.data
		
.text
	
	.macro sendParameters(%x)						
		add $a0, $zero, %x	
	.end_macro
	
	.macro sendParameters(%x, %y)					
		sendParameters(%x)
		add $a1, $zero, %y	
	.end_macro
	
	.macro sendParameters(%x, %y, %z)				
		sendParameters(%x, %y)
		add $a2, $zero, %z	
	.end_macro
	
	.macro sendParameters(%x, %y, %z, %w)			
		sendParameters(%x, %y, %z)
		add $a3, $zero, %w		
	.end_macro
	
	.macro sendParameters(%x, %y, %z, %w, %f)		
		sendParameters(%x, %y, %z, %w)					
		add $t8, $zero, %f		
		pushInStack($t8)
	.end_macro
	
	.macro sendParameters(%x, %y, %z, %w, %f, %g)
		sendParameters(%x, %y, %z, %w, %f)					
		add $t9, $zero, %g		
		pushInStack($t9)
	.end_macro
	
	.macro return_EXIT_SUCCESS
		li $v0, 10
		syscall
	.end_macro
