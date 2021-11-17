//Smart Car Parking System
//Tanuj Kumar 2020csb1134
//Jatin 2020csb1090
 



//Verilog Code for Car parking System 
module CAR_Parking_System( 
 input RESET,//1 bit input for resetting the car parking system 
 input CLOCK,//Clock as continuous input of 1 bit 
 input Entrance,//1 bit Entrance value asking for entering the system
 input Exit, // 1 bit Exit value asking for exiting the system 
 input [1:0] P1, // 2 bit password input 1
 input [1:0] P2, // 2 bit password input 2
 output wire Yellow,
 output wire Blue,
 output reg [6:0] H1,//These 7 bits output H1 and H2 are used for showing 7 segment display of five states
 output reg [6:0] H2
    );


    //Five States
 parameter Correct_password = 3'b011;
 parameter Incorrect_password = 3'b010;
 parameter Initial_State = 3'b000;
 parameter HOLD = 3'b001;
 parameter End = 3'b100;
 //In this code we are designing 4 always block which are running independently 

 // And the code is based on Moore FSM as output only depends on the current state
 reg[2:0] CS;//CS as Current State 
 reg[2:0] NS;//NS as Next State 
 reg[31:0] WC;//WC as wait counter 
 reg BLUE_tmp,YELLOW_tmp;


 
 
 
 // Next State
 always @(negedge RESET or posedge CLOCK)//Asynchronus operation which means it depends on both CLOCK and RESET
 begin
 if(~RESET) 
 CS = Initial_State;
 else
 CS =NS;
 end


 
 
 
 // Wait counter 
 //It will wait for correct password if this state is "HOLD"
 always @(negedge RESET or posedge CLOCK)//Asynchronus operation which means it depends on both CLOCK and RESET
 begin
 if(~RESET) 
 WC <= 0;//Non Blocking Assignment
 else if(CS==HOLD)//Checking logical equality 
 WC <= WC + 1;
 else 
 WC <= 0;
 end
 

 
 
 
 //Now left two more always block 

 
 //One for changing state in continuity and will consider current state value in case loop

 
 //Second for Synchronised operation which only considers positive edge of CLOCK and will consider current state value in case loop

 
