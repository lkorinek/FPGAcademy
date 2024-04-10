library ieee;
use ieee.std_logic_1164.all;

entity part6 is
	port (SW : in std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6);
			HEX2 : out std_logic_vector(0 to 6);
			HEX3 : out std_logic_vector(0 to 6);
			HEX4 : out std_logic_vector(0 to 6);
			HEX5 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part6 is
	constant CHAR_d 		: std_logic_vector(2 downto 0) := "000";
	constant CHAR_E 		: std_logic_vector(2 downto 0) := "001";
	constant CHAR_1 		: std_logic_vector(2 downto 0) := "010";
	constant CHAR_BLANK 	: std_logic_vector(2 downto 0) := "011";

component mux_2bit_6to1
	port (s, u, v, w, x, y, z : in std_logic_vector(2 downto 0);
			m : out std_logic_vector(2 downto 0));
end component;
component char_7seg_3bit
	port (c : in std_logic_vector(2 downto 0);
			display : out std_logic_vector(0 to 6));
end component;

	signal mux_seg0_out : std_logic_vector(2 downto 0);
	signal mux_seg1_out : std_logic_vector(2 downto 0);
	signal mux_seg2_out : std_logic_vector(2 downto 0);
	signal mux_seg3_out : std_logic_vector(2 downto 0);
	signal mux_seg4_out : std_logic_vector(2 downto 0);
	signal mux_seg5_out : std_logic_vector(2 downto 0);
begin
	mux_seg0 : mux_2bit_6to1 port map(SW(9 downto 7), CHAR_BLANK, CHAR_BLANK, CHAR_BLANK, CHAR_d, CHAR_E, CHAR_1, mux_seg0_out);
	mux_seg1 : mux_2bit_6to1 port map(SW(9 downto 7), CHAR_BLANK, CHAR_BLANK, CHAR_d, CHAR_E, CHAR_1, CHAR_BLANK, mux_seg1_out);
	mux_seg2 : mux_2bit_6to1 port map(SW(9 downto 7), CHAR_BLANK, CHAR_d, CHAR_E, CHAR_1, CHAR_BLANK, CHAR_BLANK, mux_seg2_out);
	mux_seg3 : mux_2bit_6to1 port map(SW(9 downto 7), CHAR_d, CHAR_E, CHAR_1, CHAR_BLANK, CHAR_BLANK, CHAR_BLANK, mux_seg3_out);
	mux_seg4 : mux_2bit_6to1 port map(SW(9 downto 7), CHAR_E, CHAR_1, CHAR_BLANK, CHAR_BLANK, CHAR_BLANK, CHAR_d, mux_seg4_out);
	mux_seg5 : mux_2bit_6to1 port map(SW(9 downto 7), CHAR_1, CHAR_BLANK, CHAR_BLANK, CHAR_BLANK, CHAR_d, CHAR_E, mux_seg5_out);
	
	seg0 : char_7seg_3bit port map(mux_seg0_out, HEX0);
	seg1 : char_7seg_3bit port map(mux_seg1_out, HEX1);
	seg2 : char_7seg_3bit port map(mux_seg2_out, HEX2);
	seg3 : char_7seg_3bit port map(mux_seg3_out, HEX3);
	seg4 : char_7seg_3bit port map(mux_seg4_out, HEX4);
	seg5 : char_7seg_3bit port map(mux_seg5_out, HEX5);
end;