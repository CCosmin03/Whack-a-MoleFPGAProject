----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 02:24:48 PM
-- Design Name: 
-- Module Name: Nexys4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nexys4 is
Port 
( 
signal clk:in std_logic;
signal btn:in std_logic_vector(4 downto 0);
signal sw:in std_logic_vector(15 downto 0);
signal led:out std_logic_vector(15 downto 0);
signal cat:out std_logic_vector(6 downto 0);
signal an:out std_logic_vector(7 downto 0)
);
end Nexys4;

architecture Behavioral of Nexys4 is

signal rst:std_logic;
signal ceas_secunda:std_logic;
signal counter_secunde:std_logic_vector(5 downto 0);
signal seconds_conversion:std_logic_vector(7 downto 0);
signal Data:std_logic_vector(31 downto 0);

signal btn_start:std_logic;
signal btn_power:std_logic;
signal score:std_logic_vector(7 downto 0);
begin

button_central: entity WORK.mpg port map
(
clk=>clk,
btn=>btn(0),
en=>rst
);

button_up: entity WORK.mpg port map
(
clk=>clk,
btn=>btn(1),
en=>btn_power
);

button_down: entity WORK.mpg port map
(
clk=>clk,
btn=>btn(4),
en=>btn_start
);
display:entity WORK.SSDv1 port map
(
clk=>clk,
cat=>cat,
data=>data,
an=>an
);
div_frec:entity WORK.Divizor_frecventa port map
(
clk=>clk,
rst=>rst,
new_clk=>ceas_secunda
);

process(ceas_secunda,rst)
begin
if rst='1' then
    counter_secunde(5 downto 0)<="111100";
elsif ceas_secunda='1' and ceas_secunda'event then
    if counter_secunde>"000000" then -- 60
        counter_secunde<=counter_secunde-1;
    end if;
end if;
end process;

process(counter_secunde)
begin
case counter_secunde is
when "000000" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0000";
when "000001" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0001";
when "000010" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0010";
when "000011" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0011";
when "000100" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0100";
when "000101" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0101";
when "000110" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0110";
when "000111" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0111";
when "001000" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="1000";
when "001001" => seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="1001";
---10
when "001010" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0000";
when "001011" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0001";
when "001100" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0010";
when "001101" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0011";
when "001110" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0100";
when "001111" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0101";
when "010000" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0110";
when "010001" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="0111";
when "010010" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="1000";
when "010011" => seconds_conversion(7 downto 4)<="0001"; seconds_conversion(3 downto 0)<="1001";
---20
when "010100" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0000";
when "010101" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0001";
when "010110" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0010";
when "010111" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0011";
when "011000" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0100";
when "011001" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0101";
when "011010" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0110";
when "011011" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="0111";
when "011100" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="1000";
when "011101" => seconds_conversion(7 downto 4)<="0010"; seconds_conversion(3 downto 0)<="1001";
---30
when "011110" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0000";
when "011111" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0001";
when "100000" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0010";
when "100001" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0011";
when "100010" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0100";
when "100011" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0101";
when "100100" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0110";
when "100101" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="0111";
when "100110" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="1000";
when "100111" => seconds_conversion(7 downto 4)<="0011"; seconds_conversion(3 downto 0)<="1001";
---40
when "101000" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0000";
when "101001" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0001";
when "101010" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0010";
when "101011" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0011";
when "101100" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0100";
when "101101" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0101";
when "101110" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0110";
when "101111" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="0111";
when "110000" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="1000";
when "110001" => seconds_conversion(7 downto 4)<="0100"; seconds_conversion(3 downto 0)<="1001";
---50
when "110010" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0000";
when "110011" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0001";
when "110100" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0010";
when "110101" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0011";
when "110110" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0100";
when "110111" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0101";
when "111000" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0110";
when "111001" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="0111";
when "111010" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="1000";
when "111011" => seconds_conversion(7 downto 4)<="0101"; seconds_conversion(3 downto 0)<="1001";
---

when others =>   seconds_conversion(7 downto 4)<="0000"; seconds_conversion(3 downto 0)<="0000";
end case;

end process;

data<=seconds_conversion & x"0000" & score;

maincomp:entity work.FSM port map
(
clk=>clk,
rst=>rst,
btn_power=>btn_power,
btn_start=>btn_start,
led=>led,
sw=>sw,
score=>score
);
end Behavioral;
