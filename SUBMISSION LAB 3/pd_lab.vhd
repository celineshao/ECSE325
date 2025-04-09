-- pd_lab.vhd

-- Generated using ACDS version 22.1 922

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pd_lab is
	port (
		clk_clk            : in  std_logic                    := '0';             --         clk.clk
		pushbuttons_export : in  std_logic_vector(3 downto 0) := (others => '0'); -- pushbuttons.export
		reset_reset_n      : in  std_logic                    := '0';             --       reset.reset_n
		rled_export        : out std_logic_vector(9 downto 0);                    --        rled.export
		segments_1_conduit : out std_logic_vector(6 downto 0);                    --  segments_1.conduit
		segments_2_conduit : out std_logic_vector(6 downto 0);                    --  segments_2.conduit
		segments_3_conduit : out std_logic_vector(6 downto 0);                    --  segments_3.conduit
		segments_4_conduit : out std_logic_vector(6 downto 0);                    --  segments_4.conduit
		switches_export    : in  std_logic_vector(9 downto 0) := (others => '0')  --    switches.export
	);
end entity pd_lab;

architecture rtl of pd_lab is
	component pd_lab_LEDS is
		port (
			clk        : in  std_logic                     := 'X';             -- clk
			reset_n    : in  std_logic                     := 'X';             -- reset_n
			address    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			write_n    : in  std_logic                     := 'X';             -- write_n
			writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			chipselect : in  std_logic                     := 'X';             -- chipselect
			readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			out_port   : out std_logic_vector(9 downto 0)                      -- export
		);
	end component pd_lab_LEDS;

	component pd_lab_PUSHBUTTONS is
		port (
			clk        : in  std_logic                     := 'X';             -- clk
			reset_n    : in  std_logic                     := 'X';             -- reset_n
			address    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			write_n    : in  std_logic                     := 'X';             -- write_n
			writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			chipselect : in  std_logic                     := 'X';             -- chipselect
			readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			in_port    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			irq        : out std_logic                                         -- irq
		);
	end component pd_lab_PUSHBUTTONS;

	component pd_lab_SWITCHES is
		port (
			clk      : in  std_logic                     := 'X';             -- clk
			reset_n  : in  std_logic                     := 'X';             -- reset_n
			address  : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			readdata : out std_logic_vector(31 downto 0);                    -- readdata
			in_port  : in  std_logic_vector(9 downto 0)  := (others => 'X')  -- export
		);
	end component pd_lab_SWITCHES;

	component pd_lab_master_0 is
		generic (
			USE_PLI     : integer := 0;
			PLI_PORT    : integer := 50000;
			FIFO_DEPTHS : integer := 2
		);
		port (
			clk_clk              : in  std_logic                     := 'X';             -- clk
			clk_reset_reset      : in  std_logic                     := 'X';             -- reset
			master_address       : out std_logic_vector(31 downto 0);                    -- address
			master_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			master_read          : out std_logic;                                        -- read
			master_write         : out std_logic;                                        -- write
			master_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			master_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			master_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			master_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			master_reset_reset   : out std_logic                                         -- reset
		);
	end component pd_lab_master_0;

	component pd_lab_custom_component is
		port (
			resetn     : in  std_logic                    := 'X';             -- reset_n
			address    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- address
			writedata  : in  std_logic_vector(7 downto 0) := (others => 'X'); -- writedata
			write      : in  std_logic                    := 'X';             -- write
			chipselect : in  std_logic                    := 'X';             -- chipselect
			clock      : in  std_logic                    := 'X';             -- clk
			segments2  : out std_logic_vector(6 downto 0);                    -- conduit
			segments3  : out std_logic_vector(6 downto 0);                    -- conduit
			segments4  : out std_logic_vector(6 downto 0);                    -- conduit
			segments1  : out std_logic_vector(6 downto 0)                     -- conduit
		);
	end component pd_lab_custom_component;

	component pd_lab_mm_interconnect_0 is
		port (
			clk_0_clk_clk                                                     : in  std_logic                     := 'X';             -- clk
			master_0_clk_reset_reset_bridge_in_reset_reset                    : in  std_logic                     := 'X';             -- reset
			pd_lab_custom_component_0_clock_reset_reset_bridge_in_reset_reset : in  std_logic                     := 'X';             -- reset
			master_0_master_address                                           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- address
			master_0_master_waitrequest                                       : out std_logic;                                        -- waitrequest
			master_0_master_byteenable                                        : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			master_0_master_read                                              : in  std_logic                     := 'X';             -- read
			master_0_master_readdata                                          : out std_logic_vector(31 downto 0);                    -- readdata
			master_0_master_readdatavalid                                     : out std_logic;                                        -- readdatavalid
			master_0_master_write                                             : in  std_logic                     := 'X';             -- write
			master_0_master_writedata                                         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			LEDS_s1_address                                                   : out std_logic_vector(1 downto 0);                     -- address
			LEDS_s1_write                                                     : out std_logic;                                        -- write
			LEDS_s1_readdata                                                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			LEDS_s1_writedata                                                 : out std_logic_vector(31 downto 0);                    -- writedata
			LEDS_s1_chipselect                                                : out std_logic;                                        -- chipselect
			pd_lab_custom_component_0_avalon_slave_0_address                  : out std_logic_vector(7 downto 0);                     -- address
			pd_lab_custom_component_0_avalon_slave_0_write                    : out std_logic;                                        -- write
			pd_lab_custom_component_0_avalon_slave_0_writedata                : out std_logic_vector(7 downto 0);                     -- writedata
			pd_lab_custom_component_0_avalon_slave_0_chipselect               : out std_logic;                                        -- chipselect
			PUSHBUTTONS_s1_address                                            : out std_logic_vector(1 downto 0);                     -- address
			PUSHBUTTONS_s1_write                                              : out std_logic;                                        -- write
			PUSHBUTTONS_s1_readdata                                           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			PUSHBUTTONS_s1_writedata                                          : out std_logic_vector(31 downto 0);                    -- writedata
			PUSHBUTTONS_s1_chipselect                                         : out std_logic;                                        -- chipselect
			SWITCHES_s1_address                                               : out std_logic_vector(1 downto 0);                     -- address
			SWITCHES_s1_readdata                                              : in  std_logic_vector(31 downto 0) := (others => 'X')  -- readdata
		);
	end component pd_lab_mm_interconnect_0;

	component altera_reset_controller is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_in1      : in  std_logic := 'X'; -- reset
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component altera_reset_controller;

	signal master_0_master_readdata                                              : std_logic_vector(31 downto 0); -- mm_interconnect_0:master_0_master_readdata -> master_0:master_readdata
	signal master_0_master_waitrequest                                           : std_logic;                     -- mm_interconnect_0:master_0_master_waitrequest -> master_0:master_waitrequest
	signal master_0_master_address                                               : std_logic_vector(31 downto 0); -- master_0:master_address -> mm_interconnect_0:master_0_master_address
	signal master_0_master_read                                                  : std_logic;                     -- master_0:master_read -> mm_interconnect_0:master_0_master_read
	signal master_0_master_byteenable                                            : std_logic_vector(3 downto 0);  -- master_0:master_byteenable -> mm_interconnect_0:master_0_master_byteenable
	signal master_0_master_readdatavalid                                         : std_logic;                     -- mm_interconnect_0:master_0_master_readdatavalid -> master_0:master_readdatavalid
	signal master_0_master_write                                                 : std_logic;                     -- master_0:master_write -> mm_interconnect_0:master_0_master_write
	signal master_0_master_writedata                                             : std_logic_vector(31 downto 0); -- master_0:master_writedata -> mm_interconnect_0:master_0_master_writedata
	signal mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_chipselect : std_logic;                     -- mm_interconnect_0:pd_lab_custom_component_0_avalon_slave_0_chipselect -> pd_lab_custom_component_0:chipselect
	signal mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_address    : std_logic_vector(7 downto 0);  -- mm_interconnect_0:pd_lab_custom_component_0_avalon_slave_0_address -> pd_lab_custom_component_0:address
	signal mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_write      : std_logic;                     -- mm_interconnect_0:pd_lab_custom_component_0_avalon_slave_0_write -> pd_lab_custom_component_0:write
	signal mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_writedata  : std_logic_vector(7 downto 0);  -- mm_interconnect_0:pd_lab_custom_component_0_avalon_slave_0_writedata -> pd_lab_custom_component_0:writedata
	signal mm_interconnect_0_pushbuttons_s1_chipselect                           : std_logic;                     -- mm_interconnect_0:PUSHBUTTONS_s1_chipselect -> PUSHBUTTONS:chipselect
	signal mm_interconnect_0_pushbuttons_s1_readdata                             : std_logic_vector(31 downto 0); -- PUSHBUTTONS:readdata -> mm_interconnect_0:PUSHBUTTONS_s1_readdata
	signal mm_interconnect_0_pushbuttons_s1_address                              : std_logic_vector(1 downto 0);  -- mm_interconnect_0:PUSHBUTTONS_s1_address -> PUSHBUTTONS:address
	signal mm_interconnect_0_pushbuttons_s1_write                                : std_logic;                     -- mm_interconnect_0:PUSHBUTTONS_s1_write -> mm_interconnect_0_pushbuttons_s1_write:in
	signal mm_interconnect_0_pushbuttons_s1_writedata                            : std_logic_vector(31 downto 0); -- mm_interconnect_0:PUSHBUTTONS_s1_writedata -> PUSHBUTTONS:writedata
	signal mm_interconnect_0_switches_s1_readdata                                : std_logic_vector(31 downto 0); -- SWITCHES:readdata -> mm_interconnect_0:SWITCHES_s1_readdata
	signal mm_interconnect_0_switches_s1_address                                 : std_logic_vector(1 downto 0);  -- mm_interconnect_0:SWITCHES_s1_address -> SWITCHES:address
	signal mm_interconnect_0_leds_s1_chipselect                                  : std_logic;                     -- mm_interconnect_0:LEDS_s1_chipselect -> LEDS:chipselect
	signal mm_interconnect_0_leds_s1_readdata                                    : std_logic_vector(31 downto 0); -- LEDS:readdata -> mm_interconnect_0:LEDS_s1_readdata
	signal mm_interconnect_0_leds_s1_address                                     : std_logic_vector(1 downto 0);  -- mm_interconnect_0:LEDS_s1_address -> LEDS:address
	signal mm_interconnect_0_leds_s1_write                                       : std_logic;                     -- mm_interconnect_0:LEDS_s1_write -> mm_interconnect_0_leds_s1_write:in
	signal mm_interconnect_0_leds_s1_writedata                                   : std_logic_vector(31 downto 0); -- mm_interconnect_0:LEDS_s1_writedata -> LEDS:writedata
	signal rst_controller_reset_out_reset                                        : std_logic;                     -- rst_controller:reset_out -> [mm_interconnect_0:master_0_clk_reset_reset_bridge_in_reset_reset, mm_interconnect_0:pd_lab_custom_component_0_clock_reset_reset_bridge_in_reset_reset, rst_controller_reset_out_reset:in]
	signal reset_reset_n_ports_inv                                               : std_logic;                     -- reset_reset_n:inv -> [master_0:clk_reset_reset, rst_controller:reset_in0]
	signal mm_interconnect_0_pushbuttons_s1_write_ports_inv                      : std_logic;                     -- mm_interconnect_0_pushbuttons_s1_write:inv -> PUSHBUTTONS:write_n
	signal mm_interconnect_0_leds_s1_write_ports_inv                             : std_logic;                     -- mm_interconnect_0_leds_s1_write:inv -> LEDS:write_n
	signal rst_controller_reset_out_reset_ports_inv                              : std_logic;                     -- rst_controller_reset_out_reset:inv -> [LEDS:reset_n, PUSHBUTTONS:reset_n, SWITCHES:reset_n, pd_lab_custom_component_0:resetn]

