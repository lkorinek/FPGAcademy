library ieee;
use ieee.std_logic_1164.all;

entity part5 is
	port (SW : in std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6);
			HEX2 : out std_logic_vector(0 to 6);
			HEX3 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part5 is
component char_7seg
	port (c : in std_logic_vector(1 downto 0);
			display : out std_logic_vector(0 to 6));
end component;
component mux_2bit_4to1
	port (s, u, v, w, x : in std_logic_vector(1 downto 0);
			m : out std_logic_vector(1 downto 0));
end component;

	signal mux_seg0_out : std_logic_vector(1 downto 0);
	signal mux_seg1_out : std_logic_vector(1 downto 0);
	signal mux_seg2_out : std_logic_vector(1 downto 0);
	signal mux_seg3_out : std_logic_vector(1 downto 0);
begin
	mux_seg0 : mux_2bit_4to1 port map(SW(9 downto 8), SW(7 downto 6), SW(5 downto 4), SW(3 downto 2), SW(1 downto 0), mux_seg0_out);
	mux_seg1 : mux_2bit_4to1 port map(SW(9 downto 8), SW(5 downto 4), SW(3 downto 2), SW(1 downto 0), SW(7 downto 6), mux_seg1_out);
	mux_seg2 : mux_2bit_4to1 port map(SW(9 downto 8), SW(3 downto 2), SW(1 downto 0), SW(7 downto 6), SW(5 downto 4), mux_seg2_out);
	mux_seg3 : mux_2bit_4to1 port map(SW(9 downto 8), SW(1 downto 0), SW(7 downto 6), SW(5 downto 4), SW(3 downto 2), mux_seg3_out);
	seg0 : char_7seg port map(mux_seg0_out, HEX0);
	seg1 : char_7seg port map(mux_seg1_out, HEX1);
	seg2 : char_7seg port map(mux_seg2_out, HEX2);
	seg3 : char_7seg port map(mux_seg3_out, HEX3);
end;