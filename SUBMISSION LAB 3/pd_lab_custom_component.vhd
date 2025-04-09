--
-- entity name: pd_lab_custom_component (replace “XX” by your group’s number)
--
-- Version 1.0
-- Authors: Celine Shao, Anna Joy Aylward Burgess
-- Date: March 28, 2025 (enter the date of the latest edit to the file)

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 


entity pd_lab_custom_component is
	
	port (clock: in std_logic;
			resetn : in std_logic;
			address : in std_logic_vector(7 downto 0);
			writedata : in std_logic_vector(7 downto 0);
			write : in std_logic;
			chipselect : in std_logic;
			segments1, segments2, segments3, segments4 : out std_logic_vector(6 downto 0));
			

end pd_lab_custom_component;

architecture behavior of pd_lab_custom_component is

signal switches0 : std_logic_vector(7 downto 0);

component g15_lab_2
		port (CLK: in std_logic;
			switches : in std_logic_vector(7 downto 0);
			LED3 : out std_logic_vector(6 downto 0);
			LED2 : out std_logic_vector(6 downto 0);
			LED1 : out std_logic_vector(6 downto 0);
			LED0 : out std_logic_vector(6 downto 0));
end component;
	
begin

U1: g15_lab_2 port map (CLK=>clock, switches=>switches0, LED0=>segments1, LED1=>segments2, LED2=>segments3, LED3=>segments4);

process(clock)
begin
	if rising_edge(clock) then
		if resetn = '0' then
			switches0 <= (others => '0');
		elsif(chipselect = '1') and (write = '1') then
			case address is
			when "00000000" =>
				switches0 <= writedata;
			when others =>
				null;
			end case;
		end if;
	end if;
end process;
		
end behavior;