-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Thu Feb  1 11:57:27 2018
-- Host        : Promero running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/user2/Documents/Vivado/definitive_vga_project/definitive_vga_project.srcs/sources_1/bd/definitive/ip/definitive_debounce_0_0/definitive_debounce_0_0_stub.vhdl
-- Design      : definitive_debounce_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity definitive_debounce_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    i : in STD_LOGIC;
    o : out STD_LOGIC
  );

end definitive_debounce_0_0;

architecture stub of definitive_debounce_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,i,o";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "debounce,Vivado 2017.3";
begin
end;
