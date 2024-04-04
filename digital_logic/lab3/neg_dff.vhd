library ieee;
use ieee.std_logic_1164.all;

entity neg_dff is
	port (d, clk : in std_logic;
			q : out std_logic);
end;

architecture Behavior of neg_dff is
component d_latch
	port (d, clk : in std_logic;
			q : out std_logic);
end component;
signal q_master: std_logic;
signal clk_n: std_logic;

begin
	clk_n <= not clk;
	master: d_latch port map(d, clk, q_master);
	slave: d_latch port map(q_master, clk_n, q);
end;