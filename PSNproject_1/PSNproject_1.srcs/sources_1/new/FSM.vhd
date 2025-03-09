----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 03:03:36 PM
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
Port 
(
signal clk:in std_logic;
signal rst:in std_logic;
signal btn_power:in std_logic;
signal btn_start:in std_logic;
signal led:out std_logic_vector(15 downto 0);
signal sw:in std_logic_vector(15 downto 0);
signal score:out std_logic_vector(7 downto 0)
--signal debug:out std_logic_vector(3 downto 0)
 );
end FSM;

architecture Behavioral of FSM is
type stari is (power_on_off,waiting_for_start,wam_game1,wam_game2,wam_game3,wam_game4,wam_game5,wam_game6,wam_game7,wam_game8,wam_game9,wam_game10,wam_game11,wam_game12,wam_game13,wam_game14,wam_game15,wam_game16,wam_game17,wam_game18,wam_game19,wam_game20,wam_game21,wam_game22,wam_game23,wam_game24,wam_game25,wam_game26,wam_game27,wam_game28,wam_game29,wam_game30,stop);
signal current_state:stari:=power_on_off;
signal next_state:stari:=power_on_off;
signal scor: std_logic_vector(4 downto 0):="00000";
signal scorafis: std_logic_vector(7 downto 0);
--


signal combinatie_led1:std_logic_vector(15 downto 0):="0000000000000001";
signal combinatie_led2:std_logic_vector(15 downto 0):="1000000000000000";
signal combinatie_led3:std_logic_vector(15 downto 0):="0000010000000000";
signal combinatie_led4:std_logic_vector(15 downto 0):="0000000000100000";
signal combinatie_led5:std_logic_vector(15 downto 0):="0000000000000010";
signal combinatie_led6:std_logic_vector(15 downto 0):="0010000000000000";
signal combinatie_led7:std_logic_vector(15 downto 0):="0000000001000000";
signal combinatie_led8:std_logic_vector(15 downto 0):="0000000000000100";
signal combinatie_led9:std_logic_vector(15 downto 0):="0100000000000000";
signal combinatie_led10:std_logic_vector(15 downto 0):="0000000010000000";
signal combinatie_led11:std_logic_vector(15 downto 0):="0000000000001000";
signal combinatie_led12:std_logic_vector(15 downto 0):="0000100000000000";
signal combinatie_led13:std_logic_vector(15 downto 0):="0000000000010000";
signal combinatie_led14:std_logic_vector(15 downto 0):="0000001000000000";
signal combinatie_led15:std_logic_vector(15 downto 0):="0001000000000000";
signal combinatie_led16:std_logic_vector(15 downto 0):="0000000100000000";
signal combinatie_led17:std_logic_vector(15 downto 0):="0000000000000001";
signal combinatie_led18:std_logic_vector(15 downto 0):="1000000000000000";
signal combinatie_led19:std_logic_vector(15 downto 0):="0000010000000000";
signal combinatie_led20:std_logic_vector(15 downto 0):="0000000000100000";
signal combinatie_led21:std_logic_vector(15 downto 0):="0000000000000010";
signal combinatie_led22:std_logic_vector(15 downto 0):="0010000000000000";
signal combinatie_led23:std_logic_vector(15 downto 0):="0000000001000000";
signal combinatie_led24:std_logic_vector(15 downto 0):="0000000000000100";
signal combinatie_led25:std_logic_vector(15 downto 0):="0100000000000000";
signal combinatie_led26:std_logic_vector(15 downto 0):="0000000010000000";
signal combinatie_led27:std_logic_vector(15 downto 0):="0000000000001000";
signal combinatie_led28:std_logic_vector(15 downto 0):="0000100000000000";
signal combinatie_led29:std_logic_vector(15 downto 0):="0000000000010000";
signal combinatie_led30:std_logic_vector(15 downto 0):="0000001000000000";
signal stocare_sw:std_logic_vector(15 downto 0);

begin
process(clk,rst)
begin
if rst='1' then
    current_state<=power_on_off;
elsif clk='1' and clk'event then
    current_state<=next_state;
end if;
end process;

process(current_state,btn_power,btn_start,stocare_sw)
begin
case current_state is
when power_on_off=> if btn_power='1' then
                       next_state<=waiting_for_start;
                    else
                       next_state<=power_on_off;
                    end if;
when waiting_for_start=> if btn_start='1' then
                            next_state<=wam_game1;
                        else
                            next_state<=waiting_for_start;
                        end if;
when wam_game1=> if stocare_sw=combinatie_led1 then
                        scor<=scor+1;
                        next_state<=wam_game2;
                        else
                        next_state<=wam_game1;
                        end if;
                     
when wam_game2=> if stocare_sw=combinatie_led2 then
                        scor<=scor+1;
                        next_state<=wam_game3;
                        else
                        next_state<=wam_game2;
                        end if;
