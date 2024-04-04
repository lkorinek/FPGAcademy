library ieee;
use ieee.std_logic_1164.all;

entity part3 is
	port (SW : in std_logic_vector(9 downto 0);
			LEDR : out std_logic_vector(9 downto 0));
end;

architecture Behavior of part3 is
component d_latch
	port (d, clk : in std_logic;
			q : out std_logic);
end component;
signal q_master: std_logic;
signal clk_n: std_logic;

begin
	clk_n <= not SW(1);
	master: d_latch port map(SW(0), clk_n, q_master);
	slave: d_latch port map(q_master, SW(1), LEDR(0));
end;