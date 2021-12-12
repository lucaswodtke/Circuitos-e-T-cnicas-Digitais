library IEEE;
use IEEE.Std_Logic_1164.all;

entity combContaRst is
port (RST:      in std_logic; 
      RESET_TIME:    in std_logic;
		RST_CONT: out std_logic
		);
end combContaRst;

architecture circuito_combContaRst of combContaRst is
begin
--RST_CONT <= RST when  RST = '0' else
		     --RESET_TIME;

			  RST_CONT <= (not RST) or RESET_TIME;
end circuito_combContaRst;