when wam_game3=> if stocare_sw=combinatie_led3 then
                        scor<=scor+1;
                        next_state<=wam_game4;
                        else
                        next_state<=wam_game3;
                        end if;
when wam_game4=> if stocare_sw=combinatie_led4 then
                        scor<=scor+1;
                        next_state<=wam_game5;
                        else
                        next_state<=wam_game4;
                        end if;
when wam_game5=> if stocare_sw=combinatie_led5 then
                        scor<=scor+1;
                        next_state<=wam_game6;
                        else
                        next_state<=wam_game5;
                        end if;
 when wam_game6=> if stocare_sw=combinatie_led6 then
                        scor<=scor+1;
                        next_state<=wam_game7;
                        else
                        next_state<=wam_game6;
                        end if;
when wam_game7=> if stocare_sw=combinatie_led7 then
                        scor<=scor+1;
                        next_state<=wam_game8;
                        else
                        next_state<=wam_game7;
                        end if; 
when wam_game8=> if stocare_sw=combinatie_led8 then
                        scor<=scor+1;
                        next_state<=wam_game9;
                        else
                        next_state<=wam_game8;
                        end if;
when wam_game9=> if stocare_sw=combinatie_led9 then
                        scor<=scor+1;
                        next_state<=wam_game10;
                        else
                        next_state<=wam_game9;
                        end if;
when wam_game10=> if stocare_sw=combinatie_led10 then
                        scor<=scor+1;
                        next_state<=wam_game11;
                        else
                        next_state<=wam_game10;
                        end if; 
when wam_game11=> if stocare_sw=combinatie_led11 then
                        scor<=scor+1;
                        next_state<=wam_game12;
                        else
                        next_state<=wam_game11;
                        end if; 
when wam_game12=> if stocare_sw=combinatie_led12 then
                        scor<=scor+1;
                        next_state<=wam_game13;
                        else
                        next_state<=wam_game12;
                        end if; 
when wam_game13=> if stocare_sw=combinatie_led13 then
                        scor<=scor+1;
                        next_state<=wam_game14;
                        else
                        next_state<=wam_game13;
                        end if;   
when wam_game14=> if stocare_sw=combinatie_led14 then
                        scor<=scor+1;
                        next_state<=wam_game15;
                        else
                        next_state<=wam_game14;
                        end if;  
when wam_game15=> if stocare_sw=combinatie_led15 then
                        scor<=scor+1;
                        next_state<=wam_game16;
                        else
                        next_state<=wam_game15;
                        end if; 
when wam_game16=> if stocare_sw=combinatie_led16 then
                        scor<=scor+1;
                        next_state<=wam_game17;
                        else
                        next_state<=wam_game16;
                        end if; 
                        
 when wam_game17=> if stocare_sw=combinatie_led17 then
                        scor<=scor+1;
                        next_state<=wam_game18;
                        else
                        next_state<=wam_game17;
                        end if;
                     
when wam_game18=> if stocare_sw=combinatie_led18 then
                        scor<=scor+1;
                        next_state<=wam_game19;
                        else
                        next_state<=wam_game18;
                        end if;
when wam_game19=> if stocare_sw=combinatie_led19 then
                        scor<=scor+1;
                        next_state<=wam_game20;
                        else
                        next_state<=wam_game19;
                        end if;
when wam_game20=> if stocare_sw=combinatie_led20 then
                        scor<=scor+1;
                        next_state<=wam_game21;
                        else
                        next_state<=wam_game20;
                        end if;
when wam_game21=> if stocare_sw=combinatie_led21 then
                        scor<=scor+1;
                        next_state<=wam_game22;
                        else
                        next_state<=wam_game21;
                        end if;
 when wam_game22=> if stocare_sw=combinatie_led22 then
                        scor<=scor+1;
                        next_state<=wam_game23;
                        else
                        next_state<=wam_game22;
                        end if;
when wam_game23=> if stocare_sw=combinatie_led23 then
                        scor<=scor+1;
                        next_state<=wam_game24;
                        else
                        next_state<=wam_game23;
                        end if; 
when wam_game24=> if stocare_sw=combinatie_led24 then
                        scor<=scor+1;
                        next_state<=wam_game25;
                        else
                        next_state<=wam_game24;
                        end if;
when wam_game25=> if stocare_sw=combinatie_led25 then
                        scor<=scor+1;
                        next_state<=wam_game26;
                        else
                        next_state<=wam_game25;
                        end if;
when wam_game26=> if stocare_sw=combinatie_led26 then
                        scor<=scor+1;
                        next_state<=wam_game27;
                        else
                        next_state<=wam_game26;
                        end if; 
when wam_game27=> if stocare_sw=combinatie_led27 then
                        scor<=scor+1;
                        next_state<=wam_game28;
                        else
                        next_state<=wam_game27;
                        end if; 
when wam_game28=> if stocare_sw=combinatie_led28 then
                        scor<=scor+1;
                        next_state<=wam_game29;
                        else
                        next_state<=wam_game28;
                        end if; 
