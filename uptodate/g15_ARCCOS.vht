LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;                                  

ENTITY g15_ARCCOS_vhd_tst IS
END g15_ARCCOS_vhd_tst;

ARCHITECTURE g15_ARCCOS_arch OF g15_ARCCOS_vhd_tst IS
    -- constants                                                  
    -- signals                                                    
    SIGNAL ANGLE : UNSIGNED(9 DOWNTO 0);
    SIGNAL CLK : STD_LOGIC := '0';  -- Initialize CLK to '0'
    SIGNAL X : UNSIGNED(7 DOWNTO 0);
    
    COMPONENT g15_ARCCOS
        PORT (
            ANGLE : BUFFER UNSIGNED(9 DOWNTO 0);
            CLK : IN STD_LOGIC;
            X : IN UNSIGNED(7 DOWNTO 0)
        );
    END COMPONENT;
	 
	 
BEGIN
    -- Instantiate the g15_ARCCOS component
    i1 : g15_ARCCOS
        PORT MAP (
            ANGLE => ANGLE,
            CLK => CLK,
            X => X
        );
		  
		  CLK <= not CLK after 13 ns;
		  
		  X <= "11110110", "10010001" after 30 ns, "11110000" after 50 ns;
        
--    -- Clock generation process (Continuous clock signal for 38 MHz)
--    clk_process : PROCESS
--    BEGIN
--        -- Toggle the clock every 13 ns (38 MHz clock)
--        CLK <= '1';
--        WAIT FOR 13 ns;  -- 13 ns for high state
--        CLK <= '0';
--        WAIT FOR 13 ns;  -- 13 ns for low state
--    END PROCESS clk_process;
--
--    -- Test sequence for X values
--    stimulus_process : PROCESS
--    BEGIN 
--        -- Initial value for X (first test case)
--        X <= "10011010";  -- Set X to some value
--        WAIT FOR 26 ns;    -- Wait for two clock cycles (26 ns total)
--        
--        -- Second test case for X
--        X <= "10010001";   -- Set X to another value
--        WAIT FOR 26 ns;    -- Wait for two clock cycles
--        
--        -- Third test case for X
--        X <= "11110000";   -- Set X to yet another value
--        WAIT FOR 26 ns;    -- Wait for two clock cycles
--        
--        -- End the simulation after enough time
--        WAIT;              -- Wait indefinitely to finish simulation
--    END PROCESS stimulus_process;

END g15_ARCCOS_arch;
