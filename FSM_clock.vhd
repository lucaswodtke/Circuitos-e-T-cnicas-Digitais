library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_clock is
	port( clock_50: in std_logic;
			CLK1: out std_logic;
			CLK2: out std_logic
		 );
end FSM_clock;

architecture bhv of FSM_clock is
	signal contador1: std_logic_vector(27 downto 0):= x"0000000";
	signal contador2: std_logic_vector(23 downto 0):= x"000000";

begin
	P1: process(clock_50)
	begin
		if clock_50'event and clock_50 = '1' then
			contador1 <= contador1 + 1;
				if contador1 = x"2FAF07F" then
				contador1 <= x"0000000";
				CLK1 <= '1';
			else
				CLK1 <= '0';
			end if;
		end if;
		
	end process;
		
		P2: process(clock_50)
	begin
		if clock_50'event and clock_50 = '1' then
			contador2 <= contador2 +1;
				if contador2 = x"3AB009" then
				contador2 <= x"000000";
				CLK2 <= '1';
			else
				CLK2 <= '0';
			end if;
		end if;
	end process;
end bhv;