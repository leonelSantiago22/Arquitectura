library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity BTB is
	 port(
		 WE : in STD_LOGIC;
		 target : in STD_LOGIC_VECTOR(63 downto 0);
		 cont : in STD_LOGIC_VECTOR(1 downto 0);
		 PC : in STD_LOGIC_VECTOR(63 downto 0);
		 ID_PC : in STD_LOGIC_VECTOR(63 downto 0);
		 predict : out STD_LOGIC;
		 contadorSalida : out STD_LOGIC_VECTOR(1 downto 0);
		 prediction : out STD_LOGIC_VECTOR(63 downto 0);
		 salidaTarget : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end BTB;

--}} End of automatically maintained section

architecture BTB of BTB is		   
type memoria is array(0 to 31) of STD_LOGIC_VECTOR(63 downto 0);
signal registrotargets : memoria :=
(
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000",
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000",
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000",
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000",
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000",
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000",
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000",
	x"0000000000000000",x"0000000000000000",x"0000000000000000",x"0000000000000000"
);
type memoria2 is array(0 to 31) of STD_LOGIC_VECTOR(1 downto 0);
signal registrocont : memoria2 :=
(
	"00","00","00","00",
	"00","00","00","00",
	"00","00","00","00",
	"00","00","00","00",
	"00","00","00","00",
	"00","00","00","00",
	"00","00","00","00",
	"00","00","00","00"
);	  
type localidad is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
signal memoriadeinstrucciones : localidad :=
(
	x"00400263",--beq x0,x1,4
	x"001011e3",--bne x0,x1,3	
	x"002081b3",--add x3,x1,x2
	x"00218233",--add x4,x3,x2
	x"000030ef",--jal x1,3
  	x"40c200b3",--sub x1,x4,x12
	x"0000d16f",--jal x2,13
	x"003100b3",--add x1,x2,x3
	x"0080b403",--ld x8,8)x1
 	x"0080b823",--sd x8,16(x1)
	x"000080e7",--jalr x1,0(x1)
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
	x"00000000",
	x"00000000"	     
);	  
signal instruccionPeticion: STD_LOGIC_VECTOR(31 downto 0);
	signal contPeticion: STD_LOGIC_VECTOR(1 downto 0);
	signal targetPeticion: STD_LOGIC_VECTOR(63 downto 0);
begin

	process(pc, WE, target, cont, PC, ID_PC)
	begin 
		instruccionPeticion <= memoriadeinstrucciones(CONV_INTEGER(pc(6 downto 2)));	
		contPeticion <= registrocont(CONV_INTEGER(pc(6 downto 2)));
		salidaTarget <= registrotargets(CONV_INTEGER(pc(6 downto 2)));	
		contadorSalida <= contPeticion;
		predict<= contPeticion(1);
	  	if 	WE = '1' then 
			registrocont(conv_integer(ID_PC(6 downto 2))) <= cont;
			registrotargets(conv_integer(ID_PC(6 downto 2))) <= target;
		end if;	
			
	end process;

end BTB;
