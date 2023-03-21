`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module adder32(
    input [31:0] op1,
    input [31:0] op2,
    input cin,
    output [31:0] res,
    output cout
    );
    wire c1,c2,c3;
    adder8 adder8_1(
        .ina(op1[7:0]),//.是例化端口名
        .inb(op2[7:0]),
        .inc(cin),
        .sum(res[7:0]),
        .outc(c1)
    );
    adder8 adder8_2(
        .ina(op1[15:8]),
        .inb(op2[15:8]),
        .inc(c1),
        .sum(res[15:8]),
        .outc(c2)
    );
    adder8 adder8_3(
        .ina(op1[23:16]),
        .inb(op2[23:16]),
        .inc(c2),
        .sum(res[23:16]),
        .outc(c3)
    );
    adder8 adder8_4(
        .ina(op1[31:24]),
        .inb(op2[31:24]),
        .inc(c3),
        .sum(res[31:24]),
        .outc(cout)
    );
endmodule