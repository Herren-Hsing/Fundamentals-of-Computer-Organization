`timescale 1ns / 1ps
module regfile(
    input             clk,
    input      [3:0]  wen,//写使能
    input      [1:0]  readwen,//读使能
    input      [4 :0] raddr1,
    input      [4 :0] raddr2,
    input      [4 :0] waddr,
    input      [31:0] wdata,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2,
    input      [4 :0] test_addr,
    output reg [31:0] test_data
    );
    reg [31:0] rf[31:0];
     
    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clock
    // register 0 hardwired to 0

    always @(posedge clk)
    begin
        if (wen[0]) // 如果wen[0]为1，写入最低字节的值
            rf[waddr][7:0] <= wdata[7:0];
		else 
			rf[waddr][7:0] <= 8'd0;
	  	if (wen[1]) // 如果wen[1]为1，写入次低字节的值
			rf[waddr][15:8] <= wdata[15:8];
		else
			rf[waddr][15:8] <= 8'd0;
 	  	if (wen[2]) // 如果wen[2]为1，写入次高字节的值
			rf[waddr][23:16] <= wdata[23:16];
		else
			rf[waddr][23:16] <= 8'd0;
        if (wen[3]) // 如果wen[3]为1，写入最高字节的值
			rf[waddr][31:24] <= wdata[31:24];
		else
			rf[waddr][31:24] <= 8'd0;
    end
     
    // 读端口1
    always @(*)
        begin
            if(readwen[0])// 如果readwen[0]为1，读后16位
            	rdata1[15:0] <= rf[raddr1][15:0];
            else  
                rdata1[15:0] <= 16'd0;
            if(readwen[1])// 如果readwen[1]为1，读前16位
                rdata1[31:16] <= rf[raddr1][31:16];
            else  
                rdata1[31:16] <= 16'd0;
        end
    // 读端口2
    always @(*)
            begin
                if(readwen[0])// 如果readwen[0]为1，读后16位
                    rdata2[15:0] <= rf[raddr2][15:0];
                else  
                    rdata2[15:0] <= 16'd0;
                if(readwen[1])// 如果readwen[1]为1，读前16位
                    rdata2[31:16] <= rf[raddr2][31:16];
                else  
                    rdata2[31:16] <= 16'd0;
            end
   
     //调试端口，读出寄存器值显示在触摸屏上
    always @(*)
    begin
        case (test_addr)
            5'd1 : test_data <= rf[1 ];
            5'd2 : test_data <= rf[2 ];
            5'd3 : test_data <= rf[3 ];
            5'd4 : test_data <= rf[4 ];
            5'd5 : test_data <= rf[5 ];
            5'd6 : test_data <= rf[6 ];
            5'd7 : test_data <= rf[7 ];
            5'd8 : test_data <= rf[8 ];
            5'd9 : test_data <= rf[9 ];
            5'd10: test_data <= rf[10];
            5'd11: test_data <= rf[11];
            5'd12: test_data <= rf[12];
            5'd13: test_data <= rf[13];
            5'd14: test_data <= rf[14];
            5'd15: test_data <= rf[15];
            5'd16: test_data <= rf[16];
            5'd17: test_data <= rf[17];
            5'd18: test_data <= rf[18];
            5'd19: test_data <= rf[19];
            5'd20: test_data <= rf[20];
            5'd21: test_data <= rf[21];
            5'd22: test_data <= rf[22];
            5'd23: test_data <= rf[23];
            5'd24: test_data <= rf[24];
            5'd25: test_data <= rf[25];
            5'd26: test_data <= rf[26];
            5'd27: test_data <= rf[27];
            5'd28: test_data <= rf[28];
            5'd29: test_data <= rf[29];
            5'd30: test_data <= rf[30];
            5'd31: test_data <= rf[31];
            default : test_data <= 32'd0;
        endcase
    end
endmodule
