.data


.text 

    #arguments: top screen slot number in $a0, letter code in ascii $a1
    drawLetters:
        beq $a1, 32 finish_drawing_letter
        pushInStack($ra, $a0, $a1)
        sendParameters($a0)
        jal getBlockFromTopScreenSlot
        popFromStack($ra, $a0, $a1)

        move $t0, $v0
        move $t1, $v1
        add $t0, $t0, 3     #margin  

        drawTopMainDiagonal:

            beq $a1, 65, drawBottomMainDiagonal
            beq $a1, 67, drawBottomMainDiagonal
            beq $a1, 69, drawBottomMainDiagonal
            beq $a1, 71, drawBottomMainDiagonal
            beq $a1, 73, drawBottomMainDiagonal
            beq $a1, 76, drawBottomMainDiagonal
            beq $a1, 78, drawBottomMainDiagonal
            beq $a1, 79, drawBottomMainDiagonal
            beq $a1, 80, drawBottomMainDiagonal
            beq $a1, 82, drawBottomMainDiagonal
            beq $a1, 83, drawBottomMainDiagonal
            beq $a1, 84, drawBottomMainDiagonal

            add $t2, $t1, 1

            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t0, $t2)
            jal getPositionFromBlock
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)   

            move $t7, $v0 
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            addi $t2, $zero, 4 
            sendParameters($t7, $t2, MAIN_DIAGONAL, BORDER_COLOR)
            jal drawContinuosBlocks
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)


            add $t2, $t0, 1
            add $t3, $t1, 1
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t2, $t3)
            jal getPositionFromBlock
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)

            move $t7, $v0 

            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            addi $t2, $zero, 4 
            sendParameters($t7, $t2, MAIN_DIAGONAL, BORDER_COLOR)
            jal drawContinuosBlocks
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)

        drawBottomMainDiagonal:

            beq $a1, 65, drawTopSecondaryDiagonal
            beq $a1, 67, drawTopSecondaryDiagonal
            beq $a1, 69, drawTopSecondaryDiagonal
            beq $a1, 71, drawTopSecondaryDiagonal
            beq $a1, 73, drawTopSecondaryDiagonal
            beq $a1, 76, drawTopSecondaryDiagonal
            beq $a1, 77, drawTopSecondaryDiagonal
            beq $a1, 78, drawTopSecondaryDiagonal
            beq $a1, 79, drawTopSecondaryDiagonal
            beq $a1, 80, drawTopSecondaryDiagonal            
            beq $a1, 83, drawTopSecondaryDiagonal
            beq $a1, 84, drawTopSecondaryDiagonal

            add $t2, $t1, 3
            add $t3, $t0, 5

            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t3, $t2)
            jal getPositionFromBlock
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)   

            move $t7, $v0 
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            addi $t2, $zero, 6 
            sendParameters($t7, $t2, MAIN_DIAGONAL, BORDER_COLOR)
            jal drawContinuosBlocks
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)          

            add $t2, $t1, 3
            add $t3, $t0, 6

            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t3, $t2)
            jal getPositionFromBlock
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)   

            move $t7, $v0 
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            addi $t2, $zero, 6 
            sendParameters($t7, $t2, MAIN_DIAGONAL, BORDER_COLOR)
            jal drawContinuosBlocks
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)


            add $t2, $t0, 7
            add $t3, $t1, 3
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t2, $t3)
            jal getPositionFromBlock
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)

            move $t7, $v0 

            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            addi $t2, $zero, 5 
            sendParameters($t7, $t2, MAIN_DIAGONAL, BORDER_COLOR)
            jal drawContinuosBlocks
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)

        drawTopSecondaryDiagonal:

            beq $a1, 65, drawMiddleTopVerticalLine
            beq $a1, 67, drawMiddleTopVerticalLine
            beq $a1, 69, drawMiddleTopVerticalLine
            beq $a1, 71, drawMiddleTopVerticalLine
            beq $a1, 73, drawMiddleTopVerticalLine
            beq $a1, 76, drawMiddleTopVerticalLine
            beq $a1, 78, drawMiddleTopVerticalLine
            beq $a1, 79, drawMiddleTopVerticalLine
            beq $a1, 80, drawMiddleTopVerticalLine
            beq $a1, 82, drawMiddleTopVerticalLine
            beq $a1, 83, drawMiddleTopVerticalLine
            beq $a1, 84, drawTopSecondaryDiagonal

            add $t2, $t1, 7
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t0, $t2)
            jal getPositionFromBlock
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)
    
            move $t7, $v0 
    
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            addi $t2, $zero, 4 
            sendParameters($t7, $t2, SECONDARY_DIAGONAL, BORDER_COLOR)
            jal drawContinuosBlocks
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)
    
            add $t2, $t1, 7
            add $t3, $t0, 1
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t3, $t2)
            jal getPositionFromBlock
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)
    
            move $t7, $v0 
    
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            addi $t2, $zero, 4 
            sendParameters($t7, $t2, SECONDARY_DIAGONAL, BORDER_COLOR)
            jal drawContinuosBlocks
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)

        
        drawMiddleTopVerticalLine:

            beq $a1, 65, drawTopHorizontalLine
            beq $a1, 67, drawTopHorizontalLine
            beq $a1, 69, drawTopHorizontalLine
            beq $a1, 71, drawTopHorizontalLine
            beq $a1, 76, drawTopHorizontalLine
            beq $a1, 77, drawTopHorizontalLine
            beq $a1, 78, drawTopHorizontalLine
            beq $a1, 79, drawTopHorizontalLine
            beq $a1, 80, drawTopHorizontalLine
            beq $a1, 82, drawTopHorizontalLine
            beq $a1, 83, drawTopHorizontalLine          

            add $t2, $t1, 3
            add $t3, $t0, 6                 
            add $t4, $t2, 1                 
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t0, $t2, $t3, $t4, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)
        
        drawMiddleBottomVerticalLine:           

            beq $a1, 65, drawTopHorizontalLine
            beq $a1, 67, drawTopHorizontalLine
            beq $a1, 69, drawTopHorizontalLine
            beq $a1, 71, drawTopHorizontalLine
            beq $a1, 76, drawTopHorizontalLine
            beq $a1, 77, drawTopHorizontalLine
            beq $a1, 78, drawTopHorizontalLine
            beq $a1, 79, drawTopHorizontalLine
            beq $a1, 80, drawTopHorizontalLine
            beq $a1, 82, drawTopHorizontalLine
            beq $a1, 83, drawTopHorizontalLine

            add $t2, $t1, 3
            add $t3, $t0, 6                 
            add $t4, $t2, 1 
            add $t5, $t3, 5
                                            
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t3, $t2, $t5, $t4, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)      

        drawTopHorizontalLine:
            beq $a1, 76, drawMiddleLeftHorizontalLine
            beq $a1, 77, drawMiddleLeftHorizontalLine
            beq $a1, 78, drawMiddleLeftHorizontalLine

            add $t2, $t0, 1
            add $t3, $t1, 7
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t0, $t1, $t2, $t3, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)      

        drawMiddleLeftHorizontalLine:      
            beq $a1, 67, drawMiddleRightHorizontalLine
            beq $a1, 71, drawMiddleRightHorizontalLine
            beq $a1, 73, drawMiddleRightHorizontalLine
            beq $a1, 76, drawMiddleRightHorizontalLine
            beq $a1, 77, drawMiddleRightHorizontalLine
            beq $a1, 78, drawMiddleRightHorizontalLine
            beq $a1, 79, drawMiddleRightHorizontalLine
            beq $a1, 84, drawMiddleRightHorizontalLine

            add $t3, $t1, 5
            add $t4, $t0, 5
            add $t2, $t4, 1
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t4, $t1, $t2, $t3, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)

        drawMiddleRightHorizontalLine:
            beq $a1, 67, drawBottomHorizontalLine
            beq $a1, 69, drawBottomHorizontalLine
            beq $a1, 73, drawBottomHorizontalLine
            beq $a1, 76, drawBottomHorizontalLine
            beq $a1, 77, drawBottomHorizontalLine
            beq $a1, 78, drawBottomHorizontalLine
            beq $a1, 79, drawBottomHorizontalLine
            beq $a1, 84, drawBottomHorizontalLine

            add $t3, $t1, 7
            add $t4, $t0, 5
            add $t2, $t4, 1
            add $t5, $t1, 4
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t4, $t5, $t2, $t3, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)       

        drawBottomHorizontalLine:
            beq $a1, 65, drawLeftTopVerticalLine
            beq $a1, 77, drawLeftTopVerticalLine
            beq $a1, 78, drawLeftTopVerticalLine
            beq $a1, 80, drawLeftTopVerticalLine
            beq $a1, 82, drawLeftTopVerticalLine
            beq $a1, 84, drawLeftTopVerticalLine

            add $t2, $t0, 10
            add $t3, $t1, 7
            add $t4, $t2, 1
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t2, $t1, $t4, $t3, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)        
                     
         drawLeftTopVerticalLine:               

            beq $a1, 73, drawLeftBottomVerticalLine
            beq $a1, 84, drawLeftBottomVerticalLine

            add $t2, $t0, 6             
            add $t3, $t1, 1                 
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t0, $t1, $t2, $t3, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)
            
        drawLeftBottomVerticalLine:             

            beq $a1, 73, drawRightTopVerticalLine            
            beq $a1, 83, drawRightTopVerticalLine
            beq $a1, 84, drawRightTopVerticalLine

            add $t2, $t0, 6             
            add $t3, $t1, 1     
            add $t4, $t2, 5         
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t2, $t1, $t4, $t3, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)

        drawRightTopVerticalLine:

            beq $a1, 67, drawRightBottomVerticalLine
            beq $a1, 69, drawRightBottomVerticalLine
            beq $a1, 71, drawRightBottomVerticalLine
            beq $a1, 73, drawRightBottomVerticalLine
            beq $a1, 76, drawRightBottomVerticalLine
            beq $a1, 83, drawRightBottomVerticalLine
            beq $a1, 84, drawRightBottomVerticalLine
            
            add $t2, $t1, 7
            add $t3, $t0, 6
            add $t4, $t2, 1
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t0, $t2, $t3, $t4, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1)
            
        drawRightBottomVerticalLine:

            beq $a1, 67, finish_drawing_letter
            beq $a1, 69, finish_drawing_letter
            beq $a1, 73, finish_drawing_letter
            beq $a1, 76, finish_drawing_letter
            beq $a1, 80, finish_drawing_letter
            beq $a1, 82, finish_drawing_letter
            beq $a1, 84, finish_drawing_letter        
            
            add $t2, $t1, 7
            add $t3, $t0, 5
            add $t4, $t2, 1
            add $t5, $t3, 6
            pushInStack($ra, $t0, $t1)
            pushInStack($a0, $a1)
            sendParameters($t3, $t2, $t5, $t4, BORDER_COLOR, FILLED)
            jal drawRectangle
            popFromStack($a0, $a1)
            popFromStack($ra, $t0, $t1) 

        finish_drawing_letter:
            refreshBitmap
        
    jr $ra
