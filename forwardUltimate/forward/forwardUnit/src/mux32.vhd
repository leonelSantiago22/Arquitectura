---------------------------------------------------------------------------------------------------
--
-- Title       : mux32
-- Design      : forwardUnit
-- Author      : CorvoHyatt
-- Company     : CorvoLabs
--
---------------------------------------------------------------------------------------------------
--
-- File        : mux32.vhd
-- Generated   : Fri Jan  6 11:28:08 2023
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
--{entity {mux32} architecture {mux32}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity mux32 is
	 port(
		 control : in STD_LOGIC;
		 a : in STD_LOGIC_VECTOR(31 downto 0);
		 b : in STD_LOGIC_VECTOR(31 downto 0);
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end mux32;

--}} End of automatically maintained section

architecture mux32 of mux32 is
begin
	
	process (control, a, b)
	begin 
		if control = '0' then
		  	salida <= a;
		elsif control ='1' then
			salida<=b; 
		end if;
	end process;
	 -- enter your statements here --

end mux32;
