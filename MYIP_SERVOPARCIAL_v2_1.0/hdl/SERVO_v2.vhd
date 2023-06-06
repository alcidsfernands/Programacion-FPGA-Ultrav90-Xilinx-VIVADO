----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 11:00:58
-- Design Name: 
-- Module Name: SERVO_v2 - Behavioral
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

entity SERVO_v2 is
port(
clk: in std_logic;
reset: in std_logic;
pos_grados: in std_logic_vector (7 downto 0);
frecuencia_pwm: in std_logic_vector (9 downto 0); -- en Hz
tipo_servo: std_logic_vector (2 downto 0);
servo_pwm: out std_logic;
error_pos_grados: out std_logic
);
end SERVO_v2;

architecture Behavioral of SERVO_v2 is

signal contador_base: integer range 0 to 2500000;
signal pwm_tope: integer range 0 to 12500000;
signal estado: std_logic_vector (2 downto 0);
signal frecuencia_pwm_flancos: integer range 0 to 125000000;
signal pos_grados_entero: integer range 0 to 180;
signal frecuencia_clk: integer range 0 to 125000000;
signal frecuencia_pwm_entero: integer range 0 to 1000;


begin

frecuencia_clk<=100000000; -- 100 MHz o 125 MHz
pos_grados_entero<=to_integer(unsigned(pos_grados));
frecuencia_pwm_entero<=to_integer(unsigned(frecuencia_pwm));

frecuencia_pwm_flancos<=frecuencia_clk/frecuencia_pwm_entero; --anchura total del opwm en pulsos, a 50 Hz son 20 ms

-- Duracion del pulso
process(tipo_servo)
begin
case tipo_servo is
when "000" => -- pulso de 1 ms a 2 ms
                pwm_tope<=100000+555*pos_grados_entero;
when "001" => -- pulso de 0,5 ms a 2,5 ms SG90
                pwm_tope<=50000+1111*pos_grados_entero;
when "010" => -- pulso de 0,3 ms a 2,3 ms FUTABA 3003
                pwm_tope<=30000+1111*pos_grados_entero;
-- en los casos libres se pueden poner otros pulsos                
when others =>  pwm_tope<=0;
end case;
end process;                

process(pos_grados)
begin
if pos_grados>180 then
    error_pos_grados<='1';
else
    error_pos_grados<='0';
end if;
end process;     


process(clk, reset)
begin
if reset='1' then
estado<="000";
contador_base<=0;
elsif clk='1' and clk'event then
    case estado is
    --estado reset
    when "000" =>   contador_base<=0;
                    estado<="001";
                                                       
    when "001" =>   contador_base<=contador_base+1;
                    if contador_base=pwm_tope then
                        estado<="010";
                    end if;
    when "010" =>   contador_base<=contador_base+1;
                    if  contador_base=frecuencia_pwm_flancos then 
                        estado<="000";
                    end if;
    when others =>  estado<="000";
                    contador_base<=0;
    end case;
end if;
end process;

process(estado)
begin
case estado is
    when "000" => servo_pwm<='0';
    when "001" => servo_pwm<='1';
    when "010" => servo_pwm<='0';
    when others => servo_pwm<='0';
end case;
end process;

end Behavioral;
