

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity branch_control is
	 port(
		 zero : in STD_LOGIC;
		 opcode : in STD_LOGIC_VECTOR(6 downto 0);
		 control : out STD_LOGIC;	 
		 operacionSaltos: in STD_LOGIC_VECTOR(63 downto 0);
		 operacionJalr: in STD_LOGIC_VECTOR(63 downto 0);
		 pcmas4: in STD_LOGIC_VECTOR(63 downto 0); 
		 correccion: out STD_LOGIC_VECTOR(63 downto 0);		
		 controlSalida: out   STD_LOGIC;
		 target:  out STD_LOGIC_VECTOR(63 downto 0);
		 cont: out STD_LOGIC_VECTOR(1 downto 0);
		 WE:  out   STD_LOGIC;
		 id_cont: in STD_LOGIC_VECTOR(1 downto 0);
		 id_target: in STD_LOGIC_VECTOR(63 downto 0)
	     );
end branch_control;

--}} End of automatically maintained section

architecture branch_control of branch_control is
begin
	
	process(zero, opcode,operacionSaltos,operacionJalr,pcmas4, id_cont, id_target)
	begin	
		--bne beq 
		if(opcode = "1100011")then
				if(zero = '1') then
					control<='1';
				else															  
					control<='0';
				end if;	  
				target <= operacionsaltos;
		--jal
	   elsif(opcode = "1101111") then 
		  control<='1';	
		  target <= operacionSaltos;
	 
	   elsif(opcode = "1100111") then 
		   control<='1';	 
		   target<=	operacionJalr;
	 end if;  
	 if (id_cont = "00") then 
		 cont <="11";
	 end if;
	
	end process;
	 -- enter your statements here --

end branch_control;
