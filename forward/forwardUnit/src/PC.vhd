library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity pc is
	 port(
		 clk     :  STD_LOGIC;
		 reset   :  STD_LOGIC;
		 entrada : in STD_LOGIC_VECTOR(63 downto 0); 
		 static  : in STD_LOGIC_VECTOR(63 downto 0);
		 salida  : out STD_LOGIC_VECTOR(63 downto 0);
		 we      : in STD_LOGIC
	     );
end pc;

--}} End of automatically maintained section

architecture pc of pc is
begin
	process(entrada, clk, reset,we)
	begin 
		if reset = '1' then
			salida <= x"0000000000000000";
		elsif rising_edge(clk) and we  = '0' then	   
				salida <= entrada; 
		end if;  
	end process;
	 -- enter your statements here --

end pc;
