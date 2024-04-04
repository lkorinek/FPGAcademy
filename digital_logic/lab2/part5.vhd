library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part5 is
	port (SW : in std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6);
			HEX3 : out std_logic_vector(0 to 6);
			HEX5 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part5 is
component num_7seg_display
	port (bin_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;

signal t0, z0 : integer := 0;
signal c1 : std_logic;
signal c0_extended : std_logic_vector(3 downto 0);
signal s0, s1 : std_logic_vector(3 downto 0);

begin
	seg0: num_7seg_display port map(SW(7 downto 4), HEX5);
	seg1: num_7seg_display port map(SW(3 downto 0), HEX3);
	
	process(SW)
	begin
		c0_extended <= "000" & SW(8);
		t0 <= to_integer(unsigned(SW(7 downto 4))) + 
				to_integer(unsigned(SW(3 downto 0))) + 
				to_integer(unsigned(c0_extended));
		if t0 > 9 then
			z0 <= 10;
			c1 <= '1';
		else
			z0 <= 0;
			c1 <= '0';
		end if;
		s0 <= std_logic_vector(to_unsigned(t0 - z0, 4));
		s1 <= "000" & c1;
	end process;
	
	seg2: num_7seg_display port map(s1, HEX1);
	seg3: num_7seg_display port map(s0, HEX0);
end;





