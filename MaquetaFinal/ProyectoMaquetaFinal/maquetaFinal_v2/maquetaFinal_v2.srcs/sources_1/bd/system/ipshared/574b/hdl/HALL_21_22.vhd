library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity HALL_21_22 is
port(
clk: in std_logic;
reset: in std_logic;
sensor_hall_verde: in std_logic;
sensor_hall_azul: in std_logic;
sentido_salida_sensor: out std_logic;
contador_micros_eje_prin: out std_logic_vector (19 downto 0)
);
end HALL_21_22;

architecture Behavioral of HALL_21_22 is

signal reloj_micro: std_logic;
signal cuenta_reloj: integer range 0 to 125;

signal estado_rev: std_logic_vector (2 downto 0);
signal contador_micros: std_logic_vector(15 downto 0);

begin

--automata para medir en microsegundos la duracion de una vuelta del eje primario
process(clk, reset)
begin
if clk='1' and clk'event then
    if reset='1' then
        reloj_micro<='0';
        cuenta_reloj<=0;
    else
        if cuenta_reloj=100 then --125 then
            cuenta_reloj<=0;
            reloj_micro<='1';
        else
            reloj_micro<='0';
            cuenta_reloj<=cuenta_reloj+1;
        end if;
    end if;
end if;
end process;

process(clk, reset)
begin
if clk='1' and clk'event then
    if reset='1' then  
        estado_rev<="000";
        contador_micros<="0000000000000000";
        contador_micros_eje_prin<="00000000000000000000";
        sentido_salida_sensor<='0';
    else
    if reloj_micro='1' then
    case estado_rev is
    when "000" => contador_micros<="0000000000000000";
        contador_micros_eje_prin<="00000000000000000000";
        estado_rev<="001";
    when "001" => contador_micros<="0000000000000000";
            if sensor_hall_verde='0' and sensor_hall_azul='0' then
                estado_rev<="010";
            else
                estado_rev<="001";
            end if;
    when "010" => contador_micros<=contador_micros+1;
            if sensor_hall_verde='0' and sensor_hall_azul='1' then
                estado_rev<="011";
                sentido_salida_sensor<='0';
            elsif sensor_hall_verde='1' and sensor_hall_azul='0' then
                estado_rev<="100";
                sentido_salida_sensor<='1';
            elsif sensor_hall_verde='0' and sensor_hall_azul='0' then
                estado_rev<="010";
            elsif contador_micros="1111111111111111" then --rpm=0
                estado_rev<="111";
            end if;
    when "011" => contador_micros<=contador_micros+1;
            if sensor_hall_verde='0' and sensor_hall_azul='0' then
                estado_rev<="101";
            else
                estado_rev<="011";
            end if;
    when "100" => contador_micros<=contador_micros+1;
            if sensor_hall_verde='0' and sensor_hall_azul='0' then
                estado_rev<="110";
            else
               estado_rev<="100";
            end if;
    when "101" => contador_micros_eje_prin<=contador_micros*"1000";
            estado_rev<="001";    
    when "110" => contador_micros_eje_prin<=contador_micros*"1000";
            estado_rev<="001";
    when "111" => contador_micros_eje_prin<=contador_micros*"1000";
            estado_rev<="001";  -- este estado es para detectar rpm=0              
    when others => contador_micros<="0000000000000000";
            contador_micros_eje_prin<="00000000000000000000";
            estado_rev<="000";
            sentido_salida_sensor<='0';    
    end case;
    end if;
end if;
end if;
end process;    

end Behavioral;