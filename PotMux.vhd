library IEEE;
use IEEE.Std_Logic_1164.all;

entity PotMux is
port (SW:      in std_logic_vector(9 downto 0); 
      MODE:    in std_logic_vector(9 downto 0);
		IN_POT:  in std_logic;
		SEL_POT: out std_logic_vector(9 downto 0)
		);
end PotMux;

architecture circuito_Pot of PotMux is
begin
SEL_POT <= SW when IN_POT = '0' else
		     MODE;
end circuito_Pot;