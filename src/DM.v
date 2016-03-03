`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:00:36 03/03/2016 
// Design Name: 
// Module Name:    DM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`include "define.v"

module DM (
	input wire [7:0] addr,
	output wire [15:0] dout,
	input wire [15:0] din,
	input wire we,
	input wire clk,
	input wire reset
    );

reg [15:0] mem [9:0];

always @ (posedge clk or posedge reset) begin
	if (reset) begin
		mem [0] <= 16'h0127;
		mem [1] <= 16'h0541;
		mem [2] <= 16'h0059;
		mem [3] <= 16'h00aa;
		mem [4] <= 16'h0102;
		mem [5] <= 16'h0048;
		mem [6] <= 16'h0058;
		mem [7] <= 16'h017e;
		mem [8] <= 16'h00c3;
		mem [9] <= 16'h00cd;
	end
	else if (we) begin
		mem[addr] <= din;
	end
end

assign dout = mem[addr];

endmodule