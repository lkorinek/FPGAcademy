library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
	generic (n : integer := 4);
	port (s : in std_logic;
			x, y : in std_logic_vector(n-1 downto 0);
			m : out std_logic_vector(n-1 downto 0));
end;

architecture Behavior of mux_2to1 is
begin
	with s select m <=
	x when '0',
	y when '1';
end;