when wam_game29=> if stocare_sw=combinatie_led29 then
                        scor<=scor+1;
                        next_state<=wam_game30;
                        else
                        next_state<=wam_game29;
                        end if;   
when wam_game30=> if stocare_sw=combinatie_led30 then
                        scor<=scor+1;
                        next_state<=stop;
                        else
                        next_state<=wam_game30;
                        end if;                                                                                                                                                                                                                                                                
when others=> next_state<=stop;-- stop
end case;
end process;

process (scor)
begin
case scor is
when "00000" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0000";
when "00001" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0001";
when "00010" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0010";
when "00011" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0011";
when "00100" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0100";
when "00101" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0101";
when "00110" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0110";
when "00111" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0111";
when "01000" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="1000";
when "01001" =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="1001";

---
when "01010" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0000";
when "01011" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0001";
when "01100" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0010";
when "01101" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0011";
when "01110" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0100";
when "01111" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0101";
when "10000" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0110";
when "10001" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="0111";
when "10010" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="1000";
when "10011" =>scorafis(7 downto 4)<="0001"; scorafis(3 downto 0)<="1001";

---
when "10100" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0000";
when "10101" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0001";
when "10110" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0010";
when "10111" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0011";
when "11000" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0100";
when "11001" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0101";
when "11010" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0110";
when "11011" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="0111";
when "11100" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="1000";
when "11101" =>scorafis(7 downto 4)<="0010"; scorafis(3 downto 0)<="1001";
---
when "11110" =>scorafis(7 downto 4)<="0011"; scorafis(3 downto 0)<="0000";
when others =>scorafis(7 downto 4)<="0000"; scorafis(3 downto 0)<="0000";
end case;

end process;

process(clk)
begin
if clk='1' and clk'event then
    if current_state=wam_game1 then
        stocare_sw<=sw;
    end if;
     if current_state=wam_game2 then
        stocare_sw<=sw;
    end if;
    if current_state=wam_game3 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game4 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game5 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game6 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game7 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game8 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game9 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game10 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game11 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game12 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game13 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game14 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game15 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game16 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game17 then
        stocare_sw<=sw;
    end if;
     if current_state=wam_game18 then
        stocare_sw<=sw;
    end if;
     if current_state=wam_game19 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game20 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game21 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game22 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game23 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game24 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game25 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game26 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game27 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game28 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game29 then
        stocare_sw<=sw;
     end if;
     if current_state=wam_game30 then
        stocare_sw<=sw;
     end if;
 end if;
end process;

process(current_state,scor)
begin
case current_state is
when power_on_off=>led<=x"0000";score<=scorafis;
when waiting_for_start=>led<=x"0000";score<=scorafis;
when wam_game1=>led<=combinatie_led1;score<=scorafis;
when wam_game2=>led<=combinatie_led2;score<=scorafis;
when wam_game3=>led<=combinatie_led3;score<=scorafis;
when wam_game4=>led<=combinatie_led4;score<=scorafis;
when wam_game5=>led<=combinatie_led5;score<=scorafis;
when wam_game6=>led<=combinatie_led6;score<=scorafis;
when wam_game7=>led<=combinatie_led7;score<=scorafis;
when wam_game8=>led<=combinatie_led8;score<=scorafis;
when wam_game9=>led<=combinatie_led9;score<=scorafis;
when wam_game10=>led<=combinatie_led10;score<=scorafis;
when wam_game11=>led<=combinatie_led11;score<=scorafis;
when wam_game12=>led<=combinatie_led12;score<=scorafis;
when wam_game13=>led<=combinatie_led13;score<=scorafis;
when wam_game14=>led<=combinatie_led14;score<=scorafis;
when wam_game15=>led<=combinatie_led15;score<=scorafis;
when wam_game16=>led<=combinatie_led16;score<=scorafis;
when wam_game17=>led<=combinatie_led17;score<=scorafis;
when wam_game18=>led<=combinatie_led18;score<=scorafis;
when wam_game19=>led<=combinatie_led19;score<=scorafis;
when wam_game20=>led<=combinatie_led20;score<=scorafis;
when wam_game21=>led<=combinatie_led21;score<=scorafis;
when wam_game22=>led<=combinatie_led22;score<=scorafis;
when wam_game23=>led<=combinatie_led23;score<=scorafis;
when wam_game24=>led<=combinatie_led24;score<=scorafis;
when wam_game25=>led<=combinatie_led25;score<=scorafis;
when wam_game26=>led<=combinatie_led26;score<=scorafis;
when wam_game27=>led<=combinatie_led27;score<=scorafis;
when wam_game28=>led<=combinatie_led28;score<=scorafis;
when wam_game29=>led<=combinatie_led29;score<=scorafis;
when wam_game30=>led<=combinatie_led30;score<=scorafis;
when others=> led<=x"FFFF";score<="00000000";
end case;
end process;

end Behavioral;
