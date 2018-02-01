// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Thu Feb  1 11:57:27 2018
// Host        : Promero running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/user2/Documents/Vivado/definitive_vga_project/definitive_vga_project.srcs/sources_1/bd/definitive/ip/definitive_debounce_0_0/definitive_debounce_0_0_stub.v
// Design      : definitive_debounce_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "debounce,Vivado 2017.3" *)
module definitive_debounce_0_0(clk, i, o)
/* synthesis syn_black_box black_box_pad_pin="clk,i,o" */;
  input clk;
  input i;
  output o;
endmodule
