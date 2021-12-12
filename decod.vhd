library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod is
port(	SEL_POT: in std_logic_vector( 9 downto 0);
		F: out std_logic_vector(9 downto 0)
	);
end decod;

architecture circuito_Decod of decod is
begin
	F <= "0000000000" when SEL_POT = "0000000000" else
		  "0000000001" when SEL_POT = "0000000001" else
		  "0000000011" when SEL_POT = "0000000010" else
		  "0000000111" when SEL_POT = "0000000100" else
		  "0000001111" when SEL_POT = "0000001000" else
		  "0000011111" when SEL_POT = "0000010000" else
		  "0000111111" when SEL_POT = "0000100000" else
		  "0001111111" when SEL_POT = "0001000000" else
		  "0011111111" when SEL_POT = "0010000000" else
		  "0111111111" when SEL_POT = "0100000000" else
		  "1111111111" when SEL_POT = "1000000000"  ;
		  
end circuito_Decod;