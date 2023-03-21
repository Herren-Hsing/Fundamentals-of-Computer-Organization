`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module adder8(
    input [7:0] ina,
    input [7:0] inb,
    input inc,
    output [7:0] sum,
    output outc
    );
    assign {outc,sum} = ina + inb + inc;
endmodule
