library ieee;
use ieee.std_logic_1164.all;

entity char_7seg is
	port (c : in std_logic_vector(1 downto 0);
			display : out std_logic_vector(0 to 6));
end;

architecture Behavior of char_7seg is
begin
	with c select display <=
	"1000010" when "00",
	"0110000" when "01",
	"1001111" when "10",
	"1111111" when "11";
end;
