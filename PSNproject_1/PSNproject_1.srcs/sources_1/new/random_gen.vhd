----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2023 05:04:36 PM
-- Design Name: 
-- Module Name: random_gen - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity random_gen is
  Port (st: in std_logic; 
        rst  : in std_logic;
        q : out std_logic_vector(15 downto 0) );
end random_gen;

architecture Behavioral of random_gen is
    signal r1, r_next : std_logic_vector(15 downto 0);
    signal feedback_value : std_logic;
begin
 process (st,rst)
 begin
 if rst='1' then
 r1(0)<='1';
 r1(15 downto 1)<=(others=>'0');
 elsif st'event and st='1' then
 r1<=r_next;
 end if;
 end process;
 feedback_value<=r1(3) xor r1(2) xor r1(0);
 r_next<=feedback_value & r1(15 downto 1);
 q<=r1;
end Behavioral;
