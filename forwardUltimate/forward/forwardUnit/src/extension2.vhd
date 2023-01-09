library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity extension2 is
	 port(
		 entrada : in STD_LOGIC_VECTOR(63 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end extension2;

--}} End of automatically maintained section

architecture extension2 of extension2 is
begin	   
	process (entrada)
	begin 
		salida(1 downto 0) <= "00";
		salida(63 downto 2) <= entrada(61 downto 0);  
	 -- enter your statements here --
	end process;

end extension2;
