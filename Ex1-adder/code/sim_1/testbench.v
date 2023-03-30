`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module testbench();
    reg[31:0] op1,op2;
    reg op;
    wire[31:0] sum;
    wire flag;
    //接信号
    adder32 uut(op1,op2,op,sum,flag);
    initial //类似c++里的构造函数 只执行一次
    begin 
        op1 = 32'b0;op2 = 32'b0; op = 32'b0;
    end
    //always语句对后面信号敏感，#3延迟三个时间单位
    //$random生成32位随机数
    always #3 op1 = $random;
    always #5 op2 = $random;
    always #7 op = $random % 2'b1_0;//取最低位
endmodule