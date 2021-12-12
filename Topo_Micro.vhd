library ieee;
use ieee.std_logic_1164.all;

entity Topo_Micro is
port( SW : in std_logic_vector(9 downto 0);
	   KEY: in std_logic_vector(3 downto 0);
		CLOCK_50: in std_logic;
		LEDR: out std_logic_vector(9 downto 0);
	   HEX0: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX4: out std_logic_vector(6 downto 0);
		HEX5: out std_logic_vector(6 downto 0)
);
end Topo_Micro;

architecture circ_Topo_Micro of Topo_Micro is
signal RST, ENTER, PREDEF, PAUSE, BNT0, BNT1, BNT2, BNT3: std_logic;
signal ESTADOS: std_logic_vector(4 downto 0);
signal IN_POT, RESET_TIME, SET_TIME, EN_TIME, RESET_POT, EN_POT: std_logic;
signal SEL_DISP, SEL_LED: std_logic_vector(1 downto 0);
signal MODE: std_logic_vector(39 downto 0);
signal SEL_DISP_out: std_logic;
signal SEL_TIME: std_logic_vector(9 downto 0);
signal SEL_POT: std_logic_vector(9 downto 0);
signal REG_OPEN, OUT_POT, REG_ALARM: std_logic_vector(9 downto 0);
signal LED_OUT: std_logic_vector(9 downto 0);
signal CONTA_decod: std_logic_vector(19 downto 0);
signal REG: std_logic_vector(19 downto 0);
signal CONTA: std_logic_vector(9 downto 0);
signal G: std_logic_vector(9 downto 0);
signal H: std_logic_vector(9 downto 0);
signal F: std_logic_vector(9 downto 0);
signal CLK1, CLK2: std_logic;
signal RST_CONT, EN, READY, RST_P: std_logic;
signal DADO: std_logic_vector(9 downto 0);
signal D: std_logic_vector(9 downto 0);
signal A: std_logic_vector(4 downto 0);
signal HEX: std_logic_vector(6 downto 0);

component ButtonSync	port
	(
		-- Input ports
		KEY: in std_logic_vector(3 downto 0);
		CLOCK_50 : in std_logic;
		-- Output ports
		btn0	: out std_logic;
		btn1	: out std_logic;
		btn2	: out std_logic;
		btn3	: out std_logic
	);
end component;

component FSM_Control
	port( CLOCK_50: in std_logic;
			PREDEF:   in std_logic; -- BTN2
			READY:    in std_logic;
			ENTER:    in std_logic; -- BTN1
			RST:      in std_logic; -- BTN0
			ESTADOS:    out std_logic_vector(4 downto 0);
			IN_POT:     out std_logic;
			RESET_TIME: out std_logic;
			SET_TIME:   out std_logic;
			EN_TIME:    out std_logic;
			RESET_POT:  out std_logic;
			EN_POT:     out std_logic;
			SEL_DISP:   out std_logic_vector(1 downto 0);
			SEL_LED:    out std_logic_vector(1 downto 0)
			);
end component;

component TempoMux
port (SW:       in std_logic_vector (9 downto 0); 
      MODE:     in std_logic_vector (19 downto 10);
		SEL_DISP: in std_logic_vector(1 downto 0);
		SEL_DISP_out: inout std_logic;
		SEL_TIME: out std_logic_vector(9 downto 0)
		);
end component;

component PotMux
port (SW:      in std_logic_vector(9 downto 0); 
      MODE:    in std_logic_vector(9 downto 0);
		IN_POT:  in std_logic;
		SEL_POT: out std_logic_vector(9 downto 0)
		);
end component;

component EstadosMux
port (REG_OPEN, OUT_POT, REG_ALARM: in std_logic_vector(9 downto 0);
		SEL_LED: in std_logic_vector(1 downto 0);
		LED_OUT: out std_logic_vector(9 downto 0)
		);
end component;

component DisplayMux
port (MODE:       in std_logic_vector (39 downto 20);
		CONTA_decod:in std_logic_vector(19 downto 0);
		SEL_DISP:   in std_logic_vector(1 downto 0);
		REG:        out std_logic_vector(19 downto 0)
		);
end component;

component decod7segSeg
port (CONTA: in std_logic_vector( 5 downto 0);
		G: out std_logic_vector(9 downto 0)
		);
end component;

component decod7segMin
port (CONTA: in std_logic_vector( 9 downto 6);
		H: out std_logic_vector(9 downto 0)
		);
end component;

component juncao
port (H: in std_logic_vector(9 downto 0);
		G: in std_logic_vector(9 downto 0);
		CONTA_decod: out std_logic_vector(19 downto 0)
		);
end component;

