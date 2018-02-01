library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity debounce is
	port(
		i,clk : in std_logic;
		o: out std_logic
		);
end debounce;

architecture behavioral of debounce is

constant cntSize : integer := 19;
signal counter : unsigned(cntSize downto 0) := (others=>'0');
signal pbOld : std_logic :='0';
signal pbClean : std_logic;

begin
	
    process (clk,i) is
	begin
		if clk'event and clk='1' then
			if (pbOld xor i) = '1' then
				counter <=(others =>'0');
				pbOld <= i;
			elsif counter(cntSize) = '0' then
				counter <= counter + 1;
			else
				pbClean <= pbOld;
			end if;
		end if;
	end process;
	
	o <= pbClean;

	
end behavioral;
