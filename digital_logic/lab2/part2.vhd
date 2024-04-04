library ieee;
use ieee.std_logic_1164.all;

entity part2 is
	port (SW : in std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part2 is
component num_7seg_display
	port (bin_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;
component mux_2to1
	port (z : in std_logic;
			x, y : in std_logic_vector(3 downto 0);
			m : out std_logic_vector(3 downto 0));
end component;
component comparator_9
	port (bin_num : in std_logic_vector(3 downto 0);
			z : out std_logic);
end component;
component circuit_a
	port (bin_num : in std_logic_vector(3 downto 0);
			a_out : out std_logic_vector(3 downto 0));
end component;

signal z_signal : std_logic;
signal a_signal : std_logic_vector(3 downto 0);
signal mux_out : std_logic_vector(3 downto 0);
begin
	comp_inst: comparator_9 port map(SW(3 downto 0), z_signal);
	circuit_a_inst: circuit_a port map(SW(3 downto 0), a_signal);
	mux_inst: mux_2to1 port map(z_signal, SW(3 downto 0), a_signal, mux_out);
	seg0: num_7seg_display port map("000" & z_signal, HEX1);
	seg1: num_7seg_display port map(mux_out, HEX0);
end;

