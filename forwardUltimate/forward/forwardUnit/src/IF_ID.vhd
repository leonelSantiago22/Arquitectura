---------------------------------------------------------------------------------------------------
--
-- Title       : IF_ID
-- Design      : forwardUnit
-- Author      : Roberto
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : IF_ID.vhd
-- Generated   : Wed Dec 14 19:32:04 2022
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
--{entity {IF_ID} architecture {IF_ID}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity IF_ID is
	 port(
		 instruccion : in STD_LOGIC_VECTOR(31 downto 0);
		 pcmas4 : in STD_LOGIC_VECTOR(63 downto 0);
		 pc : in STD_LOGIC_VECTOR(63 downto 0);
		 clk : in STD_LOGIC;
		 we : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 salidapcmas4 : out STD_LOGIC_VECTOR(63 downto 0);
		 salidapc : out STD_LOGIC_VECTOR(63 downto 0);
		 func7:  out STD_LOGIC_VECTOR(6 downto 0);
		 rs1 : out STD_LOGIC_VECTOR(4 downto 0);
		 rs2 : out STD_LOGIC_VECTOR(4 downto 0);
		 rd : out STD_LOGIC_VECTOR(4 downto 0);
		 func3:  out STD_LOGIC_VECTOR(2 downto 0);
		 extension:out STD_LOGIC_VECTOR(31 downto 0);
		 opcode : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end IF_ID;

--}} End of automatically maintained section

architecture IF_ID of IF_ID is
begin
	process(clk,reset,instruccion,pcmas4,pc,we)
	begin 
		if reset = '1' then
			rs1 <= "00000";
			rs2 <= "00000";
			rd <= "00000";	   
			func7 <= "0000000";
			salidapcmas4 <= x"0000000000000000";
			salidapc <=  x"0000000000000000";
			opcode <= "0000000";
			func3<= "000";		  
			extension <= x"00000000";
		elsif rising_edge(clk) and we ='0' then	
			
				salidapcmas4 <= pcmas4;	
				salidapc <= pc;
				rs1 <=  instruccion(19 downto 15);
				rs2 <=  instruccion(24 downto 20); 
				rd <= instruccion(11 downto 7);
				opcode <=instruccion(6 downto 0);
				func3 <=   instruccion(14 downto 12);
				extension  <= instruccion(31 downto 0); 
				func7 <= instruccion(31 downto 25);
		end if;
	end process;
	 -- enter your statements here --

end IF_ID;
