library IEEE;
use IEEE.Std_Logic_1164.all;

entity DisplayMux is
port (MODE:     in std_logic_vector (39 downto 20);
		CONTA_decod:    in std_logic_vector(19 downto 0);
		SEL_DISP: in std_logic_vector(1 downto 0);
		REG:      out std_logic_vector(19 downto 0)
		);
end DisplayMux;

architecture circuito_Display of DisplayMux is
begin
REG <= "00000110010111101111" when SEL_DISP = "00" else
		 MODE when SEL_DISP = "01" else
		 CONTA_decod when SEL_DISP = "10" else
		 "11111100011100111101";
end circuito_Display;