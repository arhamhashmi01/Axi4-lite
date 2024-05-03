MODULE=axi4_lite_top

.PHONY:sim
sim: waveform.vcd

.PHONY:waves
waves: waveform.vcd
	gtkwave waveform.vcd

waveform.vcd: ./obj_dir/V$(MODULE)
	@./obj_dir/V$(MODULE)

./obj_dir/V$(MODULE): .stamp.verilate
	make -C obj_dir -f V$(MODULE).mk V$(MODULE)

.stamp.verilate: $(MODULE).sv $(MODULE)_tb.cpp
	verilator -Wall --trace -cc $(MODULE).sv --exe $(MODULE)_tb.cpp

.PHONY:lint
lint: $(MODULE).sv
	verilator --lint-only $(MODULE).sv

.PHONY: clean
clean:
	rm -rf ./obj_dir
	rm -rf waveform.vcd