library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7segMin is
port (CONTA: in std_logic_vector( 9 downto 6);
		H: out std_logic_vector(9 downto 0)
		);
end decod7segMin;

architecture circuito_Decod_min of decod7segMin is
begin
	H <= "0000000000" when CONTA = "0000" else
		  "0000000001" when CONTA = "0001" else
		  "0000000010" when CONTA = "0010" else
		  "0000000011" when CONTA = "0011" else
		  "0000000100" when CONTA = "0100" else
		  "0000000101" when CONTA = "0101" else
		  "0000000110" when CONTA = "0110" else
		  "0000000111" when CONTA = "0111" else
		  "0000001000" when CONTA = "1000" else
		  "0000001001" when CONTA = "1001" else
		  "0000100000" when CONTA = "1010" else
		  "0000100001" when CONTA = "1011" else
		  "0000100010" when CONTA = "1100" else
		  "0000100011" when CONTA = "1101" else
		  "0000100100" when CONTA = "1110" else
		  "0000100101" when CONTA = "1111";
end circuito_Decod_min;