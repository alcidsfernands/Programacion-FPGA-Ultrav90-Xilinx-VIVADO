library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity DC_MOTOR_21_22 is
port(
clk: in std_logic;
reset: in std_logic;
duty_cycle: in std_logic_vector (6 downto 0);
freq_pwm: in std_logic_vector (9 downto 0);
error: out std_logic;
pwm_dc_motor: out std_logic
);
end DC_MOTOR_21_22;

architecture Behavioral of DC_MOTOR_21_22 is

signal pwm: std_logic;
signal selector: std_logic_vector (3 downto 0);
--signal duty_cycle: integer range 0 to 100;

signal contador_base: integer range 0 to 10000000;
signal pwm_tope: integer range 0 to 10000000;
signal estado: std_logic_vector (2 downto 0);
signal freq_pwm_entero: integer range 0 to 1023;
signal frecuencia_pwm_flancos: integer range 0 to 100000000;
signal duty_cycle_entero: integer range 0 to 100;

begin

pwm_dc_motor<=pwm; --para ver la señal en un oscilo
--frecuencia_pwm<=200; --este valor controla la frecuencia del pwm
freq_pwm_entero<=to_integer(unsigned(freq_pwm));

process(duty_cycle)
begin
if duty_cycle>=0 and duty_cycle<=100 then
duty_cycle_entero<=to_integer(unsigned(duty_cycle));
error<='0';
else
duty_cycle_entero<=0;
error<='1';
end if;
end process;

-- frecuencia_pwm_flancos indica cuántos flancos del reloj del sistema hacen
-- falta para generar el periodo de PWM contando flancos flancos.
-- Por ejemplo para 100 Hz debe contar 1250000 flancos
process(freq_pwm_entero)
begin
frecuencia_pwm_flancos<=100000000/freq_pwm_entero;
end process;

-- pwm_tope expresa en flancos cuántos flancos debe estar la salida a 1
process(duty_cycle_entero, freq_pwm_entero)
begin
pwm_tope<=100000000/freq_pwm_entero*duty_cycle_entero/100;
end process;

process(clk, reset)
begin
if reset='1' then
    estado<="000";
elsif clk='1' and clk'event then
    case estado is
    --estado reset
    when "000" =>   contador_base<=0;
                    if  duty_cycle_entero=0 then
                        estado<="001";
                    else
                        estado<="010";
                    end if;
    --estado de comienzo pero duty_cycle es 0%, o sea pwm inactivo todo el rato
    when "001" =>   contador_base<=1;
                    estado<="011";
    --estado que comienza con el pwm a 1
    when "010" =>   contador_base<=1;
                    estado<="100";
    --estado que rellena los 0 hasta el final
    when "011" =>   contador_base<=contador_base+1;
                    if  contador_base<frecuencia_pwm_flancos then
                        estado<="011";
                    else 
                        if  duty_cycle_entero=0 then
                            estado<="001";
                        else 
                            estado<="010";
                        end if;
                    end if;
    --estado que desarrolla el pwm a 1
    when "100" =>   contador_base<=contador_base+1;
                    if  contador_base=pwm_tope then
                        if  duty_cycle_entero=100 then 
                            estado<="010";
                        else 
                            estado<="011";
                        end if;
                    else
                        estado<="100";
                    end if;
    when others =>  estado<="000";
                    contador_base<=0;
    end case;
end if;
end process;

process(estado)
begin
case estado is
    when "000" => pwm<='0';
    when "001" => pwm<='0';
    when "010" => pwm<='1';
    when "011" => pwm<='0';
    when "100" => pwm<='1';
    when others => pwm<='0';
end case;
end process;

end Behavioral;
