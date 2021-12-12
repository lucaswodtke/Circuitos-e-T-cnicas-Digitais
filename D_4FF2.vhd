library ieee;
use ieee.std_logic_1164.all;

entity D_4FF2 is 
port (
	CLK1, EN_POT: in std_logic;
	RST: in std_logic; -- BTN0
	RESET_POT: in std_logic;
	F: in std_logic_vector(9 downto 0);
	RST_P: out std_logic;
	OUT_POT: out std_logic_vector(9 downto 0)
	);
end D_4FF2;

architecture behv2 of D_4FF2 is
signal RST_Ps: std_logic;
begin
	RST_Ps <= (not RST) or RESET_POT;
	process(CLK1, RST_Ps,EN_POT, F)
begin
	if (RST_Ps = '1') then OUT_POT <= "0000000000";
	elsif(CLK1'event and CLK1 = '1') then
		if (EN_POT = '1') then OUT_POT <= F;
		end if;
	end if;
end process;
RST_P <= RST_Ps;
end behv2;