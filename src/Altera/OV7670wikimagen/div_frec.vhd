library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity div_frec is

	port (
		Fin   : in std_logic;
		Fout  : out std_logic
	);

end entity;

architecture contadorCiclos of div_frec is
signal contador : integer range 0 to 251760;
signal salida : std_logic;
--Ciclos de la señal de reloj a contar para obtener un periodo de la salida
-- cilos = F_fpga(Hz)/F_deseada(Hz) => 50000000/25000000=2
--Queremos cambiar el valor de la salida cada medio periodo => 251750 ciclos
constant ciclosAcontar :integer := 2;

begin

	process(Fin)
	begin
	if Fin'event and Fin = '1' then
--		contador <= contador + 1;
--		if contador = ciclosAcontar then
--			contador <= 0;
			salida <= not(salida);
--		end if;
	end if;

	end process;
	
	Fout <= salida;	

end contadorCiclos;
