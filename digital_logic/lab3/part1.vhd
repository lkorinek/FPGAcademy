library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port (clk, r, s : in std_logic;
			q : out std_logic);
end;

architecture Behavior of part1 is
	signal r_g, s_g, qa, qb : std_logic;
	attribute keep : boolean;
	attribute keep of r_g, s_g, qa, qb : signal is true;
begin
	r_g <= r and clk;
	s_g <= s and clk;
	qa <= not (r_g or qb);
	qb <= not (s_g or qa);
	
	q <= qa;
end;