library IEEE;
use IEEE.Std_Logic_1164.all;

entity Decod7seg is  
port (
	A: in std_logic_vector(4 downto 0);
	HEX: out std_logic_vector(6 downto 0)
);
end Decod7seg;
  
architecture circuito_Decod7seg of Decod7seg is
begin
HEX <= 
	"1000000" when A = "00000" else -- 0
	"1111001" when A = "00001" else -- 1
	"0100100" when A = "00010" else -- 2
	"0110000" when A = "00011" else -- 3
	"0011001" when A = "00100" else -- 4
	"0010010" when A = "00101" else -- 5
	"0000010" when A = "00110" else -- 6
	"1111000" when A = "00111" else -- 7
	"0000000" when A = "01000" else -- 8
	"0010000" when A = "01001" else -- 9
	"0001000" when A = "01010" else -- A
	"0000011" when A = "01011" else -- b
	"1000110" when A = "01100" else -- C
	"0100001" when A = "01101" else -- d
	"0000110" when A = "01110" else -- E
	"0001110" when A = "01111" else -- F
	"0010000" when A = "10000" else -- G
	"0001001" when A = "10001" else -- H
	"1111001" when A = "10010" else -- I
	"1100001" when A = "10011" else -- J
	"0000101" when A = "10100" else -- K
	"1000111" when A = "10101" else -- L
	"0101011" when A = "10110" else -- M
	"1001000" when A = "10111" else -- N
	"0001100" when A = "11000" else -- P
	"1000000" when A = "11001" else -- O
	"0011000" when A = "11010" else -- Q
	"0101111" when A = "11011" else -- R
	"0010010" when A = "11100" else -- S
	"0000111" when A = "11101" else -- T
	"1000001" when A = "11110" else -- U
	"1111111" when A = "11111"; -- ""
end circuito_Decod7seg;