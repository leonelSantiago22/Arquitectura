
library IEEE;	  
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_unsigned.all; 

entity control is
	 port(
		 opcode : in STD_LOGIC_VECTOR(6 downto 0);
		 func3 : in STD_LOGIC_VECTOR(2 downto 0);
		 func7 : in STD_LOGIC_VECTOR(6 downto 0);
		 wb :  out STD_LOGIC;
		 jal: out STD_LOGIC; 
		 we:   in STD_LOGIC;
		 jalr: out STD_LOGIC;
		 read :  out STD_LOGIC;	 
		 bne :  out STD_LOGIC;
		 beq :  out STD_LOGIC;
		 write :  out STD_LOGIC;
		 aluOP :  out STD_LOGIC; 
		 aluSRC :  out STD_LOGIC;
		 memtoreg : out STD_LOGIC
	     );
end control;

--}} End of automatically maintained section

architecture control of control is
	
begin	 
	process(opcode, func3)
	begin 
	
		--add 
		if we = '1' then 
			wb <='0';
			read <='0';
			write<='0';	
			jal <= '0';
			aluOP<='0';
			aluSRC<='0';  	  
			beq <='0';
			bne<='0';
			memtoreg<='0';	 
			jalr<='0';
		elsif(opcode ="0110011" ) then 
			wb<='1';   
			memtoreg<='1';
			read <='0';
			write<='0';	
			jal <= '0';
			aluSRC<='0';
			beq <='0';
			bne<='0';	 
			jalr<='0';
			if(func7="0000000") then
			 	aluOP<='0';
			else
				aluOP<='1';
			end if;
		--addi
		elsif (opcode = "0010011") then
			aluOP<='0';
			wb<='1';
			memtoreg<='1';
			read <='0';
			write<='0';	
			jal <= '0';
			aluSRC<='0';  	  
			beq <='0';
			bne<='0';	 
			jalr<='0';
		--ld
		elsif (opcode = "0000011") then
			aluOP <='0';	--suma
			wb<='1';
			read<= '0';
			write<='1';
			aluSRC<='0';
			memtoreg<='0';
			jal <= '0';	  
			beq <='0';
			bne<='0';	 
			jalr<='0';
		--sd
		elsif (opcode = "0100011") then	
			aluOP <='0';	--suma
			wb<='1';
			read<= '1';
			aluSRC<='0';
			write<='0';	
			memtoreg<='0';
			jal <= '0';  	  
			beq <='0';
			bne<='0';	 
			jalr<='0';
		--jal
		elsif(opcode = "1101111") then 
			aluOP <='0';	--suma
			wb<='1';
			read<= '0';
			aluSRC<='1';
			write<='1';	
			memtoreg<='0';
			jal <= '1';	  	  
			beq <='0';
			bne<='0';
			jalr<='1';
		--beq 
		elsif(opcode = "1100011" and func3 ="000")	 then
			wb<= '0';
			aluOp <= '0';
			read <= '0';
			aluSRC <= '1';
			write<='0';
			jal<='0';	
			beq <='1';
			bne <='0';	
			memtoreg<='0';	 
			jalr<='0';
		--bne 
		elsif(opcode = "1100011" and func3= "001") then
			wb <= '0';
			aluOp <= '0';
			read <= '0';
			aluSRC <= '1';
			write<='0';
			jal<='0';  
			beq <='0';
			bne <='1';
			memtoreg<='0';	 
			jalr<='0';
		--jalr
		elsif(opcode = "1100111") then 
			aluOP<='0';
			wb <= '1';
			read<='0';
			aluSRC<='1';
			write<='0';
			memtoreg<='0';
			jalr<='1'; 
			jal <= '0';	  
			beq <='0';
			bne<='0';
		end if;	   
	end process;				   
end control;

