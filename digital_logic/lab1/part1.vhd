library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port ( SW : in std_logic_vector(9 downto 0);
			 LEDR : out std_logic_vector(9 downto 0));
end;

architecture Behavior of part1 is
begin
	LEDR <= SW;
end;
