library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity codeButton is
	port(
		entrada   : in std_logic;
		colorOut  : out std_logic_vector(7 downto 0)
		);
end codeButton;

architecture behavioral of codeButton is

signal cnt : unsigned (2 downto 0) := "000";

begin
		
	process(entrada,cnt) is
	begin
	
		if entrada'event and entrada = '1' then
			if cnt = "111" then
				cnt <= "000";
			else
				cnt <= cnt + 1;
			end if;
		end if;
	
		case cnt is
		when "000" =>
			colorOut <= "10101010"; --10
		when "001" =>
			colorOut <= "01101110"; --20
		when "010" =>
			colorOut <= "10100101"; --30
		when "011" =>
			colorOut <= "00000001"; --40
		when "100" =>
			colorOut <= "01100100"; --50
		when "101" =>
			colorOut <= "01001110"; --70
		when "110" =>
			colorOut <= "10101010"; --85
		when "111" =>
			colorOut <= "10011001"; --100
		when others =>
			colorOut <= "11000001";
		end case;
		
	end process;
end behavioral;