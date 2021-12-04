// Code your design here
//Smart Car Parking System
//Tanuj Kumar 2020csb1134
//Jatin 2020csb1090


//Smart Car Parking System
//Tanuj Kumar 2020csb1134
//Jatin 2020csb1090

`timescale 1ns / 1ps
//Verilog Code for Car parking System
module CAR_Parking_System(
    input RESET,          // 1 bit input for resetting the car parking system
    input CLOCK,          // Clock as continuous input of 1 bit
    input Entrance,       // 1 bit Entrance value asking for entering the system
    input Exit,           // 1 bit Exit value asking for Exiting the system
    input [3:0] PASSWORD, //  Password of 4 bit length to increase security
    output wire Green,
    output wire Red,

    output reg [2:0] INDICATOR // Output variable used to refer states of FSM

  );

  //Five States
  parameter Correct_password = 3'b011;
  parameter Incorrect_password = 3'b010;
  parameter Initial_State = 3'b000;
  parameter HOLD = 3'b001;
  parameter End = 3'b100;

  // And the code is based on Moore FSM as output only depends on the current state
  reg[2:0] CS;//CS as Current State
  reg[2:0] NS;//NS as Next State


  reg RED_tmp,GREEN_tmp;

  initial
  begin
    CS=Initial_State;
  end

  always @(posedge CLOCK or posedge RESET)
  begin
    if(RESET)
      // When we set reset as 1 It will set current state as initial state
    begin
      CS = Initial_State;
    end
    else
      CS = NS;
    //When Clock changes its value from 0 to 1,It will set current state as Next state
  end



  always @(*)
  begin
    case(CS)
      Initial_State:
      begin
        if(Entrance == 1&& Exit== 1 )
          NS = End ;
        else if(Entrance==1&& Exit== 0 )
          NS= HOLD;
        else
          NS = Initial_State;
      end



      HOLD:
      begin
        if(PASSWORD==4'b1011)

          NS = Correct_password;

        else

          NS = Incorrect_password;

      end




      Incorrect_password:
      begin
        if(PASSWORD==4'b1011)

          NS = Correct_password;

        else
          NS = Incorrect_password;
      end


      Correct_password:
      begin
        if(Entrance==1 && Exit == 1)

          NS = End;

        else if(Exit ==1)
          NS = Initial_State;

        else
          NS = Correct_password;

      end

      End:
      begin
        if(Entrance==1 && Exit == 1)

          NS = End;

        else
          NS=HOLD;

      end
      default:
        NS = Initial_State;
    endcase
  end



  always @(posedge CLOCK) begin
    case(CS)
      Initial_State:  begin
        GREEN_tmp = 1'b0;
        RED_tmp = 1'b0;
        INDICATOR = 3'b000;
      end
      HOLD: begin
        GREEN_tmp = 1'b0;
        RED_tmp = 1'b1;
        INDICATOR = 3'b001;
      end
      Incorrect_password:  begin
        GREEN_tmp = 1'b0;
        RED_tmp = 1'b1;
        INDICATOR = 3'b010;
      end
      Correct_password:
      begin
        GREEN_tmp = 1'b1;
        RED_tmp = 1'b0;
        INDICATOR = 3'b011;
      end
      End:
      begin
        GREEN_tmp = 1'b0;
        RED_tmp = 1'b1;
        INDICATOR = 3'b100;
      end
    endcase
  end
  assign Red = RED_tmp  ;
  assign Green = GREEN_tmp;

endmodule

