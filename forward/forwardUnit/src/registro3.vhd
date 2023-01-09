
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity registro3 is
	 port(
		 wbentrada : in STD_LOGIC;
		 wbsalida : out STD_LOGIC;
		 write : in STD_LOGIC;
		 writesalida : out STD_LOGIC;  

		 read : in STD_LOGIC;
		 entradaalu : in STD_LOGIC_VECTOR(63 downto 0);
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 entradar2 : in STD_LOGIC_VECTOR(63 downto 0);
		 entradard : in STD_LOGIC_VECTOR(4 downto 0);
		 salidard : out STD_LOGIC_VECTOR(4 downto 0); 
		 entradamemtoreg: in STD_LOGIC;   
		 salidamemtoreg: out STD_LOGIC;
		 readsalida : out STD_LOGIC;
		 salidaalu : out STD_LOGIC_VECTOR(63 downto 0);
		 salidar2 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end registro3;

--}} End of automatically maintained section

architecture registro3 of registro3 is
begin	 
	process(clk,reset,write,read,wbentrada,entradaalu,entradar2,entradard)
	begin
		if reset = '1' then  
			wbsalida <= '0'; 
			writesalida<='0';
			salidamemtoreg<='0';
			salidard<="00000";
			readsalida<= '0';
			salidaalu<=x"0000000000000000";
			salidar2<=x"0000000000000000";
		elsif rising_edge(clk) then	
			wbsalida <= wbentrada; 
			writesalida<=write;
			salidard<=entradard;  
			salidamemtoreg<=entradamemtoreg;
			readsalida<= read;
			salidaalu<=entradaalu;
			salidar2<=entradar2;
		end if;
	end process;

	 -- enter your statements here --

end registro3;
