library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part5 is
	port (CLOCK_50 : in std_logic;
			SW		: in std_logic_vector(9 downto 0);
			HEX0 	: out std_logic_vector(0 to 6);
			HEX1 	: out std_logic_vector(0 to 6);
			HEX2 	: out std_logic_vector(0 to 6);
			HEX3 	: out std_logic_vector(0 to 6);
			HEX4 	: out std_logic_vector(0 to 6);
			HEX5 	: out std_logic_vector(0 to 6));
end entity;

architecture Behavior of part5 is

component counter
	generic (
		NUM : integer);
	port (clk, clear_n, en : in std_logic;
			q 	: out std_logic_vector(NUM-1 downto 0));
end component;

component rotate_de1
	port (sel : in std_logic_vector(2 downto 0);
			hex0 : out std_logic_vector(0 to 6);
			hex1 : out std_logic_vector(0 to 6);
			hex2 : out std_logic_vector(0 to 6);
			hex3 : out std_logic_vector(0 to 6);
			hex4 : out std_logic_vector(0 to 6);
			hex5 : out std_logic_vector(0 to 6));
end component;

signal counter_en_c_n : std_logic;
signal counter_en_q : std_logic_vector(25 downto 0);

signal counter_c_n : std_logic;
signal counter_q : std_logic_vector(2 downto 0);

signal counter_en : std_logic;

begin
	counter_enable : counter 
	generic map (26)
	port map (CLOCK_50, counter_en_c_n, SW(0), counter_en_q);
	
	process(counter_en_q)
	begin
		if 25000000 = to_integer(unsigned(counter_en_q)) then
			counter_en <= '1';
			counter_en_c_n <= '0';
		else
			counter_en <= '0';
			counter_en_c_n <= '1';
		end if;
	end process;
	
	counter_0 : counter 
	generic map (3)
	port map (CLOCK_50, counter_c_n, counter_en, counter_q);
	
	process(counter_q)
	begin
		if 6 = to_integer(unsigned(counter_q)) then
			counter_c_n <= '0';
		else
			counter_c_n <= '1';
		end if;
	end process;
	
	display_txt : rotate_de1 port map (counter_q, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
end;
