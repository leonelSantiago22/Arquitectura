

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity branch_control is
	 port(
		 zero : in STD_LOGIC;
		 opcode : in STD_LOGIC_VECTOR(6 downto 0);
		 control : out STD_LOGIC;
		 controlSalida: out   STD_LOGIC_VECTOR(1 downto 0)
	     );
end branch_control;

--}} End of automatically maintained section

architecture branch_control of branch_control is
begin
	
	process(zero, opcode)
	begin	
		--saltos bne, beq
		if(opcode ="1100011" ) then
			controlSalida<="10";
		 	if(zero = '1') then
				 control<='1';	  
			else 
				control<='0';
		 	end if;		 
		--jal
		elsif (opcode = "1101111")then 
			controlSalida <="10";
		--jalr 
		elsif(opcode = "1100111") then 	
			controlSalida<="01";
		else 		  
			control<='0';
			controlSalida<="00";
			
		end if;
	
	end process;
	 -- enter your statements here --

end branch_control;
