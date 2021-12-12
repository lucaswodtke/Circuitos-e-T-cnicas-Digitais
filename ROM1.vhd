library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is
  port ( SW : in std_logic_vector(2 downto 0);
         MODE : out std_logic_vector(39 downto 0) );
end ROM1;

architecture behavioral of ROM1 is
  type mem is array ( 7 downto 0 ) of std_logic_vector(39 downto 0);
  constant my_Rom : mem := (
    0  => "1100010010110001100100100000000000010000", -- PIPO 2 MINUTOS POTENCIA 5
    1  => "1111101100100010101000100111100000001000", --  ChA 2 MUNITOS E 30 SEGUNDOS POTENCIA 4
    2  => "1010101110100001111001100000000001000000", -- LEgU 6 MINUTOS POTENCIA 7
    3  => "0110001010011110111000100000000000100000", -- CAFE 2 MINUTOS POTENCIA 6
    4  => "1110011001110000101001110000000000100000", -- SOPA 7 MINUTOS POTENCIA 6
    5  => "0101011011110111100101010000000010000000", -- ARRO 5 MINUTOS POTENCIA 8
    6  => "0110001010110111011110101010001000000000", -- CARN 10 MINUTOS E 40 SEGUNDOS POTENCIA 10
    7  => "1100011110011011001010001100100100000000" -- PUDI 8 MINUTOS E 50 SEGUNDOS POTENCIA 9
	 );

begin
   process (SW)
   begin
     case SW is
       when "000" => MODE <= my_rom(0);
       when "001" => MODE <= my_rom(1);
       when "010" => MODE <= my_rom(2);
       when "011" => MODE <= my_rom(3);
       when "100" => MODE <= my_rom(4);
       when "101" => MODE <= my_rom(5);
       when "110" => MODE <= my_rom(6);
       when "111" => MODE <= my_rom(7);
       when others => MODE <= "0000000000000000000000000000000000000000";
	 end case;
  end process;
end architecture behavioral;