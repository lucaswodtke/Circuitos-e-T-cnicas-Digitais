library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
	
entity FSM_Control is
	port( clock_50: in std_logic;
			PREDEF:   in std_logic;
			READY:    in std_logic;
			ENTER:    in std_logic;
			RST:      in std_logic;
			ESTADOS: out std_logic_vector(4 downto 0);
			IN_POT: out std_logic;
			RESET_TIME: out std_logic;
			SET_TIME: out std_logic;
			EN_TIME: out std_logic;
			RESET_POT: out std_logic;
			EN_POT: out std_logic;
			SEL_DISP: out std_logic_vector(1 downto 0);
			SEL_LED: out std_logic_vector(1 downto 0)
			);
end FSM_Control;

architecture bhv of FSM_Control is
	type STATES is (E0, E1, E2, E3, E4, E5, E6);
	signal EA, PE: STATES;

begin

P1: process(EA, ENTER, PREDEF)
begin
	case EA is
		when E0 =>
			if enter = '0' then
				PE <= E1;
			else
				PE <= E0;
			end if;
		
		when E1 =>
			if enter = '0' then
				PE <= E2;
			elsif
				enter = '1' and predef = '1' then
					PE <= E1;
			elsif
				enter = '1' and predef = '0' then
					PE <= E6;
			end if;
			
		when E2 =>
			if enter = '0' then
				PE <= E3;
			else
				PE <= E2;
			end if;
			
		when E3 =>
			if enter = '0' then
				PE <= E4;
			else
				PE <= E3;
			end if;
			
		when E4 =>
			if ready = '1' or enter = '0' then
				PE <= E5;
			else
				PE <= E4;
			end if;
			
		when E5 =>
			if enter = '0' then
				PE <= E1;
			else
				PE <= E5;
			end if;
			
		when E6 =>
			if enter = '0' then
				PE <= E4;
			else
				PE <= E6;
			end if;
	end case;
end process;

P2: process(clock_50, RST)
begin
	if RST = '0'then
		EA <= E0;
	elsif clock_50'event and clock_50 = '1' then
		EA <= PE;
	end if;
end process;

P3: process(EA)
begin
	case EA is
		when E0 =>
			SEL_DISP <= "00";
			SEL_LED <= "00";
			ESTADOS <= "00000";
			
		when E1 =>
			SEL_LED <= "01";
			RESET_TIME <= '1';
			RESET_POT <= '1';
			EN_TIME <= '0';
			SEL_DISP <= "00";
			ESTADOS <= "00001";
			
		when E2 =>
			SET_TIME <= '1';
			SEL_DISP <= "10";
			RESET_TIME <= '0';
			RESET_POT <= '0';
			ESTADOS <= "00010";
			
		when E3 =>
			EN_POT <= '1';
			SEL_LED <= "10";
			SET_TIME <= '0';
			IN_POT <= '0';
			ESTADOS <= "00011";
			
		when E4 =>
			EN_TIME <= '1';
			EN_POT <= '0';
			SEL_DISP <= "10";
			SET_TIME <= '0';
			ESTADOS <= "00100";
			
		when E5 =>
			SEL_DISP <= "11";
			SEL_LED <= "11";
			ESTADOS <= "00101";
			
		when E6 =>
			SEL_DISP <= "01";
			SEL_LED <= "10";
			IN_POT <= '1';
			EN_POT <= '1';
			SET_TIME <= '1';
			ESTADOS <= "00110";
			RESET_TIME <= '0';
			RESET_POT <= '0';
			
	end case;
end process;
end bhv;