library ieee;
use ieee.std_logic_1164.all;

entity char_7seg_3bit is
	port (c : in std_logic_vector(2 downto 0);
			display : out std_logic_vector(0 to 6));
end;

architecture Behavior of char_7seg_3bit is
begin
	with c select display <=
	"1000010" when "000",
	"0110000" when "001",
	"1001111" when "010",
	"1111111" when "011",
	"1111111" when others;
end;
