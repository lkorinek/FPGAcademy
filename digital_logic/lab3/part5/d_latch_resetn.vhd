library ieee;
use ieee.std_logic_1164.all;

entity d_latch_resetn is
	port (d, clk, r_n : in std_logic;
			q : out std_logic);
end;

architecture Behavior of d_latch_resetn is
begin
	process(d, clk, r_n)
	begin
		if r_n = '0' then
			q <= '0';
		elsif clk = '1' then
			q <= d;
		end if;
	end process;
end;