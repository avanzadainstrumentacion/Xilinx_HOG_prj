----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.07.2025 17:27:48
-- Design Name: 
-- Module Name: rgb_dvr - Behavioral
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

entity rgb_dvr is
    Port (clk : in std_logic;
          rgb_led :out std_logic_vector(5 downto 0) );
end rgb_dvr;

architecture Behavioral of rgb_dvr is

    signal contador: integer := 0;
    signal estado : integer := 0;
    signal led : std_logic_vector(5 downto 0);

begin

    process (clk)
    begin
        if rising_edge(clk) then
            contador <= contador + 1;
            if contador = 100000000 then
                contador <= 0;
                estado <= estado + 1;
                if estado = 6 then
                    estado <= 0;
                end if;
            end if;
        end if; 
    end process;
    
    process (estado)
    begin
         case (estado) is
      when 0 =>
         led <= "000001";
      when 1 =>
         led <= "000010";
      when 2 =>
         led <= "000100";
      when 3 =>
         led <= "001000";
      when 4 =>
         led <= "010000";
      when 5 =>
         led <= "100000";
      when others =>
         led <= "000000";
   end case;
    end process;

rgb_led <= led;

end Behavioral;
