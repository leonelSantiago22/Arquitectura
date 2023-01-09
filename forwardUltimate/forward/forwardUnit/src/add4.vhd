
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;


entity add4 is
	 port(
		 entrada : in STD_LOGIC_VECTOR(63 downto 0);
		 salidamas4 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end add4;

--}} End of automatically maintained section

architecture add4 of add4 is
begin
		salidamas4 <= entrada + x"0000000000000004";
	 -- enter your statements here --

end add4;
