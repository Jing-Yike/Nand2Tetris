// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//Pseudo Code

//  int KBD;
//INFLOOP:
//  if KBD != 0, then
//BLACKEN:
//  R[SCREEN ADDR] = -1;
//  SCREEN ADDR = SCREEN ADDR + 1;
//      if SCREEN ADDR < KBD ADDR,
//      then goto BLACKEN;
//      else if goto INFLOOP;
//  else
//WHITEN:
//  R[SCREEN ADDR] = 0;
//  SCREEN ADDR = SCREEN ADDR + 1;
//      if SCREEN ADDR < KBD ADDR,
//      then goto WHITEN;
//      else goto INFLOOP;

// Infinite loop listens to the keyboard input
(INFLOOP)

// Declare 2 variables to store the addresses of SCREEN and KBD
    @SCREEN
    D=A
    @screenaddr
    M=D
    @KBD
    D=A
    @kbdaddr
    M=D

    @KBD
    D=M
    @WHITEN
    D;JEQ

// Loop blackens the screen
(BLACKEN)
    @screenaddr
    A=M
    M=-1
    @screenaddr
    M=M+1
    D=M
    @kbdaddr
    D=D-M
    @BLACKEN
    D;JLT
    @INFLOOP
    D;JGE

// Loop whitens the screen
(WHITEN)
    @screenaddr
    A=M
    M=0
    @screenaddr
    M=M+1
    D=M
    @kbdaddr
    D=D-M
    @WHITEN
    D;JLT
    @INFLOOP
    D;JGE