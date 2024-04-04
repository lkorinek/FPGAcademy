library ieee;
use ieee.std_logic_1164.all;

entity part2 is
	port (SW : in std_logic_vector(9 downto 0);
			LEDR : out std_logic_vector(9 downto 0));
end;

architecture Behavior of part2 is
	signal r_g, s_g, qa, qb : std_logic;
	attribute keep : boolean;
	attribute keep of r_g, s_g, qa, qb : signal is true;
begin
	r_g <= not (not SW(0) and SW(1));
	s_g <= not (SW(0) and SW(1));
	qa <= not (s_g and qb);
	qb <= not (r_g and qa);
	
	LEDR(0) <= qa;
end;