# stop any simulation that is currently running
quit -sim
# create the default "work" library
vlib work;

# compile the VHDL source code, and the testbench
vcom ../*.vhd
vcom tb_part4.vht
vsim work.tb_part4 -Lf 220model -Lf altera_mf -debugDB 
do wave_part4.do
run 200 ns