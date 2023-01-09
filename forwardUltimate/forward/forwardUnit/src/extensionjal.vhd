

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity extensionjal is
	 port(
		 entrada : in STD_LOGIC_VECTOR(19 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end extensionjal;

--}} End of automatically maintained section

architecture extensionjal of extensionjal is
begin		
process (entrada)
	begin 
		salida(19 downto 0) <= entrada;
	if entrada(19) = '0' then 
		salida(63 downto 20) <=  "00000000000000000000000000000000000000000000";
	else
		salida(63 downto 20)	<= "11111111111111111111111111111111111111111111";
	end if;
	 -- enter your statements here --
	end process;
end extensionjal;
