---------------------------------------------------------------------------------------------------
--
-- Title       : memoriaDatos
-- Design      : datapath
-- Author      : Roberto
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : memoriaDatos.vhd
-- Generated   : Fri Nov 25 23:46:54 2022
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
--{entity {memoriaDatos} architecture {memoriaDatos}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_unsigned.all;


entity memoriaDatos is
	 port(
		 escritura : in STD_LOGIC;
		 lectura : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 entradaAlu : in STD_LOGIC_VECTOR(63 downto 0);
		 entradaRegfile : in STD_LOGIC_VECTOR(63 downto 0);
		 salida: out STD_LOGIC_VECTOR (63 downto 0)
	     );
end memoriaDatos;

--}} End of automatically maintained section

architecture memoriaDatos of memoriaDatos is
type memoria is array(0 to 63) of STD_LOGIC_VECTOR(63 downto 0);
signal datos : memoria :=
(
	x"0000000000000000",x"0000000000000001",x"0000000000000002",x"0000000000000003",
	x"0000000000000004",x"0000000000000005",x"0000000000000006",x"0000000000000007",
	x"0000000000000008",x"0000000000000009",x"000000000000000A",x"000000000000000B",
	x"000000000000000C",x"000000000000000D",x"000000000000000E",x"000000000000000F",
	
	x"0000000000000010",x"0000000000000011",x"0000000000000012",x"0000000000000013",
	x"0000000000000014",x"0000000000000015",x"0000000000000016",x"0000000000000017",
	x"0000000000000018",x"0000000000000019",x"000000000000001A",x"000000000000001B",
	x"000000000000001C",x"000000000000001D",x"000000000000001E",x"000000000000001F",
	
	x"0000000000000020",x"0000000000000021",x"0000000000000022",x"0000000000000023",
	x"0000000000000024",x"0000000000000025",x"0000000000000026",x"0000000000000027",
	x"0000000000000028",x"0000000000000029",x"000000000000002A",x"000000000000002B",
	x"000000000000002C",x"000000000000002D",x"000000000000002E",x"000000000000002F",
	
	x"0000000000000030",x"0000000000000031",x"0000000000000032",x"0000000000000033",
	x"0000000000000034",x"0000000000000035",x"0000000000000036",x"0000000000000037",
	x"0000000000000038",x"0000000000000039",x"000000000000003A",x"000000000000003B",
	x"000000000000003C",x"000000000000003D",x"000000000000003E",x"000000000000003F"
);
begin
	process(clk, escritura, lectura, entradaAlu, entradaRegfile)
	begin  
	salida<=  	x"0000000000000000";
	if falling_edge(clk) then 			  
			--caso de que venga un sd o escribir en la memorias
			if lectura = '0' and escritura = '1' then 
				datos(conv_integer(entradaAlu(8 downto 3))) <= 	 entradaRegfile;
			end if;
		--caso de que venga una LD --load data
		 if lectura = '1' and escritura = '0' then 
			 salida <= datos(conv_integer(entradaAlu(8 downto 3)));
		 end if; 
		end if;--final del if de comparacion del flanco de bajada
	end process;

end memoriaDatos;
