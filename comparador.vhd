library IEEE;
use IEEE.Std_Logic_1164.all;

entity comparador is
port (
		CONTA: in std_logic_vector(9 downto 0);
		READY: out std_logic
);
end comparador;
  
architecture circuito_comparador of comparador is
begin
READY <= '1' when (CONTA="0000000000")else '0';
end circuito_comparador;