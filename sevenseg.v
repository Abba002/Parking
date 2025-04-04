`timescale 1ps/1ps
module sevenseg(
    input [3:0] display,
    output reg [6:0] seg
);

always @(*) begin
    case (display)
        0: seg = 7'b0111000; //l
        1: seg = 7'b1000001; //u
        2: seg = 7'b1110001; //f
        3: seg = 7'b0000001;//o
        4: seg = 7'b0011000;//p
        5: seg = 7'b0110000;//e
        6: seg = 7'b1101010;//n
    endcase
    
end
endmodule