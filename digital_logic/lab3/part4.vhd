library ieee;
use ieee.std_logic_1164.all;

entity part4 is
	port (clk, d : in std_logic;
			qa, qb, qc : out std_logic);
end;

architecture Behavior of part4 is
component d_latch
	port (d, clk : in std_logic;
			q : out std_logic);
end component;
component pos_dff
	port (d, clk : in std_logic;
			q : out std_logic);
end component;
component neg_dff
	port (d, clk : in std_logic;
			q : out std_logic);
end component;

begin
	d_latch_inst: d_latch port map(d, clk, qa);
	pos_dff_inst: pos_dff port map(d, clk, qb);
	neg_dff_inst: neg_dff port map(d, clk, qc);
end;