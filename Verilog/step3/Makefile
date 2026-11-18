alu4_tb.vcd: alu4.des
	vvp alu4.des
	gtkwave alu4_tb.vcd

alu4.des: alu4_tb.v
	iverilog -o alu4.des alu4_tb.v
