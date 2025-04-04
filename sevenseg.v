`timescale 1ps/1ps
module sevenseg(
    input [3:0] display,
    output reg [6:0] seg
);

always @(*) begin
    case (display)
        0: seg = 7'b0001110; //f 
        1: seg = 7'b1000001; //u
        2: seg = 7'b1000111; //l 
        3: seg = 7'b1000000;//o 
        4: seg = 7'b0001100;//p 
        5: seg = 7'b0000110;//e 
        6: seg = 7'b0101011;//n 
    endcase
    
end
endmodule