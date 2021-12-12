library ieee;
use ieee.std_logic_1164.all;

entity  Rom is
port (
		REG_ALARM: in std_logic_vector(9 downto 0);
		DADO: out std_logic_vector(9 downto 0) -- Saida comb
		);
end Rom;

architecture bev of Rom is
type memoria is array (19 downto 0) of std_logic_vector(9 downto 0);
constant minhaRom: memoria :=(
		00 => "0000000001",
		01 => "0000000010",
		02 => "0000000100",
		03 => "0000001000",
		04 => "0000010000",
		05 => "0000100000",
		06 => "0001000000",
		07 => "0010000000",
		08 => "0100000000",
		09 => "1000000000",
		10 => "1111111111",
		11 => "0111111111",
		12 => "0011111111",
		13 => "0001111111",
		14 => "0000111111",
		15 => "0000011111",
		16 => "0000001111",
		17 => "0000000111",
		18 => "0000000011",
		19 => "0000000001"
);

begin
process(REG_ALARM)
begin
	case REG_ALARM is
						when "0000000000" => dado <= minhaRom (00);
						when "0000000001" => dado <= minhaRom (01);
						when "0000000010" => dado <= minhaRom (02);
						when "0000000100" => dado <= minhaRom (03);
						when "0000001000" => dado <= minhaRom (04);
						when "0000010000" => dado <= minhaRom (05);
						when "0000100000" => dado <= minhaRom (06);
						when "0001000000" => dado <= minhaRom (07);
						when "0010000000" => dado <= minhaRom (08);
						when "0100000000" => dado <= minhaRom (09);
						when "1000000000" => dado <= minhaRom (10);
						when "1111111111" => dado <= minhaRom (11);
						when "0111111111" => dado <= minhaRom (12);
						when "0011111111" => dado <= minhaRom (13);
						when "0001111111" => dado <= minhaRom (14);
						when "0000111111" => dado <= minhaRom (15);
						when "0000011111" => dado <= minhaRom (16);
						when "0000001111" => dado <= minhaRom (17);
						when "0000000111" => dado <= minhaRom (18);
						when "0000000011" => dado <= minhaRom (19);
						when others => dado <= (others => '0');
	end case;
end process;
end bev;