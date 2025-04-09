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


begin

	P1: process(value_in, RB_In) 
		begin
		
			case value_in is
			
				when "0000" => 
					if (RB_In = '1') then
						RB_Out <= '1';
						segments <="1111111";
					else
						RB_Out <= '0';
						segments <="1000000";
					end if;
					
				when "0001" => 
					segments <="1111001";
					RB_Out <= '0';
					
				when "0010" => 
					segments <="0100100";
					RB_Out <= '0';
					
				when "0011" => 
					segments <="0110000";
					RB_Out <= '0';
					
				when "0100" => 
					segments <="0011001";
					RB_Out <= '0';
					
				when "0101" => 
					segments <="0010010";
					RB_Out <= '0';
					
				when "0110" => 
					segments <="0000010";
					RB_Out <= '0';
					
				when "0111" => 
					segments <="1111000";
					RB_Out <= '0';
					
				when "1000" => 
					segments <="0000000";
					RB_Out <= '0';
					
				when "1001" => 
					segments <="0011000";
					RB_Out <= '0';
				
				when others => 
					segments <="1111111";
					RB_Out <= '0';
		
		end case;
	end process;

end behavior;