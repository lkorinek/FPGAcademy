library ieee;
use ieee.std_logic_1164.all;

entity part2 is
	port (SW : in std_logic_vector(9 downto 0);
			LEDR : out std_logic_vector(9 downto 0));
end;

architecture Behavior of part2 is
component mux_1bit_2to1
	port (s : in std_logic;
			x, y : in std_logic;
			m : out std_logic);
end component;

begin 
	ledr1mux : mux_1bit_2to1 port map(SW(9), SW(7), SW(3), LEDR(3));
	ledr2mux : mux_1bit_2to1 port map(SW(9), SW(6), SW(2), LEDR(2));
	ledr3mux : mux_1bit_2to1 port map(SW(9), SW(5), SW(1), LEDR(1));
	ledr4mux : mux_1bit_2to1 port map(SW(9), SW(4), SW(0), LEDR(0));
end;