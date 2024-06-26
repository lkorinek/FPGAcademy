library ieee;
use ieee.std_logic_1164.all;

entity mux_2bit_2to1 is
	port (s : in std_logic;
			x, y : in std_logic_vector(1 downto 0);
			m : out std_logic_vector(1 downto 0));
end;

architecture Behavior of mux_2bit_2to1 is
begin
	with s select m <=
	x when '0',
	y when '1';
end;