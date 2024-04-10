library ieee;
use ieee.std_logic_1164.all;

entity mux_2bit_6to1 is
	port (s, u, v, w, x, y, z : in std_logic_vector(2 downto 0);
			m : out std_logic_vector(2 downto 0));
end;
architecture Behavior of mux_2bit_6to1 is
begin
	with s select m <=
	u when "000",
	v when "001",
	w when "010",
	x when "011",
	y when "100",
	z when "101",
	u when others;
end;