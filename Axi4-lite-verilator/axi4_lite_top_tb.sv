#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vaxi4_lite_top.h"

vluint64_t sim_time = 0;

void read_values(Vaxi4_lite_top* dut) {
    if (sim_time == 0 && sim_time < 5) {
        dut->ACLK = 0;
        dut->ARESETN = 0;
    } else if (sim_time >= 5) {
        dut->ARESETN = 1;
    }
    if (sim_time == 7) {
        dut->write_s = 1;
        dut->address = 5;
        dut->W_data  = 4;
    } else if (sim_time == 9&& sim_time < 15) {
        dut->write_s = 0;
    }
    else if (sim_time == 21) {
        dut->read_s = 1;
        dut->address = 5;
    }
    else if (sim_time == 23) {
        dut->read_s = 0;}
}

int main(int argc, char** argv, char** env) {
    Vaxi4_lite_top* dut = new Vaxi4_lite_top;

    Verilated::traceEverOn(true);
    VerilatedVcdC* m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 99); // Trace 99 levels of hierarchy
    m_trace->open("waveform.vcd");

    dut->ACLK = 0;
    dut->ARESETN = 0;

    while (sim_time <= 40) {
        dut->ACLK = !dut->ACLK;
        read_values(dut);
        dut->eval();
        m_trace->dump(sim_time);
        sim_time++;
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}