@SCREEN
D=A
@Position //initial position to -1, if to 0 there will be a bug when whiten the screen
M=D-1

(CHECK)
@KBD
D=M      //Read keyboard input
@BLACKEN //if the key value is greater than 0, go to blacken
D;JGT
@WHITEN  //else go to whiten
0;JMP

//Start blacken the Screen
(BLACKEN)
//if position is at max of the screen, do nothing
@24576
D=M
@Position
D=D-M
@CHECK
D;JEQ

//else start blacken
@Position
A=M
M=-1

//go to next position
@Position
D=M+1
@Position
M=D

//go to check if user is still hold the key
@CHECK
0;JMP


//Start whiten the Screen
(WHITEN)

//if position is at left top of the screen, do nothing
@SCREEN
D=A-1    
//if it is D=A there will be a line on the left top of the screen 
//that can not be removed
@Position
D=D-M
@CHECK
D;JEQ

//else start whiten
@Position
A=M
M=0

//draw back position
@Position
D=M-1
@Position
M=D

//check if there is any key pressed by user
@CHECK
0;JMP