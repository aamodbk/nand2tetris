// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R1
D = M

@i
D = D - 1           //keeping a copy of decremented number in R1 for count
M = D
@EXIT
D;JLT

@R0
D = M
@EXIT
D;JEQ

(LOOP)
    @R0
    D = D + M       //multiplication happens through this addition in loop

    @R2
    M = D

    @i
    D = M
    D = D - 1       //count is decremented
    M = D

    @EXIT           //exit if count is 0
    D;JEQ

    @R2
    D = M

    @LOOP           //enters loop again if ccount is positive
    0;JMP

(EXIT)
    @EXIT                       //keeping an infinite loop at the end for security
    0;JMP
