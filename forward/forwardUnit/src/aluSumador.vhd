library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   
entity aluSumador is
	 port(
		 a : in STD_LOGIC_VECTOR(63 downto 0);
		 b : in STD_LOGIC_VECTOR(63 downto 0);
		 res : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end aluSumador;						  
architecture aluSumador of aluSumador is
begin
	  	res <= a + b;
end aluSumador;
