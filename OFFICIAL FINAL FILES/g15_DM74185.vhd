--
-- entity name: g15_DM74185 (replace “XX” by your group’s number)
--
-- Version 1.0
-- Authors: Celine Shao, Anna Joy Aylward Burgess
-- Date: February 26, 2025 (enter the date of the latest edit to the file)

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;

entity g15_DM74185 is
	port ( EDCBA : in std_logic_vector(4 downto 0);
		Y : out std_logic_vector(6 downto 1) );
end g15_DM74185;

architecture behavior of g15_DM74185 is

begin
	P1: process(EDCBA) 
	begin
		case EDCBA is
			when "00000" => Y <= "000000";
			when "00001" => Y <= "000001";
			when "00010" => Y <= "000010";
			when "00011" => Y <= "000011";
			
			when "00100" => Y <= "000100";
			when "00101" => Y <= "001000";
			when "00110" => Y <= "001001";
			when "00111" => Y <= "001010";
			
			when "01000" => Y <= "001011";
			when "01001" => Y <= "001100";
			when "01010" => Y <= "010000";
			when "01011" => Y <= "010001";
			
			when "01100" => Y <= "010010";
			when "01101" => Y <= "010011";
			when "01110" => Y <= "010100";
			when "01111" => Y <= "011000";
			
			when "10000" => Y <= "011001";
			when "10001" => Y <= "011010";
			when "10010" => Y <= "011011";
			when "10011" => Y <= "011100";
			
			when "10100" => Y <= "100000";
			when "10101" => Y <= "100001";
			when "10110" => Y <= "100010";
			when "10111" => Y <= "100011";
			
			when "11000" => Y <= "100100";
			when "11001" => Y <= "101000";
			when "11010" => Y <= "101001";
			when "11011" => Y <= "101010";
			
			when "11100" => Y <= "101011";
			when "11101" => Y <= "101100";
			when "11110" => Y <= "110000";
			when "11111" => Y <= "110001";
			
			when others => Y <= "000000";
			
		end case;
	end process;
end behavior;