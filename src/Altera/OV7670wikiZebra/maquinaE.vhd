
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maquinaE is
	port(clk	: in std_logic;
		 rst	: in std_logic;
		 wEnable	: out std_logic;
		 wCLK		: out std_logic;
		 wAddress	: out std_logic_vector(14 downto 0);
		 wData      : out std_logic_vector(7 downto 0)
		 );
end maquinaE;

architecture algoritmica of maquinaE is

	type estados is (e0,e1,e2,e3,e4,e5,e6,e7,e8,e9); --10 estados
	signal estado_act_s,estado_sig_s: estados;
	signal salida_sig_s: std_logic_vector(7 downto 0);
	--160*120 pixel es la resolución que podemos almacenar.
	signal cnt : integer range 0 to 32768:=0 ;--Número de palabras (15 bits)(100000000000000) 160*120 de resolución 
	signal flag : std_logic := '0';
begin

	wClK <= clk;
	wAddress <= std_logic_vector(to_unsigned(cnt, wAddress'length));
	
	zebra: process(rst,clk)
	begin
		if rst='1' then
			cnt <= 0;
		elsif (clk'event and  clk='1') then
			if cnt <= 32768 then
				wEnable <= '1';
				cnt <= cnt + 1;
				if flag = '1' then
					flag <= not flag;
					wData <="00000000";
				else
					flag <= not flag;
					wData <= "11111111";
				end if;
			end if;
		end if;		
	end process zebra;
		
end algoritmica;

		
		
		