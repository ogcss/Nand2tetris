// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//テスト用
//@3
//D=A
//@R0
//M=D
//@4
//D=A
//@R1
//M=D

//初期設定
@i
M=1
@R2
M=0
(LOOP)
	//終了判定
	@R1
	D=M
	@i
	D=D-M
	@END
	D;JLT
	
	//乗算処理
	@R2
	D=M
	@R0
	D=D+M
	@R2
	M=D
	@i
	M=M+1
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP