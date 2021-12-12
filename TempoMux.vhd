library IEEE;
use IEEE.Std_Logic_1164.all;

entity TempoMux is
port (SW:       in std_logic_vector (9 downto 0); 
      MODE:     in std_logic_vector (19 downto 10);
		SEL_DISP: in std_logic_vector(1 downto 0);
		SEL_DISP_out: inout std_logic;
		SEL_TIME: out std_logic_vector(9 downto 0)
		);
end TempoMux;

architecture TempoMux of TempoMux is
begin
SEL_DISP_out <= not SEL_DISP(1) and SEL_DISP(0);

SEL_TIME <= SW when SEL_DISP_out = '0' else
				MODE(19 downto 10);
end TempoMux;