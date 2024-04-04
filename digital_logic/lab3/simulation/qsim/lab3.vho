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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

-- DATE "03/31/2024 00:09:12"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	part2 IS
    PORT (
	clk : IN std_logic;
	d : IN std_logic;
	q : OUT std_logic
	);
END part2;

ARCHITECTURE structure OF part2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_d : std_logic;
SIGNAL ww_q : std_logic;
SIGNAL \q~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \d~input_o\ : std_logic;
SIGNAL \s_g~combout\ : std_logic;
SIGNAL \r_g~combout\ : std_logic;
SIGNAL \qb~combout\ : std_logic;
SIGNAL \qa~combout\ : std_logic;
SIGNAL \ALT_INV_r_g~combout\ : std_logic;
SIGNAL \ALT_INV_qb~combout\ : std_logic;
SIGNAL \ALT_INV_s_g~combout\ : std_logic;
SIGNAL \ALT_INV_qa~combout\ : std_logic;
SIGNAL \ALT_INV_clk~input_o\ : std_logic;
SIGNAL \ALT_INV_d~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_d <= d;
q <= ww_q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_r_g~combout\ <= NOT \r_g~combout\;
\ALT_INV_qb~combout\ <= NOT \qb~combout\;
\ALT_INV_s_g~combout\ <= NOT \s_g~combout\;
\ALT_INV_qa~combout\ <= NOT \qa~combout\;
\ALT_INV_clk~input_o\ <= NOT \clk~input_o\;
\ALT_INV_d~input_o\ <= NOT \d~input_o\;

\q~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \qa~combout\,
	devoe => ww_devoe,
	o => \q~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\d~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d,
	o => \d~input_o\);

s_g : cyclonev_lcell_comb
-- Equation(s):
-- \s_g~combout\ = LCELL((!\clk~input_o\) # (!\d~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_clk~input_o\,
	datab => \ALT_INV_d~input_o\,
	combout => \s_g~combout\);

r_g : cyclonev_lcell_comb
-- Equation(s):
-- \r_g~combout\ = LCELL((!\clk~input_o\) # (\d~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_clk~input_o\,
	datab => \ALT_INV_d~input_o\,
	combout => \r_g~combout\);

qb : cyclonev_lcell_comb
-- Equation(s):
-- \qb~combout\ = LCELL((!\r_g~combout\) # (!\qa~combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_r_g~combout\,
	datab => \ALT_INV_qa~combout\,
	combout => \qb~combout\);

qa : cyclonev_lcell_comb
-- Equation(s):
-- \qa~combout\ = LCELL((!\s_g~combout\) # (!\qb~combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s_g~combout\,
	datab => \ALT_INV_qb~combout\,
	combout => \qa~combout\);

ww_q <= \q~output_o\;
END structure;


