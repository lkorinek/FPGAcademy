library ieee;
use ieee.std_logic_1164.all;

entity comparator_9 is
	port (bin_num : in std_logic_vector(3 downto 0);
			z : out std_logic);
end;

architecture Behavior of comparator_9 is
begin
	z <= (bin_num(3) and bin_num(2)) or (bin_num(3) and bin_num(1));
end;

