
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;


entity memoriadeinstrucciones is
	 port(
		 direccion : in STD_LOGIC_VECTOR(63 downto 0);
		 salinstruccion : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end memoriadeinstrucciones;

--}} End of automatically maintained section

architecture memoriadeinstrucciones of memoriadeinstrucciones is
type localidad is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
signal memoriadeinstrucciones : localidad :=
(

	
	x"003100b3",--add x1,x2,x3	  4
	x"0080b403",--ld x8,8(x1)	   8
	x"00000263",--beq x0,x0,4	 0
	x"0080b823",--sd x8,16(x1) 	   C 
	x"000030ef",--jal x1,3		   10
	x"fff09e63",--bne x1,x31,-4	   14 
  	x"00628233",--add x4,x5,x6	   18
	x"000080e7",--jalr x1,0(x1)	   1C
	x"00003523",--sd x0,10(x0)
	x"00b03923",--sd x11,18(x0)
 	x"feb50fe3",--beq x10,x11,load
	x"00a03683",--ld x13,10(x0)
	x"01203703",--ld x14,18(x0)
	x"00d707b3",--add x15,x14,x13
	x"00e03523",--load2: sd x14,10(x0)
	x"00f03923",--sd x15,18(x0)
	x"40b50533",--sub x10,x10,x11
	x"ffff916f",--jal x2,-7(x0)
	x"01f40833",--add x16,x8,x31
	x"00408167",--jalr x2,4(x1)
	x"01e00833",--add x16,x0,x30
	x"00408167",--jalr x2,4(x1)
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000"

);

begin
	process(direccion)
	begin 
		 salinstruccion <= memoriadeinstrucciones(CONV_INTEGER(direccion(6 downto 2)));
	end process;
end memoriadeinstrucciones;
