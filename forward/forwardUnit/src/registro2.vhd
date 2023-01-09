---------------------------------------------------------------------------------------------------
--
-- Title       : registro2
-- Design      : forwardUnit
-- Author      : Roberto
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : registro2.vhd
-- Generated   : Wed Dec 14 20:29:28 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {registro2} architecture {registro2}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity registro2 is
	 port(
		 wb : in STD_LOGIC;
		 write : in STD_LOGIC;
		 read : in STD_LOGIC;
		 entradaaluOP : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 entradard : in STD_LOGIC_VECTOR(4 downto 0);
		 entradamux : in STD_LOGIC_VECTOR(63 downto 0);
		 entradar2 : in STD_LOGIC_VECTOR(63 downto 0);
		 entradar1 : in STD_LOGIC_VECTOR(63 downto 0);
		 entradamas4 : in STD_LOGIC_VECTOR(63 downto 0);
		 entradamemtoreg: in STD_LOGIC;
		 wbsalida : out STD_LOGIC;
		 writesalida : out STD_LOGIC;
		 readsalida : out STD_LOGIC;
		 salidaaluOP : out STD_LOGIC;
		 salidard : out STD_LOGIC_VECTOR(4 downto 0);
		 salidamux : out STD_LOGIC_VECTOR(63 downto 0);
		 salidar2 : out STD_LOGIC_VECTOR(63 downto 0);
		 salidar1 : out STD_LOGIC_VECTOR(63 downto 0);
		 salidamas4 : out STD_LOGIC_VECTOR(63 downto 0);
		 salidamemtoreg: out STD_LOGIC;
		 jalentrada: in STD_LOGIC;
		 jalsalida: out STD_LOGIC;
		 hazard: in STD_LOGIC
	     );
end registro2;

--}} End of automatically maintained section

architecture registro2 of registro2 is
begin
	process(clk,reset,entradard,entradar1,entradar2,entradamas4,wb,read,write,entradaaluOP,entradamux, hazard)
	begin 			  
		if reset = '1' then
			 wbsalida<='0';
			 writesalida<='0';
			 readsalida<='0';
			 salidaaluOP<='0';
			 salidard <= "00000";
			 salidamux <= x"0000000000000000";
			 salidar2 <= x"0000000000000000";
			 salidar1 <=x"0000000000000000";
			 salidamas4<=x"0000000000000000"; 
			 salidamemtoreg <= '0';
			 jalsalida <='0';		   	
		elsif rising_edge(clk) then	
			if(hazard = '0') then 
				 	 wbsalida<=wb;
					 writesalida<=write;
					 readsalida<=read;
					 salidaaluOP<=entradaaluOP;
					 salidard <=entradard;
					 salidamux <= entradamux;
					 salidar2 <= entradar2;
					 salidar1 <= entradar1;
					 salidamas4<=entradamas4;  
					 salidamemtoreg <= entradamemtoreg;	
					 jalsalida <= jalentrada;
			else 
				 wbsalida<='0';
				 writesalida<='0';
				 readsalida<='0';
				 salidaaluOP<='0';
				 salidamemtoreg <= '0';
				 jalsalida <='0';	  
			end if;
			
		end if;
	end process;
	 -- enter your statements here --

end registro2;
