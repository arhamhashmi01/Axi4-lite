`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 05:55:37 PM
// Design Name: 
// Module Name: axi4_lite_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi4_lite_top_tb();

    logic           ACLK_tb;
    logic           ARESETN_tb;
    logic           read_s_tb;
    logic           write_s_tb;
    logic [31:0]    address_tb;
    logic [31:0]    W_data_tb;
    
    axi4_lite_top u_axi4_lite_top0(
        .ACLK(ACLK_tb),
        .ARESETN(ARESETN_tb),
        .read_s(read_s_tb),
        .write_s(write_s_tb),
        .address(address_tb),
        .W_data(W_data_tb)
    );

    initial begin
        #5;
        ACLK_tb=0;
        ARESETN_tb=0;
        read_s_tb=0;  
        write_s_tb=0;                           
        #5;
        ACLK_tb=1;
        ARESETN_tb=1;
        write_s_tb=0;
        #15;
        write_s_tb=1;
        address_tb = 5;
        W_data_tb = 4;
        
        //read_s_tb=1;
        #10;
        write_s_tb=0;
        #20;
        write_s_tb=0;
        read_s_tb=0;
        #30;
        read_s_tb=1;
        address_tb = 5;
        #10;
        read_s_tb=0;
        #40;
        $finish;            
    end
    
    always begin
        #5 ACLK_tb = ~ACLK_tb;
    end
endmodule
