library ieee;
use ieee.std_logic_1164.all;

entity D_4FF1 is
port (
	CLK2, RST: in std_logic; -- BNT0
	DADO: in std_logic_vector(9 downto 0); -- Saida comb
	REG_ALARM: out std_logic_vector(9 downto 0)
	);
end D_4FF1;

architecture behv of D_4FF1 is
	begin
		process(CLK2, RST, DADO)
	begin
		if RST = '0' then
			REG_ALARM <= "0000000000";
		elsif (CLK2'event and CLK2 = '1') then
			REG_ALARM <= DADO;
		end if;
	end process;
end behv;