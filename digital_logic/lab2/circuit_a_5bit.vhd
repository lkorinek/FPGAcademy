library ieee;
use ieee.std_logic_1164.all;

entity circuit_a_5bit is
	port (bin_num : in std_logic_vector(4 downto 0);
			a_out : out std_logic_vector(3 downto 0));
end;

architecture Behavior of circuit_a_5bit is
begin
	with bin_num(4) select a_out <=
	not bin_num(3) & (bin_num(2) and bin_num(1)) & not bin_num(1) & bin_num(0) when '0',
	 bin_num(1) &  not bin_num(1) &  not bin_num(1) & bin_num(0) when '1';
end;