component FSM_clock
	port( clock_50: in std_logic;
			CLK1: out std_logic;
			CLK2: out std_logic
		 );
end component;

component combContaRst
port (RST:      in std_logic; -- BNT0
      RESET_TIME:    in std_logic;
		RST_CONT: out std_logic
		);
end component;

component combConta
port (PAUSE:      in std_logic; -- BTN3
      EN_TIME:    in std_logic;
		EN: out std_logic
		);
end component;

component decod
port(	SEL_POT: in std_logic_vector( 9 downto 0);
		F: out std_logic_vector(9 downto 0)
	);
end component;

component CONTA_DESC
port(
		CLK1: in std_logic;
		SEL_TIME: in std_logic_vector(9 downto 0);
		SET_TIME: in std_logic;	
		EN: in std_logic;
		RST_CONT: in std_logic;
		CONTA: out std_logic_vector(9 downto 0)
	);
end component;

component ROM1
  port ( SW : in std_logic_vector(2 downto 0);
         MODE : out std_logic_vector(39 downto 0) 
		 );
end component;

component comparador
port (
		CONTA: in std_logic_vector(9 downto 0);
		READY: out std_logic
);
end component;

component D_4FF2
port (
	CLK1, EN_POT: in std_logic;
	RST: in std_logic; -- BTN0
	RESET_POT: in std_logic;
	F: in std_logic_vector(9 downto 0);
	RST_P: out std_logic;
	OUT_POT: out std_logic_vector(9 downto 0)
	);
end component;

component D_4FF1
port (
	CLK2, RST: in std_logic; -- BNT0
	DADO: in std_logic_vector(9 downto 0); -- Saida comb
	REG_ALARM: out std_logic_vector(9 downto 0)
	);
end component;

component Rom
port (
		REG_ALARM: in std_logic_vector(9 downto 0);
		DADO: out std_logic_vector(9 downto 0) -- Saida comb
		);
end component;

component D_4FF
port (
	CLK1, RST: in std_logic; -- BNT0
	D: in std_logic_vector(9 downto 0); -- Saida inversor
	REG_OPEN: out std_logic_vector(9 downto 0)
	);
end component;

component Decod7seg
port (
	A: in std_logic_vector(4 downto 0);
	HEX: out std_logic_vector(6 downto 0)
);
end component;

begin
RST <= BNT0;
ENTER <= BNT1;
PREDEF <= BNT2;
PAUSE <= KEY(3);
D <= not REG_OPEN;

L0: ButtonSync port map (KEY, CLOCK_50, bnt0, bnt1, bnt2, bnt3);

L1: FSM_Control port map (CLOCK_50, PREDEF, READY, ENTER, RST, ESTADOS, IN_POT, RESET_TIME,
								  SET_TIME, EN_TIME, RESET_POT, EN_POT, SEL_DISP, SEL_LED);
								  
L2: TempoMux port map (SW, MODE(19 downto 10), SEL_DISP, SEL_DISP_out, SEL_TIME);

L3: PotMux port map (SW, MODE(9 downto 0), IN_POT, SEL_POT);

L4: EstadosMux port map (REG_OPEN, OUT_POT, REG_ALARM, SEL_LED, LED_OUT);

L5: DisplayMux port map (MODE(39 downto 20), CONTA_decod, SEL_DISP, REG);

L6: decod7segSeg port map (CONTA(5 downto 0), G);

L7: decod7segMin port map (CONTA(9 downto 6), H);

L8: juncao port map (H, G, CONTA_decod);

L9: FSM_clock port map (clock_50, CLK1, CLK2);

L10: combContaRst port map (RST, RESET_TIME, RST_CONT);

L11: combConta port map (PAUSE, EN_TIME, EN);

L12: CONTA_DESC port map (CLK1, SEL_TIME, SET_TIME, EN, RST_CONT, CONTA);

L13: ROM1 port map (SW(2 downto 0), MODE);

L14: comparador port map (CONTA, READY);

L15: D_4FF2 port map (CLK1, EN_POT, RST, RESET_POT, F, RST_P, OUT_POT);

L16: D_4FF1 port map (CLK2, RST, DADO, REG_ALARM);

L17: D_4FF port map (CLK1, RST, D, REG_OPEN);

L18: Decod7seg port map (REG(4 downto 0), HEX0);

L19: Decod7seg port map (REG(9 downto 5), HEX1);

L20: Decod7seg port map (REG(14 downto 10), HEX2);

L21: Decod7seg port map (REG(19 downto 15), HEX3);

L22: Decod7seg port map (ESTADOS, HEX4);

L23: decod port map (SEL_POT, F);

L24: Rom port map (REG_ALARM, DADO);

HEX5 <= "0000110";

LEDR <= LED_OUT;

end circ_Topo_Micro;
