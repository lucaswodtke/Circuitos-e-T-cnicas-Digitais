library IEEE;
use IEEE.Std_Logic_1164.all;

entity juncao is
port (H: in std_logic_vector(9 downto 0);
		G: in std_logic_vector(9 downto 0);
		CONTA_decod: out std_logic_vector(19 downto 0)
		);
end juncao;

architecture circ_juncao of juncao is
begin
	CONTA_decod(19 downto 10) <= H;
	CONTA_decod(9 downto 0) <= G;
end circ_juncao;