library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port (c_in : in std_logic;
			a, b : in std_logic;
			s : out std_logic;
			c_out: out std_logic);
end;

architecture Behavior of full_adder is
component mux_2to1 is
	generic (n : integer);
	port (s : in std_logic;
			x, y : in std_logic;
			m : out std_logic);
end component;
begin
	s <= c_in xor (a xor b);
	mux: mux_2to1 
	generic map(n => 1)
	port map(a xor b, b, c_in, c_out);
end;









