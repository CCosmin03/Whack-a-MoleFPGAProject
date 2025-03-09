----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 02:26:45 PM
-- Design Name: 
-- Module Name: Divizor_frecventa - Behavioral
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

entity Divizor_frecventa is
Port
 (
 signal clk:in std_logic;
 signal rst:in std_logic;
 signal new_clk:out std_logic
  );
end Divizor_frecventa;

architecture Behavioral of Divizor_frecventa is
signal counter:integer:=0;
signal ceas_nou:std_logic;
begin

process(clk,rst)
begin
if rst='1' then 
    counter<=0;
    ceas_nou<='0';
elsif clk='1' and clk'event then
    if counter<50000000 then
        counter<=counter+1;
    else
        counter<=0;
        ceas_nou<=not(ceas_nou);
    end if;
end if;
end process;

new_clk<=ceas_nou;
end Behavioral;
