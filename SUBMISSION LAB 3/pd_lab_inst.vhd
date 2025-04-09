	component pd_lab is
		port (
			clk_clk            : in  std_logic                    := 'X';             -- clk
			pushbuttons_export : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			rled_export        : out std_logic_vector(9 downto 0);                    -- export
			segments_1_conduit : out std_logic_vector(6 downto 0);                    -- conduit
			segments_2_conduit : out std_logic_vector(6 downto 0);                    -- conduit
			segments_3_conduit : out std_logic_vector(6 downto 0);                    -- conduit
			segments_4_conduit : out std_logic_vector(6 downto 0);                    -- conduit
			switches_export    : in  std_logic_vector(9 downto 0) := (others => 'X'); -- export
			reset_reset_n      : in  std_logic                    := 'X'              -- reset_n
		);
	end component pd_lab;

	u0 : component pd_lab
		port map (
			clk_clk            => CONNECTED_TO_clk_clk,            --         clk.clk
			pushbuttons_export => CONNECTED_TO_pushbuttons_export, -- pushbuttons.export
			rled_export        => CONNECTED_TO_rled_export,        --        rled.export
			segments_1_conduit => CONNECTED_TO_segments_1_conduit, --  segments_1.conduit
			segments_2_conduit => CONNECTED_TO_segments_2_conduit, --  segments_2.conduit
			segments_3_conduit => CONNECTED_TO_segments_3_conduit, --  segments_3.conduit
			segments_4_conduit => CONNECTED_TO_segments_4_conduit, --  segments_4.conduit
			switches_export    => CONNECTED_TO_switches_export,    --    switches.export
			reset_reset_n      => CONNECTED_TO_reset_reset_n       --       reset.reset_n
		);

