//Testbench
//Smart Car Parking System
//Tanuj Kumar 2020csb1134
//Jatin 2020csb1090

//Smart Car Parking System
//Tanuj Kumar 2020csb1134
//Jatin 2020csb1090
`timescale 1ns / 1ps
`include "design.v"
module tb_CAR_Parking_System;

  reg RESET;
  reg CLOCK;
  reg Entrance;
  reg Exit;
  reg [3:0] PASSWORD;

  wire Green;
  wire Red;
  wire [2:0] INDICATOR;


  CAR_Parking_System uut(
                       .CLOCK(CLOCK),
                       .RESET(RESET),
                       .Entrance(Entrance),
                       .Exit(Exit),
                       .PASSWORD(PASSWORD),
                       .Green(Green),
                       .Red(Red),

                       .INDICATOR(INDICATOR)
                     );


  initial
  begin
    $display("Welcome to our Smart Car Parking System\n");

    //testcase 1
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b0;
    Exit = 1'b0;
    PASSWORD = 4'b1001;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b000)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b            ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: Initial_State\n\n\n");
    end

    //testcase 2
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1111;      //Incorrect Password
    #10 CLOCK=1'b1;
    #10;

    if(INDICATOR==3'b001)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b                ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: HOLD\n\n\n");

    end

    //testcase 3
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1000;      //Incorrect Password
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b010)
    begin
      $display("Inputs are as follows:\n            Password  :%b    ",PASSWORD);
      $display("Entered Password is Incorrect\n");
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: Incorrect_password\n\n\n");
    end
    //testcase 4
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1100;      //Incorrect Password
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b010)
    begin
      $display("Inputs are as follows:\n            Password  :%b    ",PASSWORD);
      $display("Entered Password is Incorrect\n");
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: Incorrect_password\n\n\n");
    end
    //testcase 5
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1011;      //Correct Password
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b011)
    begin
      $display("Inputs are as follows:\n             Password :%b    ",PASSWORD);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Entered Password is Correct\n");
      $display("Current state is: RIGHT PASSWORD\n\n\n");
    end
    //Testcase 5
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b0;
    Exit = 1'b1;
    PASSWORD = 4'b1111;      //inCorrect Password
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b000)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b            ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: Initial_State\n\n\n");
    end
    //testcase 6
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b1;
    PASSWORD = 4'b1111;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b100)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b            ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: End\n\n\n");
    end
    //Testcase 7
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1111;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b001)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b                ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: HOLD\n\n\n");

    end
    //testcase 8
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1011;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b011)
    begin
      $display("Inputs are as follows:\n             Password :%b    ",PASSWORD);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Entered Password is Correct\n");
      $display("Current state is: RIGHT PASSWORD\n\n\n");
    end
    //testcase 9
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b1;
    PASSWORD = 4'b1011;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b100)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b            ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: End\n\n\n");
    end
    //testcase 10
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b1;
    PASSWORD = 4'b1011;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b100)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b            ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: End\n\n\n");
    end

    //test case 11 reseting fsm
    CLOCK=1'b0;
    RESET = 1'b1;
    Entrance = 1'b1;
    Exit = 1'b1;
    PASSWORD = 4'b1011;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b000)
    begin
      $display("RESETING!!");
 

      $display("Current state is: Initial_State\n\n\n");
    end


//Here we go again
//testcase 1
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b0;
    Exit = 1'b0;
    PASSWORD = 4'b1001;
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b000)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b            ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: Initial_State\n\n\n");
    end

    //testcase 2
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1111;      //Incorrect Password
    #10 CLOCK=1'b1;
    #10;

    if(INDICATOR==3'b001)
    begin
      $display("Inputs are as follows:\n Entrance:%b          Exit:%b                ",Entrance,Exit);
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: HOLD\n\n\n");

    end

    //testcase 3
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1000;      //Incorrect Password
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b010)
    begin
      $display("Inputs are as follows:\n            Password  :%b    ",PASSWORD);
      $display("Entered Password is Incorrect\n");
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: Incorrect_password\n\n\n");
    end
    //testcase 4
    CLOCK=1'b0;
    RESET = 1'b0;
    Entrance = 1'b1;
    Exit = 1'b0;
    PASSWORD = 4'b1100;      //Incorrect Password
    #10 CLOCK=1'b1;
    #10;
    if(INDICATOR==3'b010)
    begin
      $display("Inputs are as follows:\n            Password  :%b    ",PASSWORD);
      $display("Entered Password is Incorrect\n");
      $display("Outputs are as follows:\n      Red Led:%b      Green Led:%b\n",Red,Green);
      $display("Current state is: Incorrect_password\n\n\n");
    end

    #20
     $display("Ended Successfully");
  end

  initial
  begin

    $dumpfile("CAR_Parking_System.vcd");

    $dumpvars();

  end

endmodule


