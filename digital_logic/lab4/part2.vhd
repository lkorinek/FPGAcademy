library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part2 is
	port (SW		: in std_logic_vector(9 downto 0);
			KEY  	: in std_logic_vector(0 to 3);
			HEX0 	: out std_logic_vector(0 to 6);
			HEX1 	: out std_logic_vector(0 to 6));
end entity;

architecture Behavior of part2 is

component bintobcd_6bit
	port (bin_num : in std_logic_vector(5 downto 0);
			bcd0 : out std_logic_vector(3 downto 0);
			bcd1 : out std_logic_vector(3 downto 0));
end component;

component num_7seg_display
	port (bcd_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;

signal bin_num: std_logic_vector(5 downto 0);

signal bcd0: std_logic_vector(3 downto 0);
signal bcd1: std_logic_vector(3 downto 0);

begin
	process(KEY(0))
		variable bin : unsigned(5 downto 0) := "000000";
	begin
		if rising_edge(KEY(0)) then
			if SW(0) = '0' then
				bin := "000000";
			elsif SW(1) = '1' then
				bin := bin + 1;
			end if;
		end if;
		bin_num <= std_logic_vector(bin);
	end process;
	
	bintobcd_6bit_inst0: bintobcd_6bit port map(bin_num, bcd0, bcd1);
	
	num_7seg_display_inst0: num_7seg_display port map(bcd0, HEX0);
	num_7seg_display_inst1: num_7seg_display port map(bcd1, HEX1);
end;
