library ieee;
use ieee.std_logic_1164.all;

entity part3 is
	port (SW : in std_logic_vector(9 downto 0);
			LEDR : out std_logic_vector(9 downto 0));
end;

architecture Behavior of part3 is
component full_adder 
	port (c_in : in std_logic;
			a, b : in std_logic;
			s : out std_logic;
			c_out: out std_logic);
end component;
signal c_1: std_logic;
signal c_2: std_logic;
signal c_3: std_logic;
begin
	fa0: full_adder port map(SW(8), SW(4), SW(0), LEDR(0), c_1);
	fa1: full_adder port map(c_1, SW(5), SW(1), LEDR(1), c_2);
	fa2: full_adder port map(c_2, SW(6), SW(2), LEDR(2), c_3);
	fa3: full_adder port map(c_3, SW(7), SW(3), LEDR(3), LEDR(4));
end;










