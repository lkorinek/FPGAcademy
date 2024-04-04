library ieee;
use ieee.std_logic_1164.all;

entity bin_to_dec is
	port (bin_num : in std_logic_vector(4 downto 0);
			bcd_num0 : out std_logic_vector(3 downto 0);
			bcd_num1 : out std_logic_vector(3 downto 0));
end;

architecture Behavior of bin_to_dec is
component mux_2to1
	port (s : in std_logic;
			x, y : in std_logic_vector(3 downto 0);
			m : out std_logic_vector(3 downto 0));
end component;
component comparator_9_5bit
	port (bin_num : in std_logic_vector(4 downto 0);
			z : out std_logic);
end component;
component circuit_a_5bit
	port (bin_num : in std_logic_vector(4 downto 0);
			a_out : out std_logic_vector(3 downto 0));
end component;

signal z_signal : std_logic;
signal a_signal : std_logic_vector(3 downto 0);
signal mux_out : std_logic_vector(4 downto 0);
begin
	comp_inst: comparator_9_5bit port map(bin_num, z_signal);
	circuit_a_inst: circuit_a_5bit port map(bin_num, a_signal);
	mux_inst: mux_2to1 port map(z_signal, bin_num(3 downto 0), a_signal, bcd_num0);
	bcd_num1 <= "000" & z_signal;
end;

