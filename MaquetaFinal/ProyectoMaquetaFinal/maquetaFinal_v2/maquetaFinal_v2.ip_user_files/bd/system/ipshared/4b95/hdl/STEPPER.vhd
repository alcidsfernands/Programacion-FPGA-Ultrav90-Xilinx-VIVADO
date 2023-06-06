----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2021 19:15:04
-- Design Name: 
-- Module Name: STEPPER - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity STEPPER is
port(
reset: in std_logic; -- button es el reset activo por nivel alto
clk: in std_logic; -- clk es el reloj de 125 MHz que da el propio Zynq/Zybo
enable: in std_logic; -- para habilitar el motor por nivel bajo
dir: in std_logic; --dirección
step: out std_logic;
dir_sal: out std_logic;
enable_sal: out std_logic
);
end STEPPER;

architecture Behavioral of STEPPER is

signal frecuencia_paso_paso: integer range 0 to 100000;

begin


dir_sal<=dir;
enable_sal<=enable;

process(clk, reset)
begin
if clk='1' and clk'event then
    if reset='1' then
        frecuencia_paso_paso<=0;
    else
        if frecuencia_paso_paso=100000 then --0 then
            frecuencia_paso_paso<=0;
        else
            frecuencia_paso_paso<=frecuencia_paso_paso+1;
        end if;
    end if;
end if;
end process;

process(frecuencia_paso_paso)
begin
    if frecuencia_paso_paso<50000 then
        step<='1';
    else
        step<='0';
    end if;
end process;                            
end Behavioral;

