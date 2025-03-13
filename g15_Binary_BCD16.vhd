--
-- entity name: g15_Binary_BCD16 (replace “XX” by your group’s number)
--
-- Version 2.0
-- Authors: Celine Shao, Anna Joy Aylward Burgess
-- Date: March 12, 2025 (enter the date of the latest edit to the file)

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;

entity g15_Binary_BCD16 is

	port ( bin : in std_logic_vector(15 downto 0);
		BCD5 : out std_logic_vector(3 downto 0); -- Most significant digit
		BCD4 : out std_logic_vector(3 downto 0);
		BCD3 : out std_logic_vector(3 downto 0);
		BCD2 : out std_logic_vector(3 downto 0);
		BCD1 : out std_logic_vector(3 downto 0) ); -- Least significant digit
		
end g15_Binary_BCD16;

architecture behavior of g15_Binary_BCD16 is

signal S8, S9, S11, S12, S13, S15, S17, S19, S20, S21, S23, S25, S27, S29, S32, S33: std_logic_vector(2 downto 0);
signal S10, S14, S16, S18, S22, S24, S26, S28, S49, S50 : std_logic_vector(1 downto 0);
signal S30, S34, S38, S39, S40, S41, S42, S43, S44, S45, S46, S47: std_logic;
signal S31, S35, S36, S37: std_logic_vector(3 downto 0);


component g15_DM74185
	port(EDCBA : in std_logic_vector(4 downto 0);
			Y : out std_logic_vector(6 downto 1) );
end component;

begin
U1: g15_DM74185 port map (EDCBA=>bin(15 downto 11), Y(6 downto 4)=>S8, Y(3 downto 1)=>S9);
U2: g15_DM74185 port map (EDCBA(4 downto 2)=>S9, EDCBA(1 downto 0)=>bin(10 downto 9), Y(6)=>S38, Y(5 downto 4)=>S10, Y(3 downto 1)=>S11);
U3: g15_DM74185 port map (EDCBA(4 downto 2)=>S8, EDCBA(1 downto 0)=>S10, Y(6 downto 4)=>S12, Y(3 downto 1)=>S13);
U4: g15_DM74185 port map (EDCBA(4 downto 2)=>S11, EDCBA(1 downto 0)=>bin(8 downto 7), Y(6)=>S39, Y(5 downto 4)=>S14, Y(3 downto 1)=>S15);
U5: g15_DM74185 port map (EDCBA(4 downto 2)=>S13, EDCBA(1 downto 0)=>S14, Y(6)=>S40, Y(5 downto 4)=>S16, Y(3 downto 1)=>S17);
U6: g15_DM74185 port map (EDCBA(4 downto 2)=>S15, EDCBA(1 downto 0)=>bin(6 downto 5), Y(6)=>S41, Y(5 downto 4)=>S18, Y(3 downto 1)=>S19);
U7: g15_DM74185 port map (EDCBA(4 downto 2)=>S12, EDCBA(1 downto 0)=>S16, Y(6 downto 4)=>S20, Y(3 downto 1)=>S21);
U8: g15_DM74185 port map (EDCBA(4 downto 2)=>S17, EDCBA(1 downto 0)=>S18, Y(6)=>S42, Y(5 downto 4)=>S22, Y(3 downto 1)=>S23);
U9: g15_DM74185 port map (EDCBA(4 downto 2)=>S19, EDCBA(1 downto 0)=>bin(4 downto 3), Y(6)=>S43, Y(5 downto 4)=>S24, Y(3 downto 1)=>S25);
U10: g15_DM74185 port map (EDCBA(4 downto 2)=>S21, EDCBA(1 downto 0)=>S22, Y(6)=>S44, Y(5 downto 4)=>S26, Y(3 downto 1)=>S27);
U11: g15_DM74185 port map (EDCBA(4 downto 2)=>S23, EDCBA(1 downto 0)=>S24, Y(6)=>S45, Y(5 downto 4)=>S28, Y(3 downto 1)=>S29);
U12: g15_DM74185 port map (EDCBA(4 downto 2)=>S25, EDCBA(1 downto 0)=>bin(2 downto 1), Y(6)=>S46, Y(5)=>S30, Y(4 downto 1)=>S31);
U13: g15_DM74185 port map (EDCBA(4 downto 2)=>S20, EDCBA(1 downto 0)=>S26, Y(6 downto 4)=>S32, Y(3 downto 1)=>S33);
U14: g15_DM74185 port map (EDCBA(4 downto 2)=>S27, EDCBA(1 downto 0)=>S28, Y(6)=>S47, Y(5)=>S34, Y(4 downto 1)=>S35);
U15: g15_DM74185 port map (EDCBA(4)=>'0', EDCBA(3 downto 1)=>S29, EDCBA(0)=>S30, Y(6 downto 5)=>S49, Y(4 downto 1)=>S36);
U16: g15_DM74185 port map (EDCBA(4)=>'0', EDCBA(3 downto 1)=>S33, EDCBA(0)=>S34, Y(6 downto 5)=>S50, Y(4 downto 1)=>S37);

BCD5 <= S32&S37(3);
BCD4 <= S37(2 downto 0)&S35(3);
BCD3 <= S35(2 downto 0)&S36(3);
BCD2 <= S36(2 downto 0)&S31(3);
BCD1 <= S31(2 downto 0)&bin(0);

end behavior;















