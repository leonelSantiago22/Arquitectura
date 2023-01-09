
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity muxEscogedor is
	 port(
		 cntrl : in STD_LOGIC_VECTOR(1 downto 0);
		 A : in STD_LOGIC_VECTOR(63 downto 0);
		 B : in STD_LOGIC_VECTOR(63 downto 0);
		 C : in STD_LOGIC_VECTOR(63 downto 0);
		 salidaDato : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end muxEscogedor;

--}} End of automatically maintained section

architecture muxEscogedor of muxEscogedor is
begin
   process (cntrl, A, B,C)
	begin 
		if cntrl = "00" then	  	--salida de la memoria de dato
		  salidaDato <= A;
		elsif cntrl ="01"then	   --salida de la alu 
			salidaDato <= B;
		elsif cntrl = "10" then	   --salida del pc 
			salidaDato <=C;
		end if;
	end process;
	 -- enter your statements here --

end muxEscogedor;
