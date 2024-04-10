library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	generic (
		NUM : integer := 12);
	port (clk, clear_n, en : in std_logic;
			q 	: out std_logic_vector(NUM-1 downto 0));
end entity;

architecture Behavior of counter is

begin
	process(clk)
		variable count : unsigned(NUM-1 downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			if clear_n = '0' then
				count := (others => '0');
			elsif en = '1' then
				count := count + 1;
			end if;
		end if;
		q <= std_logic_vector(count);
	end process;
end;