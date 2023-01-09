

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity alu is
	 port(
		 entradaA : in STD_LOGIC_VECTOR(63 downto 0);
		 entradaB : in STD_LOGIC_VECTOR(63 downto 0);		  
		 salida : out STD_LOGIC_VECTOR(63 downto 0);
		 operacion : in STD_LOGIC
	     );
end alu;

--}} End of automatically maintained section

architecture alu of alu is
begin
	process (entradaA,entradaB, operacion)
	variable resultado: STD_LOGIC_VECTOR(63 downto 0);
	begin  	 

			if operacion = '1' then 
				resultado := entradaA - entradaB;
				salida <= resultado;  
			else 
				resultado := entradaA + entradaB; 
				salida <= resultado;	 
			end if;
		end process;
	 -- enter your statements here --

end alu;
