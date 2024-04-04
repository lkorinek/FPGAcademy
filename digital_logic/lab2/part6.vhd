library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part6 is
	port (SW : in std_logic_vector(9 downto 0);
			LEDR : out std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part6 is
component num_7seg_display
	port (bin_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;

signal bcd0, bcd1 : std_logic_vector(3 downto 0);

begin
	
	process(SW)
		variable reg : unsigned(13 downto 0) := (others => '0');
	begin
		reg(13 downto 6) := (others => '0');
		reg(5 downto 0) := unsigned(SW(5 downto 0));
		for i in 1 to 6 loop
			if reg(13 downto 10) > 4 then
				reg(13 downto 10) := reg(13 downto 10) + 3;
			end if;
			if reg(9 downto 6) > 4 then
				reg(13 downto 6) := reg(13 downto 6) + 3;
			end if;
			reg := shift_left(reg, 1);
		end loop;
		bcd0 <= std_logic_vector(reg(9 downto 6));
		bcd1 <= std_logic_vector(reg(13 downto 10));
	end process;
	
	LEDR(5 downto 0) <= SW(5 downto 0);
	seg0 : num_7seg_display port map(bcd0, HEX0);
	seg1 : num_7seg_display port map(bcd1, HEX1);
end;





