--
-- entity name: g15_7_segment_decoder (replace “XX” by your group’s number)
--
-- Version 1.0
-- Authors: Celine Shao, Anna Joy Aylward Burgess
-- Date: March 28, 2025 (enter the date of the latest edit to the file)

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;


entity g15_7_segment_decoder is
	
	port ( value_in : in std_logic_vector(3 downto 0);
			RB_In : in std_logic;
			RB_Out : out std_logic;
			segments : out std_logic_vector(6 downto 0));

end g15_7_segment_decoder;

architecture behavior of g15_7_segment_decoder is

signal value_signal: std_logic_vector(3 downto 0);
begin

	P1: process(value_in) 
		begin
		
			if (RB_In = '1' and value_in = "0000") then
				RB_out <= '1';
				value_signal <= "1111";
				
			else 
				value_signal <= value_in;
			end if;
			
			case value_signal is
				when "0000" => segments <="1000000";
				when "0001" => segments <="1111001";
				when "0010" => segments <="0100100";
				when "0011" => segments <="0110000";
				when "0100" => segments <="0011001";
				when "0101" => segments <="0010010";
				when "0110" => segments <="0000010";
				when "0111" => segments <="1111000";
				when "1000" => segments <="0000000";
				when "1001" => segments <="0011000";
				
				when others => segments <="1111111";
		
		end case;
	end process;

end behavior;
