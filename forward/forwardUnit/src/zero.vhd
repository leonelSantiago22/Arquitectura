
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity zero is
	 port(
		 a : in STD_LOGIC_VECTOR(63 downto 0);
		 b : in STD_LOGIC_VECTOR(63 downto 0);
		 zero : out STD_LOGIC
	     );
end zero;

--}} End of automatically maintained section

architecture zero of zero is 
	
begin
	process(a,b)
	variable resultado: STD_LOGIC_VECTOR(63 downto 0);
	begin
		resultado:= a-b;   
		zero <= '0';
		if(resultado (63 downto 0)) = x"0000000000000000" then
			zero<='1';
		else
			zero<='0';
		end if;
	end process;
	
	 -- enter your statements here --

end zero;
