.data
		
.text
	# Macros
	.macro pushInStack(%x)
		sub $sp, $sp, 4								# adjust to push in stack
		sw  %x, 0($sp)								# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y)
		sub $sp, $sp, 8								# adjust to push in stack
		sw  %x, 4($sp)								# push register in stack
		sw  %y, 0($sp)								# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y, %z)
		sub $sp, $sp, 12							# adjust to push in stack
		sw  %x, 8($sp)								# push register in stack
		sw  %y, 4($sp)								# push register in stack
		sw  %z, 0($sp)								# push register in stack
	.end_macro
	
	.macro pushInStack(%x, %y, %z, %w)
		sub $sp, $sp, 16							# adjust to push in stack
		sw  %x, 12($sp)								# push register in stack
		sw  %y, 8($sp)								# push register in stack
		sw  %z, 4($sp)								# push register in stack
		sw  %w, 0($sp)								# push register in stack
	.end_macro
	
	.macro popFromStack(%x)
		lw  %x, 0($sp)								# restore register from stack
		add $sp, $sp, 4								# adjust $sp
	.end_macro
	
	.macro popFromStack(%x, %y)
		lw  %y, 0($sp)								# restore register from stack
		lw  %x, 4($sp)								# restore register from stack
		add $sp, $sp, 8								# adjust $sp
	.end_macro
	
	.macro popFromStack(%x, %y, %z)
		lw  %z, 0($sp)								# restore register from stack
		lw  %y, 4($sp)								# restore register from stack
		lw  %x, 8($sp)								# restore register from stack
		add $sp, $sp, 12							# adjust $sp
	.end_macro
	
	.macro popFromStack(%x, %y, %z, %w)
		lw  %w, 0($sp)								# restore register from stack
		lw  %z, 4($sp)								# restore register from stack
		lw  %y, 8($sp)								# restore register from stack
		lw  %x, 12($sp)								# restore register from stack
		add $sp, $sp, 16							# adjust $sp
	.end_macro