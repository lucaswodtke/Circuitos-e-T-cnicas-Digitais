library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
	
entity CONTA_DESC is
port(
		CLK1: in std_logic;
		SEL_TIME: in std_logic_vector(9 downto 0);
		SET_TIME: in std_logic;	
		EN: in std_logic;
		RST_CONT: in std_logic;
		CONTA: out std_logic_vector(9 downto 0)
	);
end CONTA_DESC;

architecture bhv of CONTA_DESC is

signal contador: std_logic_vector(5 downto 0);
signal contadorMin: std_logic_vector(3 downto 0);

begin
	
P1: process(CLK1,RST_CONT,sel_time,contador,contadorMin) 
	begin
	
	if RST_CONT = '1' then
		contador<= "000000";
		contadorMin<="0000";
	elsif CLK1'event and CLK1= '1' then
		if set_time = '1' then
			contador<= sel_time (5 downto 0);
			contadorMin<= sel_time (9 downto 6);
			elsif EN='1' then
				contador <= contador -'1';
				if contador = "000000" then
					contador <= "111011";
					contadorMin <= contadorMin -'1';
			end if;
		end if;
	end if;
end process;
		CONTA(9 downto 6) <=contadorMin;
		CONTA(5 downto 0)<=contador;
end bhv;