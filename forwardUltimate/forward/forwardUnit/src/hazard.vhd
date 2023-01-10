---------------------------------------------------------------------------------------------------
--
-- Title       : hazard
-- Design      : forwardUnit
-- Author      : Roberto
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : hazard.vhd
-- Generated   : Thu Jan  5 18:55:59 2023
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
--{entity {hazard} architecture {hazard}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity hazard is
	 port(
		 memR : in STD_LOGIC;
		 rs1 : in STD_LOGIC_VECTOR(4 downto 0);	 
		 opcode: in STD_LOGIC_VECTOR(6 downto 0);
		 rs2 : in STD_LOGIC_VECTOR(4 downto 0);
		 rd : in STD_LOGIC_VECTOR(4 downto 0);
		 hazrd : out STD_LOGIC
	     );
end hazard;

--}} End of automatically maintained section

architecture hazard of hazard is
begin
	
	process(rs1,rs2,rd,memR)
	begin 
		if(memR = '1') then 
				if(rs1 = rd) then 
					hazrd <='1';
				elsif(rs2 = rd) then 
					hazrd <='1';
				else 
					hazrd <='0';
				end if;
			
		else
			hazrd <='0';
		end if;
		
		
	end process;
	 -- enter your statements here --

end hazard;
