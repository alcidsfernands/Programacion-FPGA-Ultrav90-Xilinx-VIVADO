----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2021 11:10:10
-- Design Name: 
-- Module Name: MY_IP_HC_SR04 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


-- ESTE IP controal el sensor de ULTRASONIDOS HC_SR04
-- Tiene reloj y reset y luego varias entradas y salidas:
-- trigger: es un pulso de al menos 10 us que debe entregarse al sensor
-- echo: es el pulso que devuelve el sensor a la ZYBO
-- us_echo: es una signal (en el sensor de VHDL es el output) que entrega la duración
-- que en us tiene el echo del sensor.
-- Luego este valor se pasa al ARM para que calcule la distancia en mm (us_ech/58*10)
-- o en cm (us_echo/58). Yo no hago el cálculo porque me complica el tema de los enteros y los bits

entity MY_IP_HC_SR04 is
port(
clk: in std_logic; -- al ser con ARM es de 100 MHz, no de 125 MHz
reset: in std_logic;
echo: in std_logic;
us_echo: out std_logic_vector (14 downto 0);
trigger: out std_logic
);

end MY_IP_HC_SR04;

architecture Behavioral of MY_IP_HC_SR04 is

signal reloj_1mhz: integer range 0 to 100;
signal cont_base_ciclo: integer range 0 to 100000000; -- me sobra
signal estado: std_logic_vector (2 downto 0);
-- declaro cont_sensor como bits para luego pasarlas sin problemas al IP y al ARM
signal cont_sensor: std_logic_vector (14 downto 0); 

begin

-- reducimos la frecuencia a un 1 MHz para que todo sea más evidente
process(clk, reset)
begin
if rising_edge(clk) then
    if reset='1' then
        reloj_1mhz<=0;
     else
        if reloj_1mhz=100 then
            reloj_1mhz<=0;
        else
            reloj_1mhz<=reloj_1mhz+1;
        end if;
     end if;
end if;
end process;


-- El autómata es muy largo como es mi costumbre
-- pero así está todo separado bien
process(clk, reset)
begin
if rising_edge(clk) then
    if reset='1' then
        estado<="000";
        cont_base_ciclo<=0;
        cont_sensor<="000000000000000";--0;
--        us_echo<="000000000000000";
    else
    if reloj_1mhz=0 then
    case estado is
    when "000" =>   -- comienza un nuevo ciclo de lectura, reinicio
                    estado<="001";
                    cont_base_ciclo<=0;
                    cont_sensor<="000000000000000";
--                    us_echo<="000000000000000";
    when "001" =>   -- aguanta wait 700 us antes de empezar, no es obligatorio pero lo dice Xilinx
                    cont_base_ciclo<=cont_base_ciclo+1;
                    cont_sensor<="000000000000000";
                    if cont_base_ciclo<=700 then   
                        estado<="001";
                    else
                        estado<="010";
                    end if;
    when "010" =>   -- genera un trigger (pulso) de 10 us, exactos
                    -- ver el process externo para el trigger
                    cont_base_ciclo<=cont_base_ciclo+1;
                    cont_sensor<="000000000000000";
                    if cont_base_ciclo<=(10+700) then
                        estado<="010";
                    else
                        estado<="011";
                    end if;
    when "011" =>   -- wait de 200 us mientras el sensor envía 8 pulsos, ver data sheet 
                    cont_base_ciclo<=cont_base_ciclo+1;
                    cont_sensor<="000000000000000";
                    if cont_base_ciclo<=(200+10+700) then
                        estado<="011";
                    else
                        estado<="100";
                    end if;
    when "100" =>   -- cada vez que echo='1' entonces suma pulsos
                    -- hay muchos rebotes, así que le he puesto que cuente
                    -- hasta alcanzar el máximo que puede durar el echo, 30 ms
                    cont_base_ciclo<=cont_base_ciclo+1;
                    if echo='1' then
                        cont_sensor<=cont_sensor+1;
                        estado<="100";
                    elsif cont_base_ciclo<(30000+200+10+700) then --quitando rebotes
                        cont_sensor<=cont_sensor;
                        estado<="100";                    
                    else
                        estado<="101";
                        cont_sensor<=cont_sensor;
                    end if;
    when "101" =>   -- calcular la distancia tras contar los pulsos del echo
                    -- este estado se usa fuera
                    cont_base_ciclo<=cont_base_ciclo;
                    cont_sensor<=cont_sensor;
                    us_echo<=cont_sensor;
                    estado<="110";
    when "110" =>   -- aguanta wait 30000 us (30 ms) antes de volver a leer
                    cont_base_ciclo<=cont_base_ciclo+1;
                    cont_sensor<="000000000000000";
                    if cont_base_ciclo<=(30000+30000+200+10+700) then   
                        estado<="110";
                    else
                        estado<="000";
                    end if;
    when others => estado<="000";
    end case;
    end if;
    end if;
end if;
end process;                    

-- ATENCION. El valor de 30000 en el estado 100 es para contar todos los pulsos hasta el máximo
-- tiempo que puede dar el echo, que es de 4 metros. Si uno no sabe que no va pasar de 1 m, por ejemplo, pues ese valor de 30000 us
-- se puede bajar a 10000 o 5000 o lo que sea. Es interesante.

process(estado)
begin
case estado is
when "010" =>   trigger<='1';
when others =>  trigger<='0';
end case;
end process;

end Behavioral;
