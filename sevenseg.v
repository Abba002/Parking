`timescale 1ps/1ps
module (
    input [3:0] display,
    output reg [6:0] seg
);

always @(*) begin
    case (display)
        0: seg = 7'b1000111;//f
        1: seg = 7'b0111110;//u
        2: seg = 7'b0001110;//l
        3: seg = 7'b1111110;//o
        4: seg = 7'b1100111;//p
        5: seg = 7'b1001111;//e
        6: seg = 7'b0010101;//n
    endcase
    
end
endmodule