----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Captures the pixels coming from the OV760 camera and 
--              Stores them in block RAM
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ov7670_capture is
    Port ( pclk  : in   STD_LOGIC;
           vsync : in   STD_LOGIC; --
           href  : in   STD_LOGIC; --Indica que hay datos
           d     : in   STD_LOGIC_VECTOR (7 downto 0);
           addr  : out  STD_LOGIC_VECTOR (14 downto 0);
           dout  : out  STD_LOGIC_VECTOR (7 downto 0);
           we    : out  STD_LOGIC);
end ov7670_capture;
--640*480
--656*488
architecture Behavioral of ov7670_capture is
   signal d_latch    : std_logic_vector(7 downto 0)  := (others => '0');
   signal href_last  : std_logic;
   signal cnt        : std_logic_vector(1 downto 0)  := (others => '0');
   signal hold_red   : std_logic_vector(2 downto 0)  := (others => '0');
   signal hold_green : std_logic_vector(2 downto 0)  := (others => '0');
   signal address    : STD_LOGIC_VECTOR(14 downto 0) := (others => '0');
   
   --signal pclk_s : std_logic;
   signal vsync_s : std_logic;
   signal href_s : std_logic;
   signal d_s : std_logic_vector(7 downto 0);
   
   signal cnt_s : integer range 0 to 32768:=0;
   signal flag : std_logic;
   
begin
   --Enntradas
   href_last <= href;
   --Salidas
   addr <= address;
   --dout <= hold_red & hold_green & d_latch(4 downto 3); -- d(4:3) is blue;         
   dout <= d_s;
   
	hold_green  <= d_latch(7 downto 5);  
	hold_red <= d_latch(2 downto 0);
	d_latch <= d;
         
--	process(pclk)
--	begin
--	if (pclk'event and pclk='1') then
--		if cnt_s = 32768 then
--			cnt_s <= 0;
--			vsync_s <= '1';
--		else
--			vsync_s <= '0';
--			cnt_s <= cnt_s + 1;
--			if flag = '1' then
--				flag <= not flag;
--				d_s <="00000000";
--			else
--				flag <= not flag;
--				d_s <= "11111111";
--			end if;
--		end if;
--   end if;
--   end process;
   
   process(pclk) --Envío de pixel
   begin
      if rising_edge(pclk) then
         we   <= '0';
         if vsync_s = '1' then --Fin de frame ?¿
            address <= (others => '1');
            href_last <= '0';
            cnt <= "00";
         else       
            if href_last = '1' and address /= "100101011111111" then --Si hay datos y no llegamos al tope (19200 palabras)
               if cnt = "11"  then
                 address <= std_logic_vector(unsigned(address)+1);
               end if;
               if cnt = "01" then --Segmentación de cauce - Tarda un
                  we   <='1';
               end if;
               cnt <= std_logic_vector(unsigned(cnt)+1);
            end if;
         end if;
         
      
      end if;
   end process;
end Behavioral;