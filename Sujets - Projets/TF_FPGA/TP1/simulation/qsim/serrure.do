onerror {quit -f}
vlib work
vlog -work work serrure.vo
vlog -work work serrure.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.decode_clavier_vlg_vec_tst
vcd file -direction serrure.msim.vcd
vcd add -internal decode_clavier_vlg_vec_tst/*
vcd add -internal decode_clavier_vlg_vec_tst/i1/*
add wave /*
run -all
