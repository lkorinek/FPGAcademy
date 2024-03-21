library ieee;
use ieee.std_logic_1164.all;

entity mux_1bit_2to1 is
	port (s : in std_logic;
			x, y : in std_logic;
			m : out std_logic);
end;

architecture Behavior of mux_1bit_2to1 is
begin
	m <= (not s and x) or (s and y);
end;