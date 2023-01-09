
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity regfile is
	port(
		 w: in STD_LOGIC;
		 clk: in STD_LOGIC;
		 rs1: in STD_LOGIC_VECTOR(4 downto 0);
		 rs2:in STD_LOGIC_VECTOR(4 downto 0);
		 rd: in STD_LOGIC_VECTOR(4 downto 0);
		 r1 : out STD_LOGIC_VECTOR(63 downto 0);
		 r2 : out STD_LOGIC_VECTOR(63 downto 0);
		 date : in STD_LOGIC_VECTOR(63 downto 0)
	     );
end regfile;

--}} End of automatically maintained section

architecture regfile of regfile is
  type memoria is array(0 to 31) of STD_LOGIC_VECTOR(63 downto 0);
signal registros : memoria :=
(
	x"0000000000000000",x"0000000000000001",x"0000000000000002",x"0000000000000003",
	x"0000000000000004",x"0000000000000005",x"0000000000000006",x"0000000000000007",
	x"0000000000000008",x"0000000000000009",x"000000000000000A",x"000000000000000B",
	x"000000000000000C",x"000000000000000D",x"000000000000000E",x"000000000000000F",
	x"0000000000000010",x"0000000000000011",x"0000000000000012",x"0000000000000013",
	x"0000000000000014",x"0000000000000015",x"0000000000000016",x"0000000000000017",
	x"0000000000000018",x"0000000000000019",x"000000000000001A",x"000000000000001B",
	x"000000000000001C",x"0000000000000100",x"000000000000001E",x"0000000000000000"
);	  
begin  

	process(clk,w,rd)
	begin
		if falling_edge(clk) and w = '1' then 
			registros(conv_integer(rd)) <= date; 
		end if;	
		r1 <= registros(conv_integer(rs1));
		if w = '1' and rs1 = rd then 
				r1 <= date;
			else 
				r1 <= registros(conv_integer(rs1));
		end if;
		if w = '1' and rs2 = rd then 
				r2 <= date;
			else 
				r2 <= registros(conv_integer(rs1));
		end if;
	end process;
	 -- enter your statements here --

end regfile;
