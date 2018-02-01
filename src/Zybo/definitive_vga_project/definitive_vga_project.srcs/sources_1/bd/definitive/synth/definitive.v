//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
//Date        : Thu Feb  1 12:39:20 2018
//Host        : Promero running 64-bit major release  (build 9200)
//Command     : generate_target definitive.bd
//Design      : definitive
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "definitive,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=definitive,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_ps7_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "definitive.hwdef" *) 
module definitive
   (BLUE_O,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    GREEN_O,
    HSYNC_O,
    RED_O,
    VSYNC_O,
    button_debounce,
    led_config_finished,
    ov7670_d,
    ov7670_href,
    ov7670_pclk,
    ov7670_pwdn,
    ov7670_reset,
    ov7670_sioc,
    ov7670_siod,
    ov7670_vsync,
    ov7670_xclk);
  output [4:0]BLUE_O;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  output [5:0]GREEN_O;
  output HSYNC_O;
  output [4:0]RED_O;
  output VSYNC_O;
  input button_debounce;
  output led_config_finished;
  input [7:0]ov7670_d;
  input ov7670_href;
  input ov7670_pclk;
  output ov7670_pwdn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.OV7670_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.OV7670_RESET, POLARITY ACTIVE_LOW" *) output ov7670_reset;
  output ov7670_sioc;
  inout ov7670_siod;
  input ov7670_vsync;
  output ov7670_xclk;

  wire Net;
  wire [11:0]blk_mem_gen_0_doutb;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire [7:0]d_0_1;
  wire debounce_0_o;
  wire [0:0]ground_dout;
  wire href_0_1;
  wire i_0_1;
  wire [17:0]ov7670_capture_0_addr;
  wire [11:0]ov7670_capture_0_dout;
  wire ov7670_capture_0_we;
  wire ov7670_controller_0_config_finished;
  wire ov7670_controller_0_pwdn;
  wire ov7670_controller_0_reset;
  wire ov7670_controller_0_sioc;
  wire ov7670_controller_0_xclk;
  wire [17:0]ov7670_vga_0_frame_addr;
  wire [4:0]ov7670_vga_0_vga_blue;
  wire [5:0]ov7670_vga_0_vga_green;
  wire ov7670_vga_0_vga_hsync;
  wire [4:0]ov7670_vga_0_vga_red;
  wire ov7670_vga_0_vga_vsync;
  wire pclk_0_1;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire vsync_0_1;

  assign BLUE_O[4:0] = ov7670_vga_0_vga_blue;
  assign GREEN_O[5:0] = ov7670_vga_0_vga_green;
  assign HSYNC_O = ov7670_vga_0_vga_hsync;
  assign RED_O[4:0] = ov7670_vga_0_vga_red;
  assign VSYNC_O = ov7670_vga_0_vga_vsync;
  assign d_0_1 = ov7670_d[7:0];
  assign href_0_1 = ov7670_href;
  assign i_0_1 = button_debounce;
  assign led_config_finished = ov7670_controller_0_config_finished;
  assign ov7670_pwdn = ov7670_controller_0_pwdn;
  assign ov7670_reset = ov7670_controller_0_reset;
  assign ov7670_sioc = ov7670_controller_0_sioc;
  assign ov7670_xclk = ov7670_controller_0_xclk;
  assign pclk_0_1 = ov7670_pclk;
  assign vsync_0_1 = ov7670_vsync;
  definitive_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(ov7670_capture_0_addr),
        .addrb(ov7670_vga_0_frame_addr),
        .clka(pclk_0_1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(ov7670_capture_0_dout),
        .doutb(blk_mem_gen_0_doutb),
        .enb(1'b0),
        .wea(ov7670_capture_0_we));
  definitive_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(processing_system7_0_FCLK_CLK0),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .reset(1'b0));
  definitive_debounce_0_0 debounce_0
       (.clk(clk_wiz_0_clk_out1),
        .i(i_0_1),
        .o(debounce_0_o));
  definitive_xlconstant_0_0 ground
       (.dout(ground_dout));
  definitive_ov7670_capture_0_0 ov7670_capture_0
       (.addr(ov7670_capture_0_addr),
        .d(d_0_1),
        .dout(ov7670_capture_0_dout),
        .href(href_0_1),
        .pclk(pclk_0_1),
        .vsync(vsync_0_1),
        .we(ov7670_capture_0_we));
  definitive_ov7670_controller_0_0 ov7670_controller_0
       (.clk(clk_wiz_0_clk_out1),
        .config_finished(ov7670_controller_0_config_finished),
        .pwdn(ov7670_controller_0_pwdn),
        .resend(debounce_0_o),
        .reset(ov7670_controller_0_reset),
        .sioc(ov7670_controller_0_sioc),
        .siod(ov7670_siod),
        .xclk(ov7670_controller_0_xclk));
  definitive_ov7670_vga_0_0 ov7670_vga_0
       (.clk25(clk_wiz_0_clk_out2),
        .frame_addr(ov7670_vga_0_frame_addr),
        .frame_pixel(blk_mem_gen_0_doutb),
        .vga_blue(ov7670_vga_0_vga_blue),
        .vga_green(ov7670_vga_0_vga_green),
        .vga_hsync(ov7670_vga_0_vga_hsync),
        .vga_red(ov7670_vga_0_vga_red),
        .vga_vsync(ov7670_vga_0_vga_vsync));
  definitive_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .ENET0_MDIO_I(1'b0),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .I2C0_SCL_I(1'b0),
        .I2C0_SDA_I(1'b0),
        .MIO(FIXED_IO_mio[53:0]),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .SDIO0_WP(ground_dout),
        .USB0_VBUS_PWRFAULT(1'b0));
endmodule
