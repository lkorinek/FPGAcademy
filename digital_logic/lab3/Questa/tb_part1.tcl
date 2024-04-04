# stop any simulation that is currently running
quit -sim
# create the default "work" library
vlib work;

# compile the VHDL source code, and the testbench
vcom ../*.vhd
vcom tb_part1.vht
vsim work.tb_part1 -Lf 220model -Lf altera_mf -debugDB 
do wave_part1.do
run 120 ns