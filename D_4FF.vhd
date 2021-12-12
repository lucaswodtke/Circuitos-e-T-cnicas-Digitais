library ieee;
use ieee.std_logic_1164.all;

entity D_4FF is port (
	CLK1, RST: in std_logic; -- BNT0
	D: in std_logic_vector(9 downto 0); -- Saida inversor
	REG_OPEN: out std_logic_vector(9 downto 0)
	);
end D_4FF;

architecture behv of D_4FF is
	begin
		process(CLK1, RST, D)
	begin
		if RST = '0' then
			REG_OPEN <= "0000000000";
		elsif (CLK1'event and CLK1 = '1') then
			REG_OPEN <= D;
		end if;
	end process;
end behv;