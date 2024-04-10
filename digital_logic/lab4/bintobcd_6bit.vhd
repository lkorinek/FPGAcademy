library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bintobcd_6bit is
	port (bin_num : in std_logic_vector(5 downto 0);
			bcd0 : out std_logic_vector(3 downto 0);
			bcd1 : out std_logic_vector(3 downto 0));
end;

architecture Behavior of bintobcd_6bit is
begin
	
	process(bin_num)
		variable reg : unsigned(13 downto 0) := (others => '0');
	begin
		reg(13 downto 6) := (others => '0');
		reg(5 downto 0) := unsigned(bin_num);
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
end;





