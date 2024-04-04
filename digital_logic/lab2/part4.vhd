library ieee;
use ieee.std_logic_1164.all;

entity part4 is
	port (SW : in std_logic_vector(9 downto 0);
			LEDR : out std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part4 is

component adder_4bit
	port (c_in : in std_logic;
			a, b : in std_logic_vector(3 downto 0);
			s : out std_logic_vector(4 downto 0));
end component;
component bin_to_dec
	port (bin_num : in std_logic_vector(4 downto 0);
			bcd_num0 : out std_logic_vector(3 downto 0);
			bcd_num1 : out std_logic_vector(3 downto 0));
end component;
component num_7seg_display
	port (bin_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;
component comparator_9
	port (bin_num : in std_logic_vector(3 downto 0);
			z : out std_logic);
end component;

signal sum: std_logic_vector(4 downto 0);
signal bcd0: std_logic_vector(3 downto 0);
signal bcd1: std_logic_vector(3 downto 0);
signal over_bcd0: std_logic;
signal over_bcd1: std_logic;
begin
	adder: adder_4bit port map(SW(8), SW(7 downto 4), SW(3 downto 0), sum);
	bd: bin_to_dec port map(sum, bcd0, bcd1);
	seg0: num_7seg_display port map(bcd0, HEX0);
	seg1: num_7seg_display port map(bcd1, HEX1);
	comp0: comparator_9 port map(SW(7 downto 4), over_bcd0);
	comp1: comparator_9 port map(SW(3 downto 0), over_bcd1);
	LEDR(7) <= over_bcd0;
	LEDR(8) <= over_bcd1;
	LEDR(9) <= over_bcd0 or over_bcd1;
end;





