-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Thu Feb  1 12:05:27 2018
-- Host        : Promero running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/user2/Documents/Vivado/definitive_vga_project/definitive_vga_project.srcs/sources_1/bd/definitive/ip/definitive_ov7670_vga_0_0/definitive_ov7670_vga_0_0_stub.vhdl
-- Design      : definitive_ov7670_vga_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity definitive_ov7670_vga_0_0 is
  Port ( 
    clk25 : in STD_LOGIC;
    vga_red : out STD_LOGIC_VECTOR ( 4 downto 0 );
    vga_green : out STD_LOGIC_VECTOR ( 5 downto 0 );
    vga_blue : out STD_LOGIC_VECTOR ( 4 downto 0 );
    vga_hsync : out STD_LOGIC;
    vga_vsync : out STD_LOGIC;
    frame_addr : out STD_LOGIC_VECTOR ( 17 downto 0 );
    frame_pixel : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end definitive_ov7670_vga_0_0;

architecture stub of definitive_ov7670_vga_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk25,vga_red[4:0],vga_green[5:0],vga_blue[4:0],vga_hsync,vga_vsync,frame_addr[17:0],frame_pixel[11:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ov7670_vga,Vivado 2017.3";
begin
end;
