module nios_top(clk, reset, btn, leds);

input clk;
input reset;
input btn;
output [7:0] leds;

nios_project_13 nios_project_13 (
		.clk_clk(clk),       //   clk.clk
		.reset_reset_n(reset), // reset.reset_n
		.btn_export(btn),    //   btn.export
		.leds_export(leds)    //  leds.export
	);
	
endmodule