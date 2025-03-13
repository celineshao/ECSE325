-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/12/2025 16:34:22"
                                                            
-- Vhdl Test Bench template for design  :  g15_Binary_BCD16
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;                               

ENTITY g15_Binary_BCD16_vhd_tst IS
END g15_Binary_BCD16_vhd_tst;
ARCHITECTURE g15_Binary_BCD16_arch OF g15_Binary_BCD16_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BCD1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bin : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL X: unsigned(15 downto 0);

COMPONENT g15_Binary_BCD16
	PORT (
	BCD1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bin : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g15_Binary_BCD16
	PORT MAP (
-- list connections between master ports and signals
	BCD1 => BCD1,
	BCD2 => BCD2,
	BCD3 => BCD3,
	BCD4 => BCD4,
	BCD5 => BCD5,
	bin => bin
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list
	X <= (others=>'0');
	WAIT FOR 5 ns;
	loop1: for i in 0 to 31 loop
	X <= X + "100000000000";
	
	WAIT FOR 5 ns;
	end loop loop1;
                                                       
END PROCESS always;
bin <= std_logic_vector(X);                                          
END g15_Binary_BCD16_arch;
