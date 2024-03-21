library ieee;
use ieee.std_logic_1164.all;

entity part3 is
	port (SW : in std_logic_vector(9 downto 0);
			LEDR : out std_logic_vector(9 downto 0));
end;

architecture Behavior of part3 is
component mux_2bit_4to1
	port (s, u, v, w, x : in std_logic_vector(1 downto 0);
			m : out std_logic_vector(1 downto 0));
end component;

begin 
	ledr1mux : mux_2bit_4to1 port map(SW(9 downto 8), 
												 SW(7 downto 6),
												 SW(5 downto 4),
												 SW(3 downto 2),
												 SW(1 downto 0),
												 LEDR(1 downto 0));
end;