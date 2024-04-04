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

-- DATE "03/23/2024 23:03:52"

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

ENTITY 	circuit_a_5bit IS
    PORT (
	bin_num : IN std_logic_vector(4 DOWNTO 0);
	a_out : OUT std_logic_vector(3 DOWNTO 0)
	);
END circuit_a_5bit;

ARCHITECTURE structure OF circuit_a_5bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_bin_num : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_a_out : std_logic_vector(3 DOWNTO 0);
SIGNAL \a_out[0]~output_o\ : std_logic;
SIGNAL \a_out[1]~output_o\ : std_logic;
SIGNAL \a_out[2]~output_o\ : std_logic;
SIGNAL \a_out[3]~output_o\ : std_logic;
SIGNAL \bin_num[0]~input_o\ : std_logic;
SIGNAL \bin_num[1]~input_o\ : std_logic;
SIGNAL \bin_num[4]~input_o\ : std_logic;
SIGNAL \bin_num[2]~input_o\ : std_logic;
SIGNAL \a_out~0_combout\ : std_logic;
SIGNAL \bin_num[3]~input_o\ : std_logic;
SIGNAL \a_out~1_combout\ : std_logic;
SIGNAL \ALT_INV_bin_num[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_bin_num[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_bin_num[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_bin_num[1]~input_o\ : std_logic;

BEGIN

ww_bin_num <= bin_num;
a_out <= ww_a_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_bin_num[3]~input_o\ <= NOT \bin_num[3]~input_o\;
\ALT_INV_bin_num[2]~input_o\ <= NOT \bin_num[2]~input_o\;
\ALT_INV_bin_num[4]~input_o\ <= NOT \bin_num[4]~input_o\;
\ALT_INV_bin_num[1]~input_o\ <= NOT \bin_num[1]~input_o\;

\a_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bin_num[0]~input_o\,
	devoe => ww_devoe,
	o => \a_out[0]~output_o\);

\a_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_bin_num[1]~input_o\,
	devoe => ww_devoe,
	o => \a_out[1]~output_o\);

\a_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \a_out~0_combout\,
	devoe => ww_devoe,
	o => \a_out[2]~output_o\);

\a_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \a_out~1_combout\,
	devoe => ww_devoe,
	o => \a_out[3]~output_o\);

\bin_num[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bin_num(0),
	o => \bin_num[0]~input_o\);

\bin_num[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bin_num(1),
	o => \bin_num[1]~input_o\);

\bin_num[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bin_num(4),
	o => \bin_num[4]~input_o\);

\bin_num[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bin_num(2),
	o => \bin_num[2]~input_o\);

\a_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \a_out~0_combout\ = (!\bin_num[1]~input_o\ & (\bin_num[4]~input_o\)) # (\bin_num[1]~input_o\ & (!\bin_num[4]~input_o\ & \bin_num[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011000100110001001100010011000100110001001100010011000100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bin_num[1]~input_o\,
	datab => \ALT_INV_bin_num[4]~input_o\,
	datac => \ALT_INV_bin_num[2]~input_o\,
	combout => \a_out~0_combout\);

\bin_num[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bin_num(3),
	o => \bin_num[3]~input_o\);

\a_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \a_out~1_combout\ = (!\bin_num[4]~input_o\ & ((!\bin_num[3]~input_o\))) # (\bin_num[4]~input_o\ & (\bin_num[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000111010001110100011101000111010001110100011101000111010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bin_num[1]~input_o\,
	datab => \ALT_INV_bin_num[4]~input_o\,
	datac => \ALT_INV_bin_num[3]~input_o\,
	combout => \a_out~1_combout\);

ww_a_out(0) <= \a_out[0]~output_o\;

ww_a_out(1) <= \a_out[1]~output_o\;

ww_a_out(2) <= \a_out[2]~output_o\;

ww_a_out(3) <= \a_out[3]~output_o\;
END structure;


