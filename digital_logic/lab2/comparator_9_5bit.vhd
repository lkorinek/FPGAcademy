library ieee;
use ieee.std_logic_1164.all;

entity comparator_9_5bit is
	port (bin_num : in std_logic_vector(4 downto 0);
			z : out std_logic);
end;

architecture Behavior of comparator_9_5bit is
begin
	z <= bin_num(4) or (bin_num(3) and bin_num(2)) or (bin_num(3) and bin_num(1));
end;

