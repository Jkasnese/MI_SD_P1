module top_nios_project (
	btn_external_connection_export,
	clk_clk,
	leds_external_connection_export);	

	input		btn_external_connection_export;
	input		clk_clk;
	output	[7:0]	leds_external_connection_export;
	
	nios_project nios (
		.btn_external_connection_export  (btn_external_connection_export),  // botao passar leds
		.clk_clk                         (clk_clk),                         //                      clk.clk
		.leds_external_connection_export (leds_external_connection_export)  // leds_external_connection.export
	);
	
endmodule
