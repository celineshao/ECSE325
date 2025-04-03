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

--signal X2: unsigned(15 downto 0);
--signal P1: unsigned(31 downto 0);
--signal S1: unsigned(31 downto 0);
--signal P2: unsigned(47 downto 0);
--signal S2: unsigned(47 downto 0);
--signal P3: unsigned(55 downto 0);
--signal S3: unsigned(55 downto 0);
--signal Xi: unsigned(7 downto 0);
signal Xi, X2, P1, S1, P2, S2, P3, ANGLEi : integer;

begin
	X2 <= Xi * Xi;
	P1 <= to_integer(shift_right(to_unsigned(86 * X2, 23), 16));
	S1 <= 191 + P1;
	P2 <= to_integer(shift_right(to_unsigned(S1 * X2, 25), 16));
	S2 <= 1144 + P2;
	P3 <= to_integer(shift_right(to_unsigned(S2 * Xi, 19), 9));
	ANGLEi <= 900 - P3;

	computation: process(CLK)
	begin
		
		if rising_edge(CLK) then
		Xi <= to_integer(X);
		ANGLE <= to_unsigned(ANGLEi, 10);
		end if;
		
	end process;
end behavior;
				