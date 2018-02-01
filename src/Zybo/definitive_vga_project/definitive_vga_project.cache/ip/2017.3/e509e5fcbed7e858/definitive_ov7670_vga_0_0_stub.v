// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Thu Feb  1 12:05:27 2018
// Host        : Promero running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ definitive_ov7670_vga_0_0_stub.v
// Design      : definitive_ov7670_vga_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ov7670_vga,Vivado 2017.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk25, vga_red, vga_green, vga_blue, vga_hsync, 
  vga_vsync, frame_addr, frame_pixel)
/* synthesis syn_black_box black_box_pad_pin="clk25,vga_red[4:0],vga_green[5:0],vga_blue[4:0],vga_hsync,vga_vsync,frame_addr[17:0],frame_pixel[11:0]" */;
  input clk25;
  output [4:0]vga_red;
  output [5:0]vga_green;
  output [4:0]vga_blue;
  output vga_hsync;
  output vga_vsync;
  output [17:0]frame_addr;
  input [11:0]frame_pixel;
endmodule
