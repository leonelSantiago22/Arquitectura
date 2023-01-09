
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_unsigned.all;


entity extension is
	 port(
		 entrada : in STD_LOGIC_VECTOR(31 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end extension;

--}} End of automatically maintained section

architecture extension of extension is
begin
	process (entrada)
	begin
		--jal
		if 	entrada(6 downto 0) = "1101111" then -- Si es un JAL
			salida(19 downto 0) <= entrada(31 downto 12); -- Inmediato de 31-12
			if entrada(31) = '0' then -- Si el bit màs significativo es 0
				salida(63 downto 20) <= x"00000000000"; -- 44 ceros 
			else
				salida(63 downto 20) <= x"fffffffffff"; -- 44 unos
			end if;
		-- beq, bne 
		elsif entrada(6 downto 0) = "1100011" or entrada(6 downto 0) = "0100011" then -- if Beq o bne o sd 
			salida(4 downto 0) <= entrada (11 downto 7);
			salida(11 downto 5) <= entrada (31 downto 25);
			if entrada (31) = '0' then -- If el bit mas significativo es 0
				salida (63 downto 12) <= x"0000000000000";
		  	else 
				salida (63 downto 12) <= x"fffffffffffff";
		   end if; 
		
		else  -- Si es un JALR o el resto de operaciones con inmediato(ld)
			salida(11 downto 0) <= entrada(31 downto 20);  -- Inmediato 31-20
			if entrada (31) = '0' then -- If el bit mas significativo es 0
				salida (63 downto 12) <=x"0000000000000";
		  	else 
				salida (63 downto 12) <= x"fffffffffffff";
		   end if;
		   
		end if;	
	end process;
end extension;
