library ieee;
use ieee.std_logic_1164.all;

entity pos_dff_resetn is
	port (d, clk, r_n : in std_logic;
			q : out std_logic);
end;

architecture Behavior of pos_dff_resetn is
component d_latch_resetn
	port (d, clk, r_n : in std_logic;
			q : out std_logic);
end component;
signal q_master: std_logic;
signal clk_n: std_logic;

begin
	clk_n <= not clk;
	master: d_latch_resetn port map(d, clk_n, r_n, q_master);
	slave: d_latch_resetn port map(q_master, clk, r_n, q);
end;
