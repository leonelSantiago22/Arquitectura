---------------------------------------------------------------------------------------------------
--
-- Title       : forward
-- Design      : forwardUnit
-- Author      : Roberto
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : C:\Users\Roberto\Downloads\forwardUltimate\forwardUltimate\forward\forwardUnit\compile\forward.vhd
-- Generated   : Thu Jan 12 12:02:23 2023
-- From        : C:\Users\Roberto\Downloads\forwardUltimate\forwardUltimate\forward\forwardUnit\src\forward.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity forward is
  port(
       clk : in STD_LOGIC;
       reset : in STD_LOGIC
  );
end forward;

architecture forward of forward is

---- Component declarations -----

component add4
  port (
       entrada : in STD_LOGIC_VECTOR(63 downto 0);
       salidamas4 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component alu
  port (
       entradaA : in STD_LOGIC_VECTOR(63 downto 0);
       entradaB : in STD_LOGIC_VECTOR(63 downto 0);
       operacion : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component alusumador
  port (
       a : in STD_LOGIC_VECTOR(63 downto 0);
       b : in STD_LOGIC_VECTOR(63 downto 0);
       res : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component branch_control
  port (
       opcode : in STD_LOGIC_VECTOR(6 downto 0);
       zero : in STD_LOGIC;
       control : out STD_LOGIC;
       controlSalida : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;
component burbuja_instruccion
  port (
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component control
  port (
       func3 : in STD_LOGIC_VECTOR(2 downto 0);
       func7 : in STD_LOGIC_VECTOR(6 downto 0);
       opcode : in STD_LOGIC_VECTOR(6 downto 0);
       we : in STD_LOGIC;
       aluOP : out STD_LOGIC;
       aluSRC : out STD_LOGIC;
       beq : out STD_LOGIC;
       bne : out STD_LOGIC;
       jal : out STD_LOGIC;
       jalr : out STD_LOGIC;
       memtoreg : out STD_LOGIC;
       read : out STD_LOGIC;
       wb : out STD_LOGIC;
       write : out STD_LOGIC
  );
end component;
component extension
  port (
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       salida : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component extension2
  port (
       entrada : in STD_LOGIC_VECTOR(63 downto 0);
       salida : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component forwardunit
  port (
       entradaRegwirteAlu : in STD_LOGIC;
       entradaRegwriteMem : in STD_LOGIC;
       entradar1 : in STD_LOGIC_VECTOR(4 downto 0);
       entradardE1 : in STD_LOGIC_VECTOR(4 downto 0);
       entradardE2 : in STD_LOGIC_VECTOR(4 downto 0);
       control : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;
component hazard
  port (
       memR : in STD_LOGIC;
       opcode : in STD_LOGIC_VECTOR(6 downto 0);
       rd : in STD_LOGIC_VECTOR(4 downto 0);
       rs1 : in STD_LOGIC_VECTOR(4 downto 0);
       rs2 : in STD_LOGIC_VECTOR(4 downto 0);
       hazrd : out STD_LOGIC
  );
end component;
component IF_ID
  port (
       clk : in STD_LOGIC;
       instruccion : in STD_LOGIC_VECTOR(31 downto 0);
       pc : in STD_LOGIC_VECTOR(63 downto 0);
       pcmas4 : in STD_LOGIC_VECTOR(63 downto 0);
       reset : in STD_LOGIC;
       we : in STD_LOGIC;
       extension : out STD_LOGIC_VECTOR(31 downto 0);
       func3 : out STD_LOGIC_VECTOR(2 downto 0);
       func7 : out STD_LOGIC_VECTOR(6 downto 0);
       opcode : out STD_LOGIC_VECTOR(6 downto 0);
       rd : out STD_LOGIC_VECTOR(4 downto 0);
       rs1 : out STD_LOGIC_VECTOR(4 downto 0);
       rs2 : out STD_LOGIC_VECTOR(4 downto 0);
       salidapc : out STD_LOGIC_VECTOR(63 downto 0);
       salidapcmas4 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component memoriaDatos
  port (
       clk : in STD_LOGIC;
       entradaAlu : in STD_LOGIC_VECTOR(63 downto 0);
       entradaRegfile : in STD_LOGIC_VECTOR(63 downto 0);
       escritura : in STD_LOGIC;
       lectura : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component memoriadeinstrucciones
  port (
       direccion : in STD_LOGIC_VECTOR(63 downto 0);
       salinstruccion : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component mux32
  port (
       a : in STD_LOGIC_VECTOR(31 downto 0);
       b : in STD_LOGIC_VECTOR(31 downto 0);
       control : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component muxEntradaAlu
  port (
       a : in STD_LOGIC_VECTOR(63 downto 0);
       b : in STD_LOGIC_VECTOR(63 downto 0);
       control : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component muxEscogedor
  port (
       A : in STD_LOGIC_VECTOR(63 downto 0);
       B : in STD_LOGIC_VECTOR(63 downto 0);
       C : in STD_LOGIC_VECTOR(63 downto 0);
       cntrl : in STD_LOGIC_VECTOR(1 downto 0);
       salidaDato : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component pc
  port (
       clk : in STD_LOGIC;
       entrada : in STD_LOGIC_VECTOR(63 downto 0);
       reset : in STD_LOGIC;
       we : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component regfile
  port (
       clk : in STD_LOGIC;
       date : in STD_LOGIC_VECTOR(63 downto 0);
       rd : in STD_LOGIC_VECTOR(4 downto 0);
       rs1 : in STD_LOGIC_VECTOR(4 downto 0);
       rs2 : in STD_LOGIC_VECTOR(4 downto 0);
       w : in STD_LOGIC;
       r1 : out STD_LOGIC_VECTOR(63 downto 0);
       r2 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component registro2
  port (
       clk : in STD_LOGIC;
       entradaaluOP : in STD_LOGIC;
       entradamas4 : in STD_LOGIC_VECTOR(63 downto 0);
       entradamemtoreg : in STD_LOGIC;
       entradamux : in STD_LOGIC_VECTOR(63 downto 0);
       entradar1 : in STD_LOGIC_VECTOR(63 downto 0);
       entradar2 : in STD_LOGIC_VECTOR(63 downto 0);
       entradard : in STD_LOGIC_VECTOR(4 downto 0);
       jalentrada : in STD_LOGIC;
       read : in STD_LOGIC;
       reset : in STD_LOGIC;
       wb : in STD_LOGIC;
       write : in STD_LOGIC;
       jalsalida : out STD_LOGIC;
       readsalida : out STD_LOGIC;
       salidaaluOP : out STD_LOGIC;
       salidamas4 : out STD_LOGIC_VECTOR(63 downto 0);
       salidamemtoreg : out STD_LOGIC;
       salidamux : out STD_LOGIC_VECTOR(63 downto 0);
       salidar1 : out STD_LOGIC_VECTOR(63 downto 0);
       salidar2 : out STD_LOGIC_VECTOR(63 downto 0);
       salidard : out STD_LOGIC_VECTOR(4 downto 0);
       wbsalida : out STD_LOGIC;
       writesalida : out STD_LOGIC
  );
end component;
component registro3
  port (
       clk : in STD_LOGIC;
       entradaalu : in STD_LOGIC_VECTOR(63 downto 0);
       entradamemtoreg : in STD_LOGIC;
       entradar2 : in STD_LOGIC_VECTOR(63 downto 0);
       entradard : in STD_LOGIC_VECTOR(4 downto 0);
       read : in STD_LOGIC;
       reset : in STD_LOGIC;
       wbentrada : in STD_LOGIC;
       write : in STD_LOGIC;
       readsalida : out STD_LOGIC;
       salidaalu : out STD_LOGIC_VECTOR(63 downto 0);
       salidamemtoreg : out STD_LOGIC;
       salidar2 : out STD_LOGIC_VECTOR(63 downto 0);
       salidard : out STD_LOGIC_VECTOR(4 downto 0);
       wbsalida : out STD_LOGIC;
       writesalida : out STD_LOGIC
  );
end component;
component registro4
  port (
       clk : in STD_LOGIC;
       entradadato : in STD_LOGIC_VECTOR(63 downto 0);
       entradard : in STD_LOGIC_VECTOR(4 downto 0);
       reset : in STD_LOGIC;
       wbentrada : in STD_LOGIC;
       salidadato : out STD_LOGIC_VECTOR(63 downto 0);
       salidard : out STD_LOGIC_VECTOR(4 downto 0);
       wbsalida : out STD_LOGIC
  );
end component;
component zero
  port (
       a : in STD_LOGIC_VECTOR(63 downto 0);
       b : in STD_LOGIC_VECTOR(63 downto 0);
       zero : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal AluWb : STD_LOGIC;
signal MemWb : STD_LOGIC;
signal NET1043 : STD_LOGIC;
signal NET1051 : STD_LOGIC;
signal NET1059 : STD_LOGIC;
signal NET1067 : STD_LOGIC;
signal NET1082 : STD_LOGIC;
signal NET1158 : STD_LOGIC;
signal NET1292 : STD_LOGIC;
signal NET1476 : STD_LOGIC;
signal NET1482 : STD_LOGIC;
signal NET1933 : STD_LOGIC;
signal NET2479 : STD_LOGIC;
signal NET25224 : STD_LOGIC;
signal NET25228 : STD_LOGIC;
signal NET25236 : STD_LOGIC;
signal NET25300 : STD_LOGIC;
signal NET25304 : STD_LOGIC;
signal NET25312 : STD_LOGIC;
signal NET25326 : STD_LOGIC;
signal NET25345 : STD_LOGIC;
signal NET25389 : STD_LOGIC;
signal NET25451 : STD_LOGIC;
signal NET25459 : STD_LOGIC;
signal NET25465 : STD_LOGIC;
signal NET26112 : STD_LOGIC;
signal NET31717 : STD_LOGIC;
signal NET31733 : STD_LOGIC;
signal AluRd : STD_LOGIC_VECTOR (4 downto 0);
signal BUS1007 : STD_LOGIC_VECTOR (2 downto 0);
signal BUS1146 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS1150 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS1320 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS1497 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS23959 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS2458 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS2476 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25208 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25288 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS25416 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS25486 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25580 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25651 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25721 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25770 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25771 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25807 : STD_LOGIC_VECTOR (1 downto 0);
signal BUS25877 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS25896 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS2840 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS30080 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS30094 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS31820 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS34187 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS34196 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS3496 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS3504 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS679 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS906 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS918 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS935 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS999 : STD_LOGIC_VECTOR (6 downto 0);
signal CtrlF1 : STD_LOGIC_VECTOR (1 downto 0);
signal CtrlF2 : STD_LOGIC_VECTOR (1 downto 0);
signal Frs1 : STD_LOGIC_VECTOR (4 downto 0);
signal Frs2 : STD_LOGIC_VECTOR (4 downto 0);
signal MemRd : STD_LOGIC_VECTOR (4 downto 0);
signal salidaA : STD_LOGIC_VECTOR (63 downto 0);
signal salidaB : STD_LOGIC_VECTOR (63 downto 0);

begin

----  Component instantiations  ----

U1 : pc
  port map(
       clk => clk,
       entrada => BUS25771,
       reset => reset,
       salida => BUS31820,
       we => NET31733
  );

U10 : registro2
  port map(
       clk => clk,
       entradaaluOP => NET1082,
       entradamas4 => BUS935,
       entradamemtoreg => NET25451,
       entradamux => BUS918,
       entradar1 => BUS25721,
       entradar2 => BUS25208,
       entradard => BUS906,
       jalentrada => NET31717,
       jalsalida => NET2479,
       read => NET1051,
       readsalida => NET1292,
       reset => reset,
       salidaaluOP => NET1158,
       salidamas4 => BUS2476,
       salidamemtoreg => NET25459,
       salidamux => BUS1146,
       salidar1 => BUS1150,
       salidar2 => BUS1320,
       salidard => AluRd,
       wb => NET1043,
       wbsalida => AluWb,
       write => NET1059,
       writesalida => NET26112
  );

U11 : muxEntradaAlu
  port map(
       a => BUS25208,
       b => BUS25486,
       control => NET1067,
       salida => BUS918
  );

U12 : control
  port map(
       aluOP => NET1082,
       aluSRC => NET1067,
       beq => NET25228,
       bne => NET25236,
       func3 => BUS1007,
       func7 => BUS999,
       jal => NET25326,
       jalr => NET31717,
       memtoreg => NET25451,
       opcode => BUS25288,
       read => NET1051,
       wb => NET1043,
       we => NET31733,
       write => NET1059
  );

U13 : registro3
  port map(
       clk => clk,
       entradaalu => salidaA,
       entradamemtoreg => NET25459,
       entradar2 => BUS1320,
       entradard => AluRd,
       read => NET1292,
       readsalida => NET1476,
       reset => reset,
       salidaalu => BUS34196,
       salidamemtoreg => NET25465,
       salidar2 => BUS34187,
       salidard => MemRd,
       wbentrada => AluWb,
       wbsalida => MemWb,
       write => NET26112,
       writesalida => NET1482
  );

U14 : memoriaDatos
  port map(
       clk => clk,
       entradaAlu => BUS34196,
       entradaRegfile => BUS34187,
       escritura => NET1482,
       lectura => NET1476,
       salida => BUS1497
  );

U15 : muxEntradaAlu
  port map(
       a => BUS34196,
       b => BUS1497,
       control => NET25465,
       salida => salidaB
  );

U16 : registro4
  port map(
       clk => clk,
       entradadato => salidaB,
       entradard => MemRd,
       reset => reset,
       salidadato => BUS23959,
       salidard => BUS2840,
       wbentrada => MemWb,
       wbsalida => NET1933
  );

U17 : muxEntradaAlu
  port map(
       a => BUS2458,
       b => BUS2476,
       control => NET2479,
       salida => salidaA
  );

U18 : forwardunit
  port map(
       control => CtrlF1,
       entradaRegwirteAlu => AluWb,
       entradaRegwriteMem => MemWb,
       entradar1 => Frs1,
       entradardE1 => AluRd,
       entradardE2 => MemRd
  );

U19 : forwardunit
  port map(
       control => CtrlF2,
       entradaRegwirteAlu => AluWb,
       entradaRegwriteMem => MemWb,
       entradar1 => Frs2,
       entradardE1 => AluRd,
       entradardE2 => MemRd
  );

U2 : add4
  port map(
       entrada => BUS31820,
       salidamas4 => BUS25770
  );

U20 : zero
  port map(
       a => BUS25721,
       b => BUS25208,
       zero => NET25300
  );

NET25304 <= NET25228 and NET25300;

NET25312 <= NET25236 and NET25224;

NET25345 <= NET25312 or NET25304 or NET25326;

NET25224 <= not(NET25300);

U25 : branch_control
  port map(
       control => NET25389,
       controlSalida => BUS25807,
       opcode => BUS25288,
       zero => NET25345
  );

U26 : mux32
  port map(
       a => BUS30094,
       b => BUS30080,
       control => NET25389,
       salida => BUS25416
  );

U27 : burbuja_instruccion
  port map(
       salida => BUS30080
  );

U28 : extension2
  port map(
       entrada => BUS25486,
       salida => BUS25580
  );

U29 : alusumador
  port map(
       a => BUS25721,
       b => BUS25486,
       res => BUS25896
  );

U3 : memoriadeinstrucciones
  port map(
       direccion => BUS31820,
       salinstruccion => BUS30094
  );

U30 : alusumador
  port map(
       a => BUS25651,
       b => BUS25580,
       res => BUS25877
  );

U31 : muxEscogedor
  port map(
       A => BUS25770,
       B => BUS25896,
       C => BUS25877,
       cntrl => BUS25807,
       salidaDato => BUS25771
  );

U32 : hazard
  port map(
       hazrd => NET31733,
       memR => NET26112,
       opcode => BUS25288,
       rd => AluRd,
       rs1 => Frs1,
       rs2 => Frs2
  );

U4 : IF_ID
  port map(
       clk => clk,
       extension => BUS679,
       func3 => BUS1007,
       func7 => BUS999,
       instruccion => BUS25416,
       opcode => BUS25288,
       pc => BUS31820,
       pcmas4 => BUS25770,
       rd => BUS906,
       reset => reset,
       rs1 => Frs1,
       rs2 => Frs2,
       salidapc => BUS25651,
       salidapcmas4 => BUS935,
       we => NET31733
  );

U5 : regfile
  port map(
       clk => clk,
       date => BUS23959,
       r1 => BUS3504,
       r2 => BUS3496,
       rd => BUS2840,
       rs1 => Frs1,
       rs2 => Frs2,
       w => NET1933
  );

U6 : muxEscogedor
  port map(
       A => BUS3504,
       B => salidaA,
       C => salidaB,
       cntrl => CtrlF1,
       salidaDato => BUS25721
  );

U7 : muxEscogedor
  port map(
       A => BUS3496,
       B => salidaA,
       C => salidaB,
       cntrl => CtrlF2,
       salidaDato => BUS25208
  );

U8 : extension
  port map(
       entrada => BUS679,
       salida => BUS25486
  );

U9 : alu
  port map(
       entradaA => BUS1150,
       entradaB => BUS1146,
       operacion => NET1158,
       salida => BUS2458
  );


end forward;
