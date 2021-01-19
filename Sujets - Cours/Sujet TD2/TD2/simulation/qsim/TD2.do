onerror {quit -f}
vlib work
vlog -work work TD2.vo
vlog -work work TD2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Ex1_SCHEME_vlg_vec_tst
vcd file -direction TD2.msim.vcd
vcd add -internal Ex1_SCHEME_vlg_vec_tst/*
vcd add -internal Ex1_SCHEME_vlg_vec_tst/i1/*
add wave /*
run -all
