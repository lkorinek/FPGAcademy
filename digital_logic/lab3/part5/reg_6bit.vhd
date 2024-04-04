library ieee;
use ieee.std_logic_1164.all;

entity reg_6bit is
	port (clk, r_n : in std_logic;
			d : in std_logic_vector(5 downto 0);
			q : out std_logic_vector(5 downto 0));
end;

architecture Behavior of reg_6bit is
component pos_dff_resetn
	port (d, clk, r_n : in std_logic;
			q : out std_logic);
end component;

begin
	dff_inst0: pos_dff_resetn port map(d(0), clk, r_n, q(0));
	dff_inst1: pos_dff_resetn port map(d(1), clk, r_n, q(1));
	dff_inst2: pos_dff_resetn port map(d(2), clk, r_n, q(2));
	dff_inst3: pos_dff_resetn port map(d(3), clk, r_n, q(3));
	dff_inst4: pos_dff_resetn port map(d(4), clk, r_n, q(4));
	dff_inst5: pos_dff_resetn port map(d(5), clk, r_n, q(5));
end;