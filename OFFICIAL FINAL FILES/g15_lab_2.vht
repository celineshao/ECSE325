LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g15_lab_2_vhd_tst IS
END g15_lab_2_vhd_tst;
ARCHITECTURE g15_lab_2_arch OF g15_lab_2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC := '0'; -- Initialize clock to 0
SIGNAL LED0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL LED1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL LED2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL LED3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL switches : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');

-- Simulation control
signal sim_end : boolean := false;

COMPONENT g15_lab_2
	PORT (
	CLK : IN STD_LOGIC;
	LED0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	LED1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	LED2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	LED3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	switches : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g15_lab_2
	PORT MAP (
		CLK => CLK,
		LED0 => LED0,
		LED1 => LED1,
		LED2 => LED2,
		LED3 => LED3,
		switches => switches
	);
	 
-- Clock generation (13 ns half period = ~38.46 MHz)
CLK <= not CLK after 30 ns when not sim_end else '0';

-- Stimulus process
stim_proc: PROCESS
BEGIN
	-- Initial values
	switches <= "11110110";
	
	-- Change inputs after delays
	wait for 30 ns;
	switches <= "11110110";
	
	wait for 30 ns; -- 50 ns total
	switches <= "11110110";
	
	-- Let simulation run for a while longer
	wait for 100 ns;
	
	-- End simulation
	sim_end <= true;
	wait;
END PROCESS;

END g15_lab_2_arch;