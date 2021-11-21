//Testbench
//Smart Car Parking System
//Tanuj Kumar 2020csb1134
//Jatin 2020csb1090

`timescale 1ns / 1ps
module tb_CAR_Parking_System;

  
  reg RESET;
  reg CLOCK;
  reg Entrance;
  reg Exit;
  reg [3:0] PASSWORD;

  wire Green;
  wire Red;
  wire [2:0] INDICATOR;
  wire [3:0] Count_CAR;

  CAR_Parking_System uut (
  .CLOCK(CLOCK),
  .RESET(RESET),
  .Entrance(Entrance),
  .Exit(Exit),
  .PASSWORD(PASSWORD),
  .Green(Green),
  .Red(Red),
  .Count_CAR(Count_CAR),
  .INDICATOR(INDICATOR)
 );
