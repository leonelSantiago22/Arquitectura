

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

entity sumador is
	 port(
		 a : in STD_LOGIC_VECTOR(63 downto 0);
		 b : in STD_LOGIC_VECTOR(63 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end sumador;

--}} End of automatically maintained section

architecture sumador of sumador is
begin
	
	salida <= a + b;
	 -- enter your statements here --

end sumador;
