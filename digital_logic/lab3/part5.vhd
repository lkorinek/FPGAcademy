library ieee;
use ieee.std_logic_1164.all;

entity part5 is
	port (SW   : in std_logic_vector(9 downto 0);
			KEY : in std_logic_vector(0 to 3);
			LEDR : out std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6);
			HEX1 : out std_logic_vector(0 to 6);
			HEX2 : out std_logic_vector(0 to 6);
			HEX3 : out std_logic_vector(0 to 6);
			HEX4 : out std_logic_vector(0 to 6);
			HEX5 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part5 is

component num_7seg_display
	port (bcd_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;

component bintobcd_6bit
	port (bin_num : in std_logic_vector(5 downto 0);
			bcd0 : out std_logic_vector(3 downto 0);
			bcd1 : out std_logic_vector(3 downto 0));
end component;

component adder_6bit
	port (c_in : in std_logic;
			a, b : in std_logic_vector(5 downto 0);
			s : out std_logic_vector(5 downto 0);
			c_out: out std_logic);
end component;

component reg_6bit
	port (clk, r_n : in std_logic;
			d : in std_logic_vector(5 downto 0);
			q : out std_logic_vector(5 downto 0));
end component;

signal a_in : std_logic_vector(5 downto 0);
signal b_in : std_logic_vector(5 downto 0);
signal a_reg : std_logic_vector(5 downto 0);
signal b_reg : std_logic_vector(5 downto 0);
signal sum : std_logic_vector(5 downto 0);

type t_bcd_array is array (0 to 5) of std_logic_vector(3 downto 0);
signal bcd_array: t_bcd_array;

begin	
	with SW(0) select a_in <=
		SW(6 downto 1) when '0',
		a_reg when '1';
		
	with SW(0) select b_in <=
		SW(6 downto 1) when '1',
		b_reg when '0';
		
	reg_6bit_inst0: reg_6bit port map(KEY(1), KEY(0), a_in, a_reg);
	reg_6bit_inst1: reg_6bit port map(KEY(1), KEY(0), b_in, b_reg);
	
	LEDR(1) <= KEY(0);
	LEDR(2) <= KEY(1);
	adder_6bit_inst0: adder_6bit port map('0', a_reg, b_reg, sum, LEDR(0));
	
	bintobcd_6bit_inst0: bintobcd_6bit port map(a_reg, bcd_array(0), bcd_array(1));
	bintobcd_6bit_inst1: bintobcd_6bit port map(b_reg, bcd_array(2), bcd_array(3));
	bintobcd_6bit_inst2: bintobcd_6bit port map(sum, bcd_array(4), bcd_array(5));
	
	num_7seg_display_inst0: num_7seg_display port map(bcd_array(0), HEX4);
	num_7seg_display_inst1: num_7seg_display port map(bcd_array(1), HEX5);
	num_7seg_display_inst2: num_7seg_display port map(bcd_array(2), HEX2);
	num_7seg_display_inst3: num_7seg_display port map(bcd_array(3), HEX3);
	num_7seg_display_inst4: num_7seg_display port map(bcd_array(4), HEX0);
	num_7seg_display_inst5: num_7seg_display port map(bcd_array(5), HEX1);
end;