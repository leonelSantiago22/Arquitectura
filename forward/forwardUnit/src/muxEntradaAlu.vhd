
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity muxEntradaAlu is
	 port(
		 a : in STD_LOGIC_VECTOR(63 downto 0);
		 b : in STD_LOGIC_VECTOR(63 downto 0); 
		 control : in STD_LOGIC;
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end muxEntradaAlu;

--}} End of automatically maintained section

architecture muxEntradaAlu of muxEntradaAlu is
begin
	process (control, a, b)
	begin 
		if control = '0' then
		  salida <= a;
		elsif control ='1' then
			salida<=b; 
		end if;
	end process;
	 -- enter your statements here --

end muxEntradaAlu;
