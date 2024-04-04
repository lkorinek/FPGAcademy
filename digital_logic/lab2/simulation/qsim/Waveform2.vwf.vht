-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/23/2024 23:03:51"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          circuit_a_5bit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY circuit_a_5bit_vhd_vec_tst IS
END circuit_a_5bit_vhd_vec_tst;
ARCHITECTURE circuit_a_5bit_arch OF circuit_a_5bit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bin_num : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT circuit_a_5bit
	PORT (
	a_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bin_num : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : circuit_a_5bit
	PORT MAP (
-- list connections between master ports and signals
	a_out => a_out,
	bin_num => bin_num
	);
-- bin_num[4]
t_prcs_bin_num_4: PROCESS
BEGIN
	bin_num(4) <= '0';
	WAIT FOR 16000 ps;
	bin_num(4) <= '1';
WAIT;
END PROCESS t_prcs_bin_num_4;
-- bin_num[3]
t_prcs_bin_num_3: PROCESS
BEGIN
	bin_num(3) <= '0';
	WAIT FOR 8000 ps;
	bin_num(3) <= '1';
	WAIT FOR 8000 ps;
	bin_num(3) <= '0';
WAIT;
END PROCESS t_prcs_bin_num_3;
-- bin_num[2]
t_prcs_bin_num_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		bin_num(2) <= '0';
		WAIT FOR 4000 ps;
		bin_num(2) <= '1';
		WAIT FOR 4000 ps;
	END LOOP;
	bin_num(2) <= '0';
WAIT;
END PROCESS t_prcs_bin_num_2;
-- bin_num[1]
t_prcs_bin_num_1: PROCESS
BEGIN
LOOP
	bin_num(1) <= '0';
	WAIT FOR 2000 ps;
	bin_num(1) <= '1';
	WAIT FOR 2000 ps;
	IF (NOW >= 20000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_bin_num_1;
-- bin_num[0]
t_prcs_bin_num_0: PROCESS
BEGIN
LOOP
	bin_num(0) <= '0';
	WAIT FOR 1000 ps;
	bin_num(0) <= '1';
	WAIT FOR 1000 ps;
	IF (NOW >= 20000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_bin_num_0;
END circuit_a_5bit_arch;