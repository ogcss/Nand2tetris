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
@1000
D=A
@num_pix
M=D
(LOOP)
	@KBD
	D=M
	@LOOP
	D;JEQ
	@i_fill_pix
	M=0
	@i_clear_pix
	M=0
	(SCREEN_FILL_LOOP)
		@i_fill_pix
		D=M
		@num_pix
		D=M-D
		@SCREEN_FILL_END
		D;JEQ
		
		@i_fill_pix
		D=M
		@SCREEN
		A=D+A
		M=1
		@i_fill_pix
		M=M+1
		@SCREEN_FILL_LOOP
		0;JMP
	(SCREEN_FILL_END)
		@i_fill_pix
		M=0
	(SCREEN_CLEAR_LOOP)
		@i_clear_pix
		D=M
		@num_pix
		D=M-D
		@SCREEN_CLEAR_END
		D;JEQ
		
		@i_clear_pix
		D=M
		@SCREEN
		A=D+A
		M=0
		@i_clear_pix
		M=M+1
		@SCREEN_CLEAR_LOOP
		0;JMP
	(SCREEN_CLEAR_END)
		@i_clear_pix
		M=0
		@LOOP
		0;JMP