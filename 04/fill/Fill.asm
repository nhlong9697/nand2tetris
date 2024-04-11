// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//while (true) {
//	for (int i = 16384; i+=1; i<= 16384 + 256*512/16) {
//		if (RAM[24576] != 0) {
//			RAM[i] = -1
//		else {
//			RAM[i] = 0
//		}
//	}
//}
@16384
D=A
@i
M=D
(FOR_LOOP)
@i
D=M
@24576
D=D-A
@END
D;JGE
@24576
D=M
@IF_TRUE
D;JNE
@i
A=M
M=0
@END_IF
0;JMP
(IF_TRUE)
@i
A=M
M=-1
(END_IF)
@i
M=M+1
@FOR_LOOP
0;JMP
(END)	
@END
0;JMP




//(RESTART)
//@SCREEN
//D=A
//@0
//M=D	//PUT SCREEN START LOCATION IN RAM0
//
/////////////////////////////
//(KBDCHECK)
//
//@KBD
//D=M
//@BLACK
//D;JGT	//JUMP IF ANY KBD KEYS ARE PRESSED
//@WHITE
//D;JEQ	//ELSE JUMP TO WHITEN
//
//@KBDCHECK
//0;JMP
/////////////////////////////
//(BLACK)
//@1
//M=-1	//WHAT TO FILL SCREEN WITH (-1=11111111111111)
//@CHANGE
//0;JMP
//
//(WHITE)
//@1
//M=0	//WHAT TO FILL SCREEN WITH
//@CHANGE
//0;JMP
////////////////////////////
//(CHANGE)
//@1	//CHECK WHAT TO FILL SCREEN WITH
//D=M	//D CONTAINS BLACK OR WHITE
//
//@0
//A=M	//GET ADRESS OF SCREEN PIXEL TO FILL
//M=D	//FILL IT
//
//@0
//D=M+1	//INC TO NEXT PIXEL
//@KBD
//D=A-D	//KBD-SCREEN=A
//
//@0
//M=M+1	//INC TO NEXT PIXEL
//A=M
//
//@CHANGE
//D;JGT	//IF A=0 EXIT AS THE WHOLE SCREEN IS BLACK
///////////////////////////
//@RESTART
//0;JMP
