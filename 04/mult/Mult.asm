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
@R2 //set initial R2 = 0
M=0

@R0 // end if R0 = 0
D=M
@END
D;JEQ

@R1 // end if R1 = 0
D=M
@END
D;JEQ

@i //set i = 1
M=1

(LOOP) // loop
@i
D=M // D = i

@R1 // D = i - *R1
D=D-M

@END // if (i - *R1) > 0 goto END
D;JGT

@R0 // D = *R0
D=M

@R2 // *R2 += *R0
M=D+M

@i // R1 += 1
M=M+1

@LOOP //goto LOOP
0;JMP

(END)
@END
0;JMP
