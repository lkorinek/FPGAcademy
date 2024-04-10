library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port (SW		: in std_logic_vector(9 downto 0);
			KEY  	: in std_logic_vector(0 to 3);
			HEX0 	: out std_logic_vector(0 to 6);
			HEX1 	: out std_logic_vector(0 to 6));
end entity;

architecture Behavior of part1 is

component bintobcd_6bit
	port (bin_num : in std_logic_vector(5 downto 0);
			bcd0 : out std_logic_vector(3 downto 0);
			bcd1 : out std_logic_vector(3 downto 0));
end component;

component num_7seg_display
	port (bcd_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;

component t_ff
	port (t, clk, clear_n : in std_logic;
			q : out std_logic);
end component;

signal bin_num: std_logic_vector(5 downto 0);

signal t1: std_logic;
signal t2: std_logic;
signal t3: std_logic;
signal t4: std_logic;
signal t5: std_logic;

signal bcd0: std_logic_vector(3 downto 0);
signal bcd1: std_logic_vector(3 downto 0);

begin
	t_ff_inst0: t_ff port map(SW(1), KEY(0), SW(0), bin_num(0));
	t1 <= bin_num(0) and SW(1);
	t_ff_inst1: t_ff port map(t1, KEY(0), SW(0), bin_num(1));
	t2 <= bin_num(0) and bin_num(1) and SW(1);
	t_ff_inst2: t_ff port map(t2, KEY(0), SW(0), bin_num(2));
	t3 <= bin_num(0) and bin_num(1) and bin_num(2) and SW(1);
	t_ff_inst3: t_ff port map(t3, KEY(0), SW(0), bin_num(3));
	t4 <= bin_num(0) and bin_num(1) and bin_num(2) and bin_num(3) and SW(1);
	t_ff_inst4: t_ff port map(t4, KEY(0), SW(0), bin_num(4));
	t5 <= bin_num(0) and bin_num(1) and bin_num(2) and bin_num(3) and bin_num(4) and SW(1);
	t_ff_inst5: t_ff port map(t5, KEY(0), SW(0), bin_num(5));
	
	bintobcd_6bit_inst0: bintobcd_6bit port map(bin_num, bcd0, bcd1);
	
	num_7seg_display_inst0: num_7seg_display port map(bcd0, HEX0);
	num_7seg_display_inst1: num_7seg_display port map(bcd1, HEX1);

end;
