./simv +UVM_NO_RELNOTES +UVM_MAX_QUIT_COUNT=10,YES -l sim_1.log
./simv +UVM_NO_RELNOTES                            -l sim_2.log
./simv +UVM_NO_RELNOTES +uvm_set_action=my_env,_ALL_,UVM_ERROR,UVM_DISPLAY +UVM_TIMEOUT=300 -l sim_3.log
./simv +UVM_NO_RELNOTES +uvm_set_action=my_env,ERR_ID_ENV,UVM_ERROR,UVM_NO_ACTION +UVM_TIMEOUT=300 -l sim_4.log
