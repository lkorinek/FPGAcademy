library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part1 is
	port (SW : in std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part1 is
component num_7seg_display
	port (bin_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;
begin
	seg0: num_7seg_display port map(SW(7 downto 4), HEX1);
	seg1: num_7seg_display port map(SW(3 downto 0), HEX0);
end;








