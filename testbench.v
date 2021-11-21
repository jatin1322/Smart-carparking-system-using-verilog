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

 /*initial begin
 CLOCK = 0;
 forever #10 CLOCK = ~CLOCK;
 end*/
 initial begin
   $display("Welcome to our Smart Car Parking System\n");
   CLOCK=1'b0;
 RESET = 1'b0;
 Entrance = 1'b0;
 Exit = 1'b0;
 PASSWORD = 4'b1001;
   #10 CLOCK=1'b1;
   #10;
     $display("Inputs are as follows:\n Entrance:%b\n Exit:%b\n",Entrance,Exit);
     $display("Outputs are as follows:\n Red Led:%b\n Green Led:%b\n",Red,Green);
   if(INDICATOR==3'b000)
   $display("Current state is: Initial_State\n");
   if(INDICATOR==3'b001)
   $display("Current state is: HOLD\n");
   if(INDICATOR==3'b010)
   $display("Current state is: Incorrect_password\n");
   if(INDICATOR==3'b011)
   $display("Current state is: RIGHT PASSWORD\n");
   if(INDICATOR==3'b100)
   $display("Current state is: End\n");

   CLOCK=1'b0;
      RESET = 1'b0;
 Entrance = 1'b1;
 Exit = 1'b0;
 PASSWORD = 4'b1011;
   #10 CLOCK=1'b1;
   #10
 
     $display("Inputs are as follows:\n Entrance:%b\n Exit:%b\n",Entrance,Exit);
     $display("Outputs are as follows:\n Red Led:%b\n Green Led:%b\n",Red,Green);
   if(INDICATOR==3'b000)
   $display("Current state is: Initial_State\n");
   if(INDICATOR==3'b001)
   $display("Current state is: HOLD\n");
   if(INDICATOR==3'b010)
   $display("Current state is: Incorrect_password\n");
   if(INDICATOR==3'b011)
   $display("Current state is: RIGHT PASSWORD\n");
   if(INDICATOR==3'b100)
   $display("Current state is: End\n");


   CLOCK=1'b0;
      RESET = 1'b0;
 Entrance = 1'b1;
 Exit = 1'b0;
 PASSWORD = 4'b1011;
  #10 CLOCK=1'b1;
   #10
   
     $display("Inputs are as follows:\n Entrance:%b\n Exit:%b\n",Entrance,Exit);
     $display("Outputs are as follows:\n Red Led:%b\n Green Led:%b\n",Red,Green);
   if(INDICATOR==3'b000)
   $display("Current state is: Initial_State\n");
   if(INDICATOR==3'b001)
   $display("Current state is: HOLD\n");
   if(INDICATOR==3'b010)
   $display("Current state is: Incorrect_password\n");
   if(INDICATOR==3'b011)
   $display("Current state is: RIGHT PASSWORD\n");
   if(INDICATOR==3'b100)
   $display("Current state is: End\n");

   CLOCK=1'b0;
      RESET = 1'b1;
 Entrance = 1'b1;
 Exit = 1'b0;
 PASSWORD = 4'b1011;
  #10 CLOCK=1'b1;
   #10
   
     $display("Inputs are as follows:\n Entrance:%b\n Exit:%b\n",Entrance,Exit);
     $display("Outputs are as follows:\n Red Led:%b\n Green Led:%b\n",Red,Green);
   if(INDICATOR==3'b000)
   $display("Current state is: Initial_State\n");
   if(INDICATOR==3'b001)
   $display("Current state is: HOLD\n");
   if(INDICATOR==3'b010)
   $display("Current state is: Incorrect_password\n");
   if(INDICATOR==3'b011)
   $display("Current state is: RIGHT PASSWORD\n");
   if(INDICATOR==3'b100)
   $display("Current state is: End\n");

   CLOCK=1'b0;
      RESET = 1'b0;
 Entrance = 1'b1;
 Exit = 1'b0;
 PASSWORD = 4'b1011;
  #10 CLOCK=1'b1;
   #10
   
     $display("Inputs are as follows:\n Entrance:%b\n Exit:%b\n",Entrance,Exit);
     $display("Outputs are as follows:\n Red Led:%b\n Green Led:%b\n",Red,Green);
   if(INDICATOR==3'b000)
   $display("Current state is: Initial_State\n");
   if(INDICATOR==3'b001)
   $display("Current state is: HOLD\n");
   if(INDICATOR==3'b010)
   $display("Current state is: Incorrect_password\n");
   if(INDICATOR==3'b011)
   $display("Current state is: RIGHT PASSWORD\n");
   if(INDICATOR==3'b100)
   $display("Current state is: End\n");   

   CLOCK=1'b0;
      RESET = 1'b0;
 Entrance = 1'b1;
 Exit = 1'b0;
 PASSWORD = 4'b1111;

     $display("Inputs are as follows:\n Entrance:%b\n Exit:%b\n",Entrance,Exit);
     #10 $display("Outputs are as follows:\n Red Led:%b\n Green Led:%b\n",Red,Green);
   if(INDICATOR==3'b000)
   $display("Current state is: Initial_State\n");
   if(INDICATOR==3'b001)
   $display("Current state is: HOLD\n");
   if(INDICATOR==3'b010)
   $display("Current state is: Incorrect_password\n");
   if(INDICATOR==3'b011)
   $display("Current state is: RIGHT PASSWORD\n");
   if(INDICATOR==3'b100)
   $display("Current state is: End\n");

#20
   $display("Ended Successfully");
 end

initial
begin

  $dumpfile("dump.vcd");

  $dumpvars;

end

endmodule


