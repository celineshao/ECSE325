--
-- entity name: g15_ARCCOS (replace “XX” by your group’s number)
--
-- Version 1.0
-- Authors: Celine Shao, Anna Joy Aylward Burgess
-- Date: March 19, 2025 (enter the date of the latest edit to the file)

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 

entity g15_ARCCOS is

	port ( X : in unsigned(7 downto 0);
			CLK: in std_logic;
		ANGLE : out unsigned(9 downto 0));
		
end g15_ARCCOS;

architecture behavior of g15_ARCCOS is

signal X2: unsigned(15 downto 0);
signal P1: unsigned(31 downto 0);
signal S1: unsigned(31 downto 0);
signal P2: unsigned(47 downto 0);
signal S2: unsigned(47 downto 0);
signal P3: unsigned(55 downto 0);
signal S3: unsigned(55 downto 0);
signal Xi: unsigned(7 downto 0);

begin
	X2 <= Xi * Xi;
	P1 <= shift_right(unsigned(86 * X2), 16);
	S1 <= 191 + P1;
	P2 <= shift_right(unsigned(S1 * X2), 16);
	S2 <= 1144 + P2;
	P3 <= shift_right(unsigned(S2 * Xi), 9);
	S3 <= 900 - P3;

	computation: process(CLK)
	begin
		
		if rising_edge(CLK) then
		Xi <= X;
		ANGLE <= S3(55 downto 46);
		end if;
		
	end process;
end behavior;
				