	component unsaved is
		port (
			clk_clk                         : in  std_logic                    := 'X'; -- clk
			btn_external_connection_export  : in  std_logic                    := 'X'; -- export
			leds_external_connection_export : out std_logic_vector(7 downto 0)         -- export
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk                         => CONNECTED_TO_clk_clk,                         --                      clk.clk
			btn_external_connection_export  => CONNECTED_TO_btn_external_connection_export,  --  btn_external_connection.export
			leds_external_connection_export => CONNECTED_TO_leds_external_connection_export  -- leds_external_connection.export
		);

