onerror {quit -f}
vlib work
vlog -work work TP23.vo
vlog -work work TP23.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Fenetre_Mesure_vlg_vec_tst
vcd file -direction TP23.msim.vcd
vcd add -internal Fenetre_Mesure_vlg_vec_tst/*
vcd add -internal Fenetre_Mesure_vlg_vec_tst/i1/*
add wave /*
run -all
