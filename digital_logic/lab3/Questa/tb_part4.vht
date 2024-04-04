library ieee;
use ieee.std_logic_1164.all;


entity tb_part4 is
end tb_part4;

architecture tb of tb_part4 is
	component part4
	port (clk, d : in std_logic;
		  qa, qb, qc : out std_logic);
	end component;

	constant T_clk : time := 60 ns;
	signal clk_tb, D_tb : std_logic;  -- inputs 
	signal Qa_tb, Qb_tb, Qc_tb : std_logic;  -- outputs
begin
	-- connecting testbench signals
	UUT : part4 port map (clk_tb, D_tb, Qa_tb, Qb_tb, Qc_tb );

	-- continuous clock
	
	process
	begin
	clk_tb <= '0';
	wait for T_clk/2;
	clk_tb <= '1';
	wait for T_clk/2;
	end process;

	-- signals
	process
	begin
	D_tb <= '0';
	wait for 20 ns;
	D_tb <= '1';
	wait for 20 ns;
	D_tb <= '0';
	wait for 5 ns;
	D_tb <= '1';
	wait for 10 ns;
	D_tb <= '0';
	wait for 10 ns;
	D_tb <= '1';
	wait for 10 ns;
	D_tb <= '0';
	wait for 5 ns;
	D_tb <= '1';
	wait for 5 ns;
	D_tb <= '0';
	wait for 10 ns;
	D_tb <= '1';
	wait for 5 ns;
	D_tb <= '0';
	wait for 5 ns;
	D_tb <= '1';
	wait for 20 ns;
	D_tb <= '0';
	wait for 50 ns;
	end process;
end tb ;