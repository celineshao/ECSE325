--
-- entity name: g15_Binary_BCD16 (replace “XX” by your group’s number)
--
-- Version 1.0
-- Authors: Celine Shao, Anna Joy Aylward Burgess
-- Date: February 26, 2025 (enter the date of the latest edit to the file)

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
signal S10, S14, S16, S18, S22, S24, S26, S28 : std_logic_vector(1 downto 0);
signal S30, S34: std_logic;
signal S31, S35, S36, S37: std_logic_vector(3 downto 0);

component g15_DM74185
	port(EDCBA : in std_logic_vector(4 downto 0);
			Y : out std_logic_vector(6 downto 1) );
end component;

begin
U1: g15_DM74185 port map (EDCBA=>bin(15 downto 11), Y(6 downto 4)=>S8, Y(3 downto 1)=>S9);
U2: g15_DM74185 port map (EDCBA=>S9&bin(10 downto 9), Y(6)=> open, Y(5 downto 4)=>S10, Y(3 downto 1)=>S11);
U3: g15_DM74185 port map (EDCBA=>S8&S10, Y(6 downto 4)=>S12, Y(3 downto 1)=>S13);
U4: g15_DM74185 port map (EDCBA=>S11&bin(8 downto 7), Y(6)=> open, Y(5 downto 4)=>S14, Y(3 downto 1)=>S15);
U5: g15_DM74185 port map (EDCBA=>S13&S14, Y(6)=> open, Y(5 downto 4)=>S16, Y(3 downto 1)=>S17);
U6: g15_DM74185 port map (EDCBA=>S15&bin(6 downto 5), Y(6)=> open, Y(5 downto 4)=>S18, Y(3 downto 1)=>S19);
U7: g15_DM74185 port map (EDCBA=>S12&S16, Y(6 downto 4)=>S20, Y(3 downto 1)=>S21);
U8: g15_DM74185 port map (EDCBA=>S17&S18, Y(6)=> open, Y(5 downto 4)=>S22, Y(3 downto 1)=>S23);
U9: g15_DM74185 port map (EDCBA=>S19&bin(4 downto 3), Y(6)=> open, Y(5 downto 4)=>S24, Y(3 downto 1)=>S25);
U10: g15_DM74185 port map (EDCBA=>S21&S22, Y(6)=> open, Y(5 downto 4)=>S26, Y(3 downto 1)=>S27);
U11: g15_DM74185 port map (EDCBA=>S23&S24, Y(6)=> open, Y(5 downto 4)=>S28, Y(3 downto 1)=>S29);
U12: g15_DM74185 port map (EDCBA=>S25&bin(2 downto 1), Y(6)=> open, Y(5)=>S30, Y(4 downto 1)=>S31);
U13: g15_DM74185 port map (EDCBA=>S20&S26, Y(6 downto 4)=>S32, Y(3 downto 1)=>S33);
U14: g15_DM74185 port map (EDCBA=>S27&S28, Y(6)=> open, Y(5)=>S34, Y(4 downto 1)=>S35);
U15: g15_DM74185 port map (EDCBA=>'0'&S29&S30, Y(6 downto 5)=> open, Y(4 downto 1)=>S36);
U16: g15_DM74185 port map (EDCBA=>'0'&S33&S34, Y(6 downto 5)=> open, Y(4 downto 1)=>S37);

BCD5 <= S32&S37(3);
BCD4 <= S37(2 downto 0)&S35(3);
BCD3 <= S35(2 downto 0)&S36(3);
BCD2 <= S36(2 downto 0)&S31(3);
BCD1 <= S31(2 downto 0)&bin(0);

end behavior;















