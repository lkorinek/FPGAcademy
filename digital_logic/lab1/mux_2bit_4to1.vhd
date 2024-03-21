library ieee;
use ieee.std_logic_1164.all;

entity mux_2bit_4to1 is
	port (s, u, v, w, x : in std_logic_vector(1 downto 0);
			m : out std_logic_vector(1 downto 0));
end;

architecture Behavior of mux_2bit_4to1 is
component mux_2bit_2to1
	port (s : in std_logic;
			x, y : in std_logic_vector(1 downto 0);
			m : out std_logic_vector(1 downto 0));
end component;
	
	signal mux1out : std_logic_vector(1 downto 0);
	signal mux2out : std_logic_vector(1 downto 0);
begin
	mux1 : mux_2bit_2to1 port map(s(0), u, v, mux1out);
	mux2 : mux_2bit_2to1 port map(s(0), w, x, mux2out);
	mux3 : mux_2bit_2to1 port map(s(1), mux1out, mux2out, m);
end;
