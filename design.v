// Code your design here
//Smart Car Parking System
//Tanuj Kumar 2020csb1134
//Jatin 2020csb1090

`timescale 1ns / 1ps
//Verilog Code for Car parking System 
module CAR_Parking_System( 
 input RESET,//1 bit input for resetting the car parking system 
 input CLOCK,//Clock as continuous input of 1 bit 
 input Entrance,//1 bit Entrance value asking for entering the system
 input Exit, // 1 bit Exit value asking for Exiting the system 
input [3:0] PASSWORD,
output wire Green,
output wire Red,
// output reg [6:0] H1,//These 7 bits output H1 and H2 are used for showing 7 segment display of five states
// output reg [6:0] H2
output reg [3:0] Count_CAR,
output reg [2:0] INDICATOR

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
 reg[31:0] WC;//WC as wait counter

reg RED_tmp,GREEN_tmp;

reg [3:0] totalcars;

always @(posedge CLOCK or posedge RESET)
begin
if(RESET)
begin
CS = Initial_State;
// Count_CAR = 4'b0000;
end
else
CS = NS;
end

always @(posedge CLOCK or posedge RESET)
begin
if(RESET)
WC <= 0;
else if(CS==HOLD)
WC <= WC + 4'b0001;
else
WC <= 0;
end

always @(*)
begin
case(CS)
Initial_State: begin
if(Entrance == 1)
NS = HOLD;
if(Entrance == 0)
NS = Initial_State;
//if(out == 1 && counter>=1)
//begin
//totalcars <= totalcars - 4'b0001;
//NS = Initial_State;
//end
//(out == 1 && counter<=0)
end
HOLD: begin
if(WC <= 3)
NS = HOLD;
else
begin
if(PASSWORD==4'b1011)
begin
//Count_CAR <= Count_CAR + 4'b0001;
NS = Correct_password;
end
else
NS = Incorrect_password;
end
end
Incorrect_password: begin
if(PASSWORD==4'b1011)
begin
//Count_CAR <= Count_CAR + 4'b0001;
NS = Correct_password;
end
else
NS = Incorrect_password;
end
Correct_password: begin
if(Entrance==1 && Exit == 1) begin
NS = End;
//totalcars <= totalcars + 4'b0001;
end
else if(Exit ==1) begin
NS = Initial_State;
//Count_CAR <= Count_CAR + 4'b0001;
end
else
begin
//Count_CAR <= Count_CAR + 4'b0001;
NS = Correct_password;
end
end
End: begin
if(PASSWORD==4'b1011)
begin
//Count_CAR <= Count_CAR + 4'b0001;
NS = Correct_password;
end
else
NS = End;
end
default: NS = Initial_State;
endcase
end

always @(posedge CLOCK) begin
case(CS)
Initial_State: begin
GREEN_tmp = 1'b0;
RED_tmp = 1'b0;
INDICATOR = 3'b000;
end
HOLD: begin
GREEN_tmp = 1'b0;
RED_tmp = 1'b1;
INDICATOR = 3'b001;
end
Incorrect_password: begin
GREEN_tmp = 1'b0;
RED_tmp = ~RED_tmp;
INDICATOR = 3'b010;
end
Correct_password: begin
GREEN_tmp = ~GREEN_tmp;
RED_tmp = 1'b0;
INDICATOR = 3'b011;
end
End: begin
GREEN_tmp = 1'b0;
RED_tmp = ~RED_tmp;
INDICATOR = 3'b100;
end
endcase
end
assign Red = RED_tmp  ;
assign Green = GREEN_tmp;
//begin
//assign Count_CAR[3] = totalcars[3];
//assign Count_CAR[2] = totalcars[2];
//assign Count_CAR[1] = totalcars[1];
//assign Count_CAR[0] = totalcars[0];
//end
//Seven_segment_LED_Display_Controller g1(Count_CAR);
endmodule
