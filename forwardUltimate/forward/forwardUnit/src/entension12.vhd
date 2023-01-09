---------------------------------------------------------------------------------------------------
--
-- Title       : entension12
-- Design      : datapath
-- Author      : Roberto
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : entension12.vhd
-- Generated   : Sat Nov 26 23:23:15 2022
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
--{entity {entension12} architecture {entension12}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity entension12 is
	 port(
		 entrada : in STD_LOGIC_VECTOR(11 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end entension12;

--}} End of automatically maintained section

architecture entension12 of entension12 is
begin
	process (entrada)
	begin 
		salida(11 downto 0) <= entrada;
	if entrada(11) = '0' then 
		salida(63 downto 12) <=  "0000000000000000000000000000000000000000000000000000";
	else
		salida(63 downto 12)	<= "1111111111111111111111111111111111111111111111111111";
	end if;
	 -- enter your statements here --
	end process;
end entension12;
