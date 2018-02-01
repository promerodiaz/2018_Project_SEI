library ieee;
use  ieee.std_logic_1164.all;
--use  ieee.std_logic_arith.all;
use  ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity vga is
	port(	
			clock_25mhz		: in std_logic;
			vga_red			: out std_logic_vector (2 downto 0);
			vga_green		: out std_logic_vector (2 downto 0);
			vga_blue		: out std_logic_vector (2 downto 1);
			vga_hs			: out std_logic;
			vga_vs			: out std_logic;
			vga_blank		: out std_logic;
			vga_clk			: out std_logic;
			frame_pixel 	: in  std_logic_vector(7 downto 0); --colores 
			fram_addr		: out std_logic_vector(14 downto 0); --dirección de memoria
			pixel_row		: out std_logic_vector(9 downto 0); --?¿
			pixel_column	: out std_logic_vector(9 downto 0) --?¿
	);		
			
end vga;

architecture a of vga is
	signal horiz_sync, vert_sync : std_logic;
	signal video_on, video_on_v, video_on_h : std_logic;
	signal h_count, v_count :std_logic_vector(9 downto 0);
	signal address : unsigned(14 downto 0);
	signal tmp : unsigned(29 downto 0);

begin
	--640x480

	--fram_addr <= std_logic_vector(address);
	
	--Es la posición de un pixel en todo momento 160*vcount + hcoutn
	-- /4 porque la resolución del monitor es mayor
	--rellenamos con 0 para tener los mismos tamaños
	tmp <= 40*unsigned("00000" & v_count); --160/4=40
	address <= tmp(14 downto 0) + unsigned("00000" & h_count)/4;

