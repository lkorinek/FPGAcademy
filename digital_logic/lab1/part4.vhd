library ieee;
use ieee.std_logic_1164.all;

entity part4 is
	port (SW : in std_logic_vector(9 downto 0);
			HEX0 : out std_logic_vector(0 to 6));
end;

architecture Behavior of part4 is
component char_7seg
	port (c : in std_logic_vector(1 downto 0);
			display : out std_logic_vector(0 to 6));
end component;
begin
	seg0 : char_7seg port map(SW(1 downto 0), HEX0);
end;