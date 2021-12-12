library IEEE;
use IEEE.Std_Logic_1164.all;

entity EstadosMux is
port (REG_OPEN, OUT_POT, REG_ALARM: in std_logic_vector(9 downto 0);
		SEL_LED: in std_logic_vector(1 downto 0);
		LED_OUT: out std_logic_vector(9 downto 0)
		);
end EstadosMux;

architecture circuito_Estado of EstadosMux is
begin
LED_OUT <= "0000000000" when  SEL_LED= "00" else
		     REG_OPEN when SEL_LED = "01" else
		     OUT_POT when SEL_LED = "10" else
		     REG_ALARM;
end circuito_Estado;