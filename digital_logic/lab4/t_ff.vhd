library ieee;
use ieee.std_logic_1164.all;

entity t_ff is
	port (t, clk, clear_n : in std_logic;
			q : out std_logic);
end entity;

architecture Behavior of t_ff is
begin
	process(clk)
		variable reg : std_logic := '0';
	begin
		if rising_edge(clk) then
			if clear_n = '0' then
				reg := '0';
			elsif t = '1' then
				reg := not reg;
			end if;
		end if;
		q <= reg;
	end process;
end;
