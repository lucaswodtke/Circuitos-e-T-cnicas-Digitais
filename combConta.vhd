library IEEE;
use IEEE.Std_Logic_1164.all;

entity combConta is
port (PAUSE:      in std_logic; 
      EN_TIME:    in std_logic;
		EN: out std_logic
		);
end combConta;

architecture circuito_combConta of combConta is
begin
EN <= PAUSE and EN_TIME;
end circuito_combConta;