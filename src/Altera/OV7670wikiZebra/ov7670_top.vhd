----------------------------------------------------------------------------------
-- description: top level for the ov7670 camera project.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity ov7670_top is
	port(
		clk50_top    : in std_logic;
--		ov7670_d     : in std_logic_vector(7 downto 0);
--		ov7670_siod  : inout std_logic;
--		ov7670_vsync : in std_logic;
--		ov7670_href  : in std_logic;
--		ov7670_pclk  : in std_logic;
--		ov7670_xclk  : out std_logic;
--		ov7670_reset : out std_logic;
--		ov7670_pwdn  : out std_logic;
--		ov7670_sioc  : out std_logic;
		
--		led          : out   std_logic;
--		btn          : in    std_logic;
--		SegDigit1, SegDigit2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
--		
		vga_red      : out std_logic_vector(2 downto 0);
		vga_green    : out std_logic_vector(2 downto 0);
		vga_blue     : out std_logic_vector(2 downto 1);
		vga_hsync    : out std_logic;
		vga_vsync    : out std_logic;
		vga_dacclk   : out std_logic;
		vga_blank	 : out std_logic
		
		
		
	);
end ov7670_top;


architecture behavioral of ov7670_top is

	COMPONENT dec_7seg is 
	PORT(hex_digit						: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		 segment_a, segment_b, segment_c, segment_d, segment_e, 
		 segment_f, segment_g 			: OUT std_logic);
	END COMPONENT;

	component maquinaE
		port(
			clk	: in std_logic;
			rst	: in std_logic;
			wEnable	: out std_logic;
			wCLK		: out std_logic;
			wAddress	: out std_logic_vector(14 downto 0);
			wData      : out std_logic_vector(7 downto 0)
		);
	end component;

	component debounce
		port(
			clk : in std_logic;
			i : in std_logic;          
			o : out std_logic
		);
	end component;
	
	component ov7670_controller
		port(
			clk   : in    std_logic;    
			resend: in    std_logic;    
			config_finished : out std_logic;
			siod  : inout std_logic;      
			sioc  : out   std_logic;
			reset : out   std_logic;
			pwdn  : out   std_logic;
			xclk  : out   std_logic
		);
	end component;

	component frame_buffer
		port(
			wrclock  	: in  std_logic;
			rdclock  	: in  std_logic;
			wren	   	: in  std_logic;
			wraddress 	: in  std_logic_vector(14 downto 0);
			rdaddress 	: in  std_logic_vector(14 downto 0);
			data	  	: in  std_logic_vector(7 downto 0);
			q			: out std_logic_vector(7 downto 0)
		);
	end component;
   
	component codebutton --
		port(
			entrada   : in std_logic;
			colorOut  : out std_logic_vector(7 downto 0)
		);
	end component;

	component ov7670_capture
		port(
			pclk : in std_logic;
			vsync : in std_logic;
			href  : in std_logic;
			d     : in std_logic_vector(7 downto 0);          
			addr  : out std_logic_vector(14 downto 0);
			dout  : out std_logic_vector(7 downto 0);
			we    : out std_logic
		);
	end component;
   
	 component vga
		port(
			clock_25mhz		: in std_logic;
			vga_red			: out std_logic_vector (2 downto 0);
			vga_green		: out std_logic_vector (2 downto 0);
			vga_blue		: out std_logic_vector (2 downto 1);
			vga_hs			: out std_logic;
			vga_vs			: out std_logic;
			vga_blank		: out std_logic;
			vga_clk			: out std_logic;
			frame_pixel 	: in  std_logic_vector(7 downto 0);
			fram_addr		: out std_logic_vector(14 downto 0);
			pixel_row		:	out std_logic_vector(9 downto 0);
			pixel_column	:	out	std_logic_vector(9 downto 0)
		);
	end component;
   
	component div_frec
		port (
			fin   : in std_logic;
			fout  : out std_logic
		);
	end component;
	
	component div_frecB
		port (
			fin   : in std_logic;
			fout  : out std_logic
		);
	end component;
	
	signal frame_addr_s  : std_logic_vector(14 downto 0);
	signal frame_pixel_s : std_logic_vector(7 downto 0);
	signal capture_addr_s  	: std_logic_vector(14 downto 0);
	signal capture_data_s  	: std_logic_vector(7 downto 0);
	signal capture_we_s    	: std_logic; -- 0 downto 0
	signal resend_s 		  	: std_logic;
	signal config_finished_s : std_logic;
	
	signal rojo_s :std_logic_vector(2 downto 0):="101";
	signal verde_s: std_logic_vector(2 downto 0):="010";
	signal azul_s: std_logic_vector(1 downto 0):="11";
	signal clk25_s: std_logic;
	signal pushBotton_s: std_logic;
	signal colorOut_s : std_logic_vector(7 downto 0);
	
	signal reset_s : std_logic := '0';
	
	signal wren_s : std_logic;
	signal wrclock_s : std_logic;
	signal wraddress_s : std_logic_vector(14 downto 0);
	signal data_s : std_logic_vector(7 downto 0);
	
	signal address_s :std_logic_vector(14 downto 0);
	
begin

	--led <= "0000000" & config_finished;
	--led <= ov7670_href;

--	selector: codebutton port map(
--		entrada => pushBotton_s
--		--colorout => colorOut_s
--	);

	divisorfrecuencia : div_frec port map(
		fin   => clk50_top,
		fout  => clk25_s
	);
			
	
--	btn_debounce: debounce port map(
--		clk => clk50_top,
--		i   => btn,
--		o   => pushBotton_s
--	);

	inst_vga: vga port map(
		clock_25mhz => clk25_s,
		vga_red	=> vga_red,		
		vga_green => vga_green,		
		vga_blue => vga_blue,		
		vga_hs	=> vga_hsync,		
		vga_vs	=> vga_vsync,		
		vga_blank => vga_blank,	
		vga_clk	=> vga_dacclk,
		fram_addr => address_s,
		frame_pixel => colorOut_s
	);
	
		grabador: maquinaE port map(
		clk => clk50_top,
		rst => reset_s,
		wEnable => wren_s,
		wCLK => wrclock_s,
		wAddress => wraddress_s,
		wData => data_s
	);

	fb : frame_buffer port map (
		--wrclock		=> ov7670_pclk,
		wrclock		=> wrclock_s,
		--rdclock  	=> clk50_top,
		rdclock => clk25_s,
		--wren   		=> capture_we_s,
		wren => wren_s,
		--wraddress 	=> capture_addr_s,
		wraddress => wraddress_s,
		rdaddress 	=> address_s,
		--data  		=> capture_data_s,
		data => data_s,
		q => colorOut_s
	);
  
--	capture: ov7670_capture port map(
--		pclk  => ov7670_pclk,
--		vsync => ov7670_vsync,
--		href  => ov7670_href,
--		d     => ov7670_d,
--		addr  => capture_addr_s,
--		dout  => capture_data_s,
--		--we    => capture_we_s(0)
--		we    => capture_we_s
--	);
  
--	controller: ov7670_controller port map(
--		clk   => clk50_top,
--		sioc  => ov7670_sioc,
--		resend => resend_s,
--		config_finished => config_finished_s,
--		siod  => ov7670_siod,
--		pwdn  => ov7670_pwdn,
--		reset => ov7670_reset,
--		xclk  => ov7670_xclk
--	);
--	
--	divisorfrecuenciaPCLK : div_frecB port map(
--		fin   => ov7670_d(7),
--		fout  => led
--	);

end behavioral;
