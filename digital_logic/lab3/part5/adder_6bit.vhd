library ieee;
use ieee.std_logic_1164.all;

entity adder_6bit is
	port (c_in : in std_logic;
			a, b : in std_logic_vector(5 downto 0);
			s : out std_logic_vector(5 downto 0);
			c_out: out std_logic);
end;

architecture Behavior of adder_6bit is
component full_adder 
	port (c_in : in std_logic;
			a, b : in std_logic;
			s : out std_logic;
			c_out: out std_logic);
end component;
signal c_1: std_logic;
signal c_2: std_logic;
signal c_3: std_logic;
signal c_4: std_logic;
signal c_5: std_logic;

begin
	fa0: full_adder port map(c_in, a(0), b(0), s(0), c_1);
	fa1: full_adder port map(c_1, a(1), b(1), s(1), c_2);
	fa2: full_adder port map(c_2, a(2), b(2), s(2), c_3);
	fa3: full_adder port map(c_3, a(3), b(3), s(3), c_4);
	fa4: full_adder port map(c_4, a(4), b(4), s(4), c_5);
	fa5: full_adder port map(c_5, a(5), b(5), s(5), c_out);
end;










