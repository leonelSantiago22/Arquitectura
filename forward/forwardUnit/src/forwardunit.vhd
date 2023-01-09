

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity forwardunit is
	 port(
		entradardE1: in STD_LOGIC_VECTOR(4 downto 0);
		entradardE2: in STD_LOGIC_VECTOR(4 downto 0);
		entradar1: in STD_LOGIC_VECTOR(4 downto 0); 
		control: out STD_LOGIC_VECTOR(1 downto 0); 
		entradaRegwirteAlu: in STD_LOGIC;
		entradaRegwriteMem:in STD_LOGIC
	     );
end forwardunit;

--}} End of automatically maintained section

architecture forwardunit of forwardunit is 
begin  
	
process(entradardE2,entradardE1,entradar1,entradaRegwirteAlu,entradaRegwriteMem) 
begin
	control <="00";
	if(entradaRegwirteAlu = '1' or entradaRegwriteMem ='1' ) then
	    if(entradardE2 = entradardE1) then 
			if(entradardE1 = entradar1) then	  
				control <= "01";	
			end if;
		else 
			if(entradardE1 = entradar1)then
				control<="01";
			elsif(entradardE2 = entradar1) then 
				control <="10";
			else 
				control <= "00";
			end if;
		end if;
	end if;
end process;
	 -- enter your statements here --

end forwardunit;
