library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7segSeg is
port (CONTA: in std_logic_vector( 5 downto 0);
		G: out std_logic_vector(9 downto 0)
		);
end decod7segSeg;

architecture circuito_Decod_seg of decod7segSeg is
begin
	G <= "0000000000" when CONTA = "000000" else--00
		  "0000000001" when CONTA = "000001" else--01
		  "0000000010" when CONTA = "000010" else--02
		  "0000000011" when CONTA = "000011" else--03
		  "0000000100" when CONTA = "000100" else--04
		  "0000000101" when CONTA = "000101" else--05
		  "0000000110" when CONTA = "000110" else--06
		  "0000000111" when CONTA = "000111" else--07
		  "0000001000" when CONTA = "001000" else--08
		  "0000001001" when CONTA = "001001" else--09
		  "0000100000" when CONTA = "001010" else--10
		  "0000100001" when CONTA = "001011" else--11
		  "0000100010" when CONTA = "001100" else--12
		  "0000100011" when CONTA = "001101" else--13
		  "0000100100" when CONTA = "001110" else--14
		  "0000100101" when CONTA = "001111" else--15
		  "0000100110" when CONTA = "010000" else--16
		  "0000100111" when CONTA = "010001" else--17
		  "0000101000" when CONTA = "010010" else--18
		  "0000101001" when CONTA = "010011" else--19
		  "0001000000" when CONTA = "010100" else--20
		  "0001000001" when CONTA = "010101" else--21
		  "0001000010" when CONTA = "010110" else--22
		  "0001000011" when CONTA = "010111" else--23
		  "0001000100" when CONTA = "011000" else--24
		  "0001000101" when CONTA = "011001" else--25
		  "0001000110" when CONTA = "011010" else--26
		  "0001000111" when CONTA = "011011" else--27
		  "0001001000" when CONTA = "011100" else--28
		  "0001001001" when CONTA = "011101" else--29
		  "0001100000" when CONTA = "011110" else--30
		  "0001100001" when CONTA = "011111" else--31
		  "0001100010" when CONTA = "100000" else--32
		  "0001100011" when CONTA = "100001" else--33
		  "0001100100" when CONTA = "100010" else--34
		  "0001100101" when CONTA = "100011" else--35
		  "0001100110" when CONTA = "100100" else--36
		  "0001100111" when CONTA = "100101" else--37
		  "0001101000" when CONTA = "100110" else--38
		  "0001101001" when CONTA = "100111" else--39
		  "0010000000" when CONTA = "101000" else--40
		  "0010000001" when CONTA = "101001" else--41
		  "0010000010" when CONTA = "101010" else--42
		  "0010000011" when CONTA = "101011" else--43
		  "0010000100" when CONTA = "101100" else--44
		  "0010000101" when CONTA = "101101" else--45
		  "0010000110" when CONTA = "101110" else--46
		  "0010000111" when CONTA = "101111" else--47
		  "0010001000" when CONTA = "110000" else--48
		  "0010001001" when CONTA = "110001" else--49
		  "0010100000" when CONTA = "110010" else--50
		  "0010100001" when CONTA = "110011" else--51
		  "0010100010" when CONTA = "110100" else--52
		  "0010100011" when CONTA = "110101" else--53
		  "0010100100" when CONTA = "110110" else--54
		  "0010100101" when CONTA = "110111" else--55
		  "0010100110" when CONTA = "111000" else--56
		  "0010100111" when CONTA = "111001" else--57
		  "0010101000" when CONTA = "111010" else--58
		  "0010101001" when CONTA = "111011";--59
end circuito_Decod_seg;