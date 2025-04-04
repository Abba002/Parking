`timescale 1ps/1ps
module parkingsystem (
    input clock,
    input [4:0] parkingslots, // these are the parking slots available
    output reg [4:0] parking_slots_available, //one led indicating if each car is parked or not
    output [6:0] seg,//seven seg display to show open or full
    output reg [3:0] an
);
reg [3:0] display;
sevenseg ss0(display,seg)//instantiate the seven seg module

wire slowclock_100Hz;
slowclock_100Hz sclk(clock,slowclock_100Hz)

reg [1:0] enable=0; // declaring the 4 enable for each segment

always @(parkingslots) begin
    case (parkingslots)
        5'd0:  parking_slots_available = 5'b11111;
        5'd1:  parking_slots_available = 5'b11110;
        5'd2:  parking_slots_available = 5'b11101;
        5'd3:  parking_slots_available = 5'b11100;
        5'd4:  parking_slots_available = 5'b11011;
        5'd5:  parking_slots_available = 5'b11010;
        5'd6:  parking_slots_available = 5'b11001;
        5'd7:  parking_slots_available = 5'b11000;
        5'd8:  parking_slots_available = 5'b10111;
        5'd9:  parking_slots_available = 5'b10110;
        5'd10: parking_slots_available = 5'b10101;
        5'd11: parking_slots_available = 5'b10100;
        5'd12: parking_slots_available = 5'b10011;
        5'd13: parking_slots_available = 5'b10010;
        5'd14: parking_slots_available = 5'b10001;
        5'd15: parking_slots_available = 5'b10000;
        5'd16: parking_slots_available = 5'b01111;
        5'd17: parking_slots_available = 5'b01110;
        5'd18: parking_slots_available = 5'b01101;
        5'd19: parking_slots_available = 5'b01100;
        5'd20: parking_slots_available = 5'b01011;
        5'd21: parking_slots_available = 5'b01010;
        5'd22: parking_slots_available = 5'b01001;
        5'd23: parking_slots_available = 5'b01000;
        5'd24: parking_slots_available = 5'b00111;
        5'd25: parking_slots_available = 5'b00110;
        5'd26: parking_slots_available = 5'b00101;
        5'd27: parking_slots_available = 5'b00100;
        5'd28: parking_slots_available = 5'b00011;
        5'd29: parking_slots_available = 5'b00010;
        5'd30: parking_slots_available = 5'b00001;
        5'd31: parking_slots_available = 5'b00000;
    endcase
end

always @(posedge slowclock_100Hz) begin
    enable = enable +1;
end

always @(posedge slowclock_100Hz ) begin // if all parking slots are occupied
    if (parkingslots[0] & parkingslots[1] & parkingslots[2] & parkingslots[3] & parkingslots[4]) begin

    case (enable)
        2'b00:
        begin
            display = 2; //L
            an = 4'b1110;
        end

        2'b01:
        begin
            display=2; //L
            an = 4'b1101;
        end

        2'b10:
        begin
        display=1;//U
        an = 4'b1011;
        end

        2'b11:
        begin
            display=0;//F
            an = 4'b0111;
        end
    endcase
    end
    else if ((parkingslots[0] & parkingslots[1] & parkingslots[2] & parkingslots[3] & parkingslots[4])!=1) begin
        case (enable)
        2'b00:
        begin
            display = 6; //N
            an = 4'b1110;
        end

        2'b01:
        begin
            display=5; //E
            an = 4'b1101;
        end

        2'b10:
        begin
        display=4; //P
        an = 4'b1011;
        end

        2'b11:
        begin
            display=3; //O
            an = 4'b0111;
        end

        endcase
        
    end
    
end

endmodule