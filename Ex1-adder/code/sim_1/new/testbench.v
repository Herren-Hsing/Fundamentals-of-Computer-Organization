`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module testbench();
    reg[31:0] op1,op2;
    reg op;
    wire[31:0] sum;
    wire flag;
    //���ź�
    adder32 uut(op1,op2,op,sum,flag);
    initial //����c++��Ĺ��캯�� ִֻ��һ��
    begin 
        op1 = 32'b0;op2 = 32'b0; op = 32'b0;
    end
    //always���Ժ����ź����У�#3�ӳ�����ʱ�䵥λ
    //$random����32λ�����
    always #3 op1 = $random;
    always #5 op2 = $random;
    always #7 op = $random % 2'b1_0;//ȡ���λ
endmodule