-- video_on is high only when rgb data is displayed
video_on <= video_on_h and video_on_v;
vga_clk <= clock_25mhz;

	process
	begin
		wait until(clock_25mhz'event) and (clock_25mhz='1');
		--generate horizontal and vertical timing signals for video signal
		-- h_count counts pixels (640 + extra time for sync signals)
		-- 
		--  horiz_sync  ------------------------------------__________--------
		--  h_count       0                640             659       755    799
		--
		if (h_count = 799) then
			h_count <= "0000000000";
		else
			h_count <= h_count + 1;
		end if;

		--generate horizontal sync signal using h_count
		if (h_count <= 755) and (h_count >= 659) then
			horiz_sync <= '0';
		else
			horiz_sync <= '1';
		end if;

		--v_count counts rows of pixels (480 + extra time for sync signals)
		--  
		--  vert_sync      -----------------------------------------------_______------------
		--  v_count         0                                      480    493-494          524
		--
		if (v_count >= 524) and (h_count >= 699) then
			v_count <= "0000000000";
		elsif (h_count = 699) then
			v_count <= v_count + 1;
		end if;

		-- generate vertical sync signal using v_count
		if (v_count <= 494) and (v_count >= 493) then
			vert_sync <= '0';
		else
			vert_sync <= '1';
		end if;

		-- generate video on screen signals for pixel data
		if (h_count <= 639) then
			video_on_h <= '1';
			pixel_column <= h_count;
		else
			video_on_h <= '0';
		end if;

		if (v_count <= 479) then
			video_on_v <= '1';
			pixel_row <= v_count;
		else
			video_on_v <= '0';
		end if;

		-- put all video signals through dffs to elminate any delays that cause a blurry image
		vga_red <= frame_pixel(7 downto 5) ;--and video_on; 
		vga_green <= frame_pixel(4 downto 2) ;--and video_on;
		vga_blue <=  frame_pixel(2 downto 1) ;--and video_on;
		--vga_red <= "111" ;--and video_on; 
		--vga_green <= "111" ;--and video_on;
		--vga_blue <=  "11";--and video_on;
		vga_hs 	<= horiz_sync;
		vga_vs 	<= vert_sync;
		vga_blank <= video_on;
	end process;
		
end a;





--------------------------------------------------------------------------------
 
-- description: generate analog 800x600 vga, double-doublescanned from 19200 bytes of ram

--------------------------------------------------------------------------------
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity vga is
--	port(
--		clock_25mhz       : in  std_logic;
--		--señales rgb vga. bits más significativos
--		vga_red     : out std_logic_vector(2 downto 0);
--		vga_green   : out std_logic_vector(2 downto 0);
--		vga_blue    : out std_logic_vector(2 downto 1);
--		--sincronización horizontal y vertical de vga
--		vga_hs   : out std_logic;
--		vga_vs   : out std_logic;
--		--señales blank y clk del chip dac
--		vga_blank   : out std_logic;
--		vga_clk	  : out std_logic;
--		--dirección de memoria que almacena el pixel
--		fram_addr  : out std_logic_vector(14 downto 0);
--		--byte con la informaicón del pixel
--		frame_pixel : in  std_logic_vector(7 downto 0);
--		pixel_row		:	out std_logic_vector(9 downto 0); --?¿
--		pixel_column	:	out	std_logic_vector(9 downto 0) --?¿
--		);
--end vga;
--
--architecture behavioral of vga is
--   
--	component div_frec
--		port (
--			fin   : in std_logic;
--			fout  : out std_logic
--			);
--	end component;
--	-- timing constants
--	constant hrez       : natural := 800; --800*600
--	constant vrez       : natural := 600;
--
--	constant hmaxcount  : natural := 1056;
--	constant hstartsync : natural := 840;
--	constant hendsync   : natural := 968;
--	constant vmaxcount  : natural := 628;
--	constant vstartsync : natural := 601;
--	constant vendsync   : natural := 605;
--	constant hsync_active : std_logic := '1';
--	constant vsync_active : std_logic := '1';	
--
--   signal hcounter : unsigned(10 downto 0) := (others => '0');
--   signal vcounter : unsigned(9 downto 0) := (others => '0');
--   signal address : unsigned(16 downto 0) := (others => '0');
--   signal s_blank : std_logic := '1';
--
--begin
--
--	vga_blank <= s_blank;
--
--	divdac : div_frec port map(
--	
--		fin   => clock_25mhz,
--		fout  => vga_clk
--	);
--	
--	
--   fram_addr <= std_logic_vector(address(16 downto 2));
--   
--   process(clock_25mhz)
--   begin
--      if rising_edge(clock_25mhz) then
--         -- count the lines and rows      
--         if hcounter = hmaxcount-1 then
--            hcounter <= (others => '0');
--            if vcounter = vmaxcount-1 then
--               vcounter <= (others => '0');
--            else
--               vcounter <= vcounter+1;
--            end if;
--         else
--            hcounter <= hcounter+1;
--         end if;
--
--         if s_blank = '0' then
--            vga_red   <= frame_pixel(7 downto 5);
--            vga_green <= frame_pixel(4 downto 2);
--            vga_blue  <= frame_pixel(1 downto 0);
--         else
--            vga_red   <= (others => '0');
--            vga_green <= (others => '0');
--            vga_blue  <= (others => '0');
--         end if;
--   
--         if vcounter  >= vrez then --?¿
--            address <= (others => '0');
--            s_blank <= '1';
--         else 
--            if hcounter  >= 80 and hcounter  < 720 then
--               s_blank <= '0';
--               if hcounter = 719 then
--                  if vcounter(1 downto 0) /= "11" then
--                     address <= address - 639;
--                  else
--                      address <= address+1;
--                  end if;
--               else
--                  address <= address+1;
--               end if;
--            else
--               s_blank <= '1';
--            end if;
--         end if;
--   
--         -- are we in the hsync pulse? (one has been added to include frame_buffer_latency)
--         if hcounter > hstartsync and hcounter <= hendsync then
--            vga_hs <= hsync_active;
--         else
--            vga_hs <= not hsync_active;
--         end if;
--
--         -- are we in the vsync pulse?
--         if vcounter >= vstartsync and vcounter < vendsync then
--            vga_vs <= vsync_active;
--         else
--            vga_vs <= not vsync_active;
--         end if;
--      end if;
--   end process;
--end behavioral;