	component nios_project is
		port (
			btn_external_connection_export  : in  std_logic                    := 'X'; -- export
			clk_clk                         : in  std_logic                    := 'X'; -- clk
			leds_external_connection_export : out std_logic_vector(7 downto 0)         -- export
		);
	end component nios_project;

	u0 : component nios_project
		port map (
			btn_external_connection_export  => CONNECTED_TO_btn_external_connection_export,  --  btn_external_connection.export
			clk_clk                         => CONNECTED_TO_clk_clk,                         --                      clk.clk
			leds_external_connection_export => CONNECTED_TO_leds_external_connection_export  -- leds_external_connection.export
		);

