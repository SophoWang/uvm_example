import uvm_pkg::*;

class test_env extends uvm_component;
    int               err_cnt;
    `uvm_component_utils(test_env)

    function new (string name, uvm_component parent=null);
        super.new(name, parent);
        err_cnt = 0;
    endfunction

    task main_phase (uvm_phase phase);
        super.main_phase(phase);
        `uvm_info(get_name(), $psprintf("start main phase!"), UVM_LOW)
        phase.raise_objection(this);
        while (1) begin
            #10ns;
            err_cnt = err_cnt + 1;
            `uvm_error(get_name(), $psprintf("error cnt is %0d", err_cnt))
            err_cnt = err_cnt + 1;
            `uvm_error("ERR_ID_ENV", $psprintf("error cnt is %0d", err_cnt))
            //m_rh.dump_state();
        end
        phase.drop_objection(this);
    endtask
endclass

`timescale 1ns/1ps

program harness;
    test_env my_env;
    uvm_report_server rpt;

initial begin
    rpt = uvm_report_server::get_server();
    rpt.set_max_quit_count(25, 1);
    my_env = test_env::type_id::create("my_env", null);
    // my_env.m_rh.report_header();
    my_env.m_rh.dump_state();
    run_test();
end
endprogram
