--
-- entity name: g15_lab_2 (replace “XX” by your group’s number)
--
-- Version 1.0
-- Authors: Celine Shao, Anna Joy Aylward Burgess
-- Date: March 28, 2025 (enter the date of the latest edit to the file)

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 


entity g15_lab_2 is
	
	port (CLK: in std_logic;
			switches : in std_logic_vector(7 downto 0);
			LED3 : out std_logic_vector(6 downto 0);
			LED2 : out std_logic_vector(6 downto 0);
			LED1 : out std_logic_vector(6 downto 0);
			LED0 : out std_logic_vector(6 downto 0));
			

end g15_lab_2;

architecture behavior of g15_lab_2 is

signal S1: unsigned(9 downto 0);
signal S2, S3, S4, S5, S6: std_logic_vector(3 downto 0);
signal S7, S8, S9, S10, S11, S12: std_logic;
signal S13: unsigned(7 downto 0);
signal S14: std_logic_vector(9 downto 0);
signal S15: std_logic_vector(15 downto 0);

	component g15_Binary_BCD16
		port ( bin : in std_logic_vector(15 downto 0);
			BCD5 : out std_logic_vector(3 downto 0); -- Most significant digit
			BCD4 : out std_logic_vector(3 downto 0);
			BCD3 : out std_logic_vector(3 downto 0);
			BCD2 : out std_logic_vector(3 downto 0);
			BCD1 : out std_logic_vector(3 downto 0) ); -- Least significant digit
	end component;

	component g15_ARCCOS
		port ( X : in unsigned(7 downto 0);
				CLK: in std_logic;
			ANGLE : out unsigned(9 downto 0));
	end component;

	component g15_7_segment_decoder
		port ( value_in : in std_logic_vector(3 downto 0);
				RB_In : in std_logic;
				RB_Out : out std_logic;
				segments : out std_logic_vector(6 downto 0));
	end component;

begin
S7 <= '1';
S10 <= '0';
S13 <= unsigned(switches);
S15 <= "000000"&S14;

A0: g15_ARCCOS port map (X=>S13, CLK=>CLK, ANGLE=>S1);
S14 <= std_logic_vector(S1);
B0: g15_Binary_BCD16 port map (bin=>S15, BCD5=>S6, BCD4=>S2, BCD3=>S3, BCD2=>S4, BCD1=>S5);
C3: g15_7_segment_decoder port map (value_in=>S2, RB_In=>S7, RB_Out=>S8, segments=>LED3);
C2: g15_7_segment_decoder port map (value_in=>S3, RB_In=>S8, RB_Out=>S9, segments=>LED2);
C1: g15_7_segment_decoder port map (value_in=>S4, RB_In=>S9, RB_Out=>S12, segments=>LED1);
C0: g15_7_segment_decoder port map (value_in=>S5, RB_In=>S10, RB_Out=>S11, segments=>LED0);


end behavior;