begin

	leds : component pd_lab_LEDS
		port map (
			clk        => clk_clk,                                   --                 clk.clk
			reset_n    => rst_controller_reset_out_reset_ports_inv,  --               reset.reset_n
			address    => mm_interconnect_0_leds_s1_address,         --                  s1.address
			write_n    => mm_interconnect_0_leds_s1_write_ports_inv, --                    .write_n
			writedata  => mm_interconnect_0_leds_s1_writedata,       --                    .writedata
			chipselect => mm_interconnect_0_leds_s1_chipselect,      --                    .chipselect
			readdata   => mm_interconnect_0_leds_s1_readdata,        --                    .readdata
			out_port   => rled_export                                -- external_connection.export
		);

	pushbuttons : component pd_lab_PUSHBUTTONS
		port map (
			clk        => clk_clk,                                          --                 clk.clk
			reset_n    => rst_controller_reset_out_reset_ports_inv,         --               reset.reset_n
			address    => mm_interconnect_0_pushbuttons_s1_address,         --                  s1.address
			write_n    => mm_interconnect_0_pushbuttons_s1_write_ports_inv, --                    .write_n
			writedata  => mm_interconnect_0_pushbuttons_s1_writedata,       --                    .writedata
			chipselect => mm_interconnect_0_pushbuttons_s1_chipselect,      --                    .chipselect
			readdata   => mm_interconnect_0_pushbuttons_s1_readdata,        --                    .readdata
			in_port    => pushbuttons_export,                               -- external_connection.export
			irq        => open                                              --                 irq.irq
		);

	switches : component pd_lab_SWITCHES
		port map (
			clk      => clk_clk,                                  --                 clk.clk
			reset_n  => rst_controller_reset_out_reset_ports_inv, --               reset.reset_n
			address  => mm_interconnect_0_switches_s1_address,    --                  s1.address
			readdata => mm_interconnect_0_switches_s1_readdata,   --                    .readdata
			in_port  => switches_export                           -- external_connection.export
		);

	master_0 : component pd_lab_master_0
		generic map (
			USE_PLI     => 0,
			PLI_PORT    => 50000,
			FIFO_DEPTHS => 2
		)
		port map (
			clk_clk              => clk_clk,                       --          clk.clk
			clk_reset_reset      => reset_reset_n_ports_inv,       --    clk_reset.reset
			master_address       => master_0_master_address,       --       master.address
			master_readdata      => master_0_master_readdata,      --             .readdata
			master_read          => master_0_master_read,          --             .read
			master_write         => master_0_master_write,         --             .write
			master_writedata     => master_0_master_writedata,     --             .writedata
			master_waitrequest   => master_0_master_waitrequest,   --             .waitrequest
			master_readdatavalid => master_0_master_readdatavalid, --             .readdatavalid
			master_byteenable    => master_0_master_byteenable,    --             .byteenable
			master_reset_reset   => open                           -- master_reset.reset
		);

	pd_lab_custom_component_0 : component pd_lab_custom_component
		port map (
			resetn     => rst_controller_reset_out_reset_ports_inv,                              --    clock_reset.reset_n
			address    => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_address,    -- avalon_slave_0.address
			writedata  => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_writedata,  --               .writedata
			write      => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_write,      --               .write
			chipselect => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_chipselect, --               .chipselect
			clock      => clk_clk,                                                               --     clock_sink.clk
			segments2  => segments_2_conduit,                                                    --      conduit_2.conduit
			segments3  => segments_3_conduit,                                                    --      conduit_3.conduit
			segments4  => segments_4_conduit,                                                    --      conduit_4.conduit
			segments1  => segments_1_conduit                                                     --      conduit_1.conduit
		);

	mm_interconnect_0 : component pd_lab_mm_interconnect_0
		port map (
			clk_0_clk_clk                                                     => clk_clk,                                                               --                                                   clk_0_clk.clk
			master_0_clk_reset_reset_bridge_in_reset_reset                    => rst_controller_reset_out_reset,                                        --                    master_0_clk_reset_reset_bridge_in_reset.reset
			pd_lab_custom_component_0_clock_reset_reset_bridge_in_reset_reset => rst_controller_reset_out_reset,                                        -- pd_lab_custom_component_0_clock_reset_reset_bridge_in_reset.reset
			master_0_master_address                                           => master_0_master_address,                                               --                                             master_0_master.address
			master_0_master_waitrequest                                       => master_0_master_waitrequest,                                           --                                                            .waitrequest
			master_0_master_byteenable                                        => master_0_master_byteenable,                                            --                                                            .byteenable
			master_0_master_read                                              => master_0_master_read,                                                  --                                                            .read
			master_0_master_readdata                                          => master_0_master_readdata,                                              --                                                            .readdata
			master_0_master_readdatavalid                                     => master_0_master_readdatavalid,                                         --                                                            .readdatavalid
			master_0_master_write                                             => master_0_master_write,                                                 --                                                            .write
			master_0_master_writedata                                         => master_0_master_writedata,                                             --                                                            .writedata
			LEDS_s1_address                                                   => mm_interconnect_0_leds_s1_address,                                     --                                                     LEDS_s1.address
			LEDS_s1_write                                                     => mm_interconnect_0_leds_s1_write,                                       --                                                            .write
			LEDS_s1_readdata                                                  => mm_interconnect_0_leds_s1_readdata,                                    --                                                            .readdata
			LEDS_s1_writedata                                                 => mm_interconnect_0_leds_s1_writedata,                                   --                                                            .writedata
			LEDS_s1_chipselect                                                => mm_interconnect_0_leds_s1_chipselect,                                  --                                                            .chipselect
			pd_lab_custom_component_0_avalon_slave_0_address                  => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_address,    --                    pd_lab_custom_component_0_avalon_slave_0.address
			pd_lab_custom_component_0_avalon_slave_0_write                    => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_write,      --                                                            .write
			pd_lab_custom_component_0_avalon_slave_0_writedata                => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_writedata,  --                                                            .writedata
			pd_lab_custom_component_0_avalon_slave_0_chipselect               => mm_interconnect_0_pd_lab_custom_component_0_avalon_slave_0_chipselect, --                                                            .chipselect
			PUSHBUTTONS_s1_address                                            => mm_interconnect_0_pushbuttons_s1_address,                              --                                              PUSHBUTTONS_s1.address
			PUSHBUTTONS_s1_write                                              => mm_interconnect_0_pushbuttons_s1_write,                                --                                                            .write
			PUSHBUTTONS_s1_readdata                                           => mm_interconnect_0_pushbuttons_s1_readdata,                             --                                                            .readdata
			PUSHBUTTONS_s1_writedata                                          => mm_interconnect_0_pushbuttons_s1_writedata,                            --                                                            .writedata
			PUSHBUTTONS_s1_chipselect                                         => mm_interconnect_0_pushbuttons_s1_chipselect,                           --                                                            .chipselect
			SWITCHES_s1_address                                               => mm_interconnect_0_switches_s1_address,                                 --                                                 SWITCHES_s1.address
			SWITCHES_s1_readdata                                              => mm_interconnect_0_switches_s1_readdata                                 --                                                            .readdata
		);

	rst_controller : component altera_reset_controller
		generic map (
			NUM_RESET_INPUTS          => 1,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => reset_reset_n_ports_inv,        -- reset_in0.reset
			clk            => clk_clk,                        --       clk.clk
			reset_out      => rst_controller_reset_out_reset, -- reset_out.reset
			reset_req      => open,                           -- (terminated)
			reset_req_in0  => '0',                            -- (terminated)
			reset_in1      => '0',                            -- (terminated)
			reset_req_in1  => '0',                            -- (terminated)
			reset_in2      => '0',                            -- (terminated)
			reset_req_in2  => '0',                            -- (terminated)
			reset_in3      => '0',                            -- (terminated)
			reset_req_in3  => '0',                            -- (terminated)
			reset_in4      => '0',                            -- (terminated)
			reset_req_in4  => '0',                            -- (terminated)
			reset_in5      => '0',                            -- (terminated)
			reset_req_in5  => '0',                            -- (terminated)
			reset_in6      => '0',                            -- (terminated)
			reset_req_in6  => '0',                            -- (terminated)
			reset_in7      => '0',                            -- (terminated)
			reset_req_in7  => '0',                            -- (terminated)
			reset_in8      => '0',                            -- (terminated)
			reset_req_in8  => '0',                            -- (terminated)
			reset_in9      => '0',                            -- (terminated)
			reset_req_in9  => '0',                            -- (terminated)
			reset_in10     => '0',                            -- (terminated)
			reset_req_in10 => '0',                            -- (terminated)
			reset_in11     => '0',                            -- (terminated)
			reset_req_in11 => '0',                            -- (terminated)
			reset_in12     => '0',                            -- (terminated)
			reset_req_in12 => '0',                            -- (terminated)
			reset_in13     => '0',                            -- (terminated)
			reset_req_in13 => '0',                            -- (terminated)
			reset_in14     => '0',                            -- (terminated)
			reset_req_in14 => '0',                            -- (terminated)
			reset_in15     => '0',                            -- (terminated)
			reset_req_in15 => '0'                             -- (terminated)
		);

	reset_reset_n_ports_inv <= not reset_reset_n;

	mm_interconnect_0_pushbuttons_s1_write_ports_inv <= not mm_interconnect_0_pushbuttons_s1_write;

	mm_interconnect_0_leds_s1_write_ports_inv <= not mm_interconnect_0_leds_s1_write;

	rst_controller_reset_out_reset_ports_inv <= not rst_controller_reset_out_reset;

end architecture rtl; -- of pd_lab
