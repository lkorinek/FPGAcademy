library ieee;
use ieee.std_logic_1164.all;

entity mux_5bit_2to1 is
	port (z : in std_logic;
			x, y : in std_logic_vector(4 downto 0);
			m : out std_logic_vector(4 downto 0));
end;

architecture Behavior of mux_5bit_2to1 is
begin
	with z select m <=
	x when '0',
	y when '1';
end;