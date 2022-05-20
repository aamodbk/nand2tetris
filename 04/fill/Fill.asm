// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the colorboard input.
// When a color is pressed (any color), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the color is pressed. 
// When no color is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no color is pressed.

// Put your code here.

    @offset                 //initializing the offset from the SCREEN address to be 0
    M = 0

(LOOP)
    @KBD
    D = M

    @BLACK
    D;JGT                   //checking if any key is being pressed and setting color to black if yes

    @WHITE                  //setting color to white if no
    0;JMP

(BLACK)
    @color
    M = -1

    @SETCOLOR
    0;JMP

(WHITE)
    @color
    M = 0

    @SETCOLOR
    0;JMP

(SETCOLOR)
    @SCREEN
    D = A
    @offset
    D = D + M

    //using pointer based processing to set SCREEN address
    @i
    M = D

    @color
    D = M
    
    @i
    A = M
    M = D

    @offset
    M = M + 1
    D = M
    
    @8192           //as 8192 addresses of SCREEN have to be covered
    D = A - D
    
    @LOOP
    D;JGT
    
    @offset
    M = 0

    @LOOP
    0;JMP