---------------------------------------------------------------------------------------------------
--
-- Title       : registro4
-- Design      : forwardUnit
-- Author      : Roberto
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : registro4.vhd
-- Generated   : Wed Dec 14 23:47:35 2022
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
--{entity {registro4} architecture {registro4}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity registro4 is
	 port(
		 wbentrada : in STD_LOGIC;
		 entradard : in STD_LOGIC_VECTOR(4 downto 0);
		 entradadato : in STD_LOGIC_VECTOR(63 downto 0);
		 salidadato : out STD_LOGIC_VECTOR(63 downto 0);
		 wbsalida : out STD_LOGIC;
		 salidard : out STD_LOGIC_VECTOR(4 downto 0);
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC
	     );
end registro4;

--}} End of automatically maintained section

architecture registro4 of registro4 is
begin
	process(clk,reset,wbentrada,entradard,entradadato)
	begin
		if(reset = '1') then
			salidadato <=x"0000000000000000";
			wbsalida<='0';
			salidard<="00000";
		elsif rising_edge(clk) then	
			salidadato<=entradadato;
			wbsalida<=wbentrada;
			salidard<=entradard;
		end if;
	end process;
	 -- enter your statements here --

end registro4;
