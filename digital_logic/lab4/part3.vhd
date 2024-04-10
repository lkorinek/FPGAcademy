library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part3 is
	port (CLOCK_50 : in std_logic;
			SW		: in std_logic_vector(9 downto 0);
			HEX0 	: out std_logic_vector(0 to 6));
end entity;

architecture Behavior of part3 is

component num_7seg_display
	port (bcd_num : in std_logic_vector(3 downto 0);
			hex : out std_logic_vector(0 to 6));
end component;

component counter
	generic (
		NUM : integer);
	port (clk, clear_n, en : in std_logic;
			q 	: out std_logic_vector(NUM-1 downto 0));
end component;

signal counter_en_c_n : std_logic;
signal counter_en_q : std_logic_vector(25 downto 0);

signal counter_c_n : std_logic;
signal counter_q : std_logic_vector(3 downto 0);

signal counter_en : std_logic;

begin
	counter_enable : counter 
	generic map (26)
	port map (CLOCK_50, counter_en_c_n, SW(0), counter_en_q);
	
	process(counter_en_q)
	begin
		if 50000000 = to_integer(unsigned(counter_en_q)) then
			counter_en <= '1';
			counter_en_c_n <= '0';
		else
			counter_en <= '0';
			counter_en_c_n <= '1';
		end if;
	end process;
	
	counter_0 : counter 
	generic map (4)
	port map (CLOCK_50, counter_c_n, counter_en, counter_q);
	
	process(counter_q)
	begin
		if 10 = to_integer(unsigned(counter_q)) then
			counter_c_n <= '0';
		else
			counter_c_n <= '1';
		end if;
	end process;
	
	seg0 : num_7seg_display port map(counter_q, HEX0);
end;