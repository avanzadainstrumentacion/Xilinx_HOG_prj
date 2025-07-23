----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.07.2025 16:17:18
-- Design Name: 
-- Module Name: dvr_leds - Behavioral
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

entity dvr_leds is
    Port (in_leds: in std_logic_vector(3 downto 0);
          out_leds: out std_logic_vector(3 downto 0));
end dvr_leds;

architecture Behavioral of dvr_leds is
    
    signal intermediate_leds: std_logic_vector(3 downto 0);
    
begin

    process (in_leds)
    begin
          case (in_leds) is
      when "0000" =>
         intermediate_leds <= "0001";
      when "0001" =>
         intermediate_leds <= "0010";
      when "0010" =>
         intermediate_leds <= "0100";
      when "0011" =>
         intermediate_leds <= "1000";
      when "0100" =>
         intermediate_leds <= "1001";
      when "0101" =>
         intermediate_leds <= "0110";
      when "0110" =>
         intermediate_leds <= "1010";
      when "0111" =>
         intermediate_leds <= "0101";
      when others =>
         intermediate_leds <= "0000";
   end case;
    end process;
    
    out_leds <= intermediate_leds;
    
end Behavioral;
