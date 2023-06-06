library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_1164.ALL;

entity FILTRO_21_22 is
Port (
clk: in std_logic;
inicio: in std_logic;
entrada: in std_logic;
salida: out std_logic;
salida_pin: out std_logic
 );
end FILTRO_21_22;

architecture Behavioral of FILTRO_21_22 is

signal cont_filtro: integer range 0 to 1000000; --1 cs a 100 MHz son 1000000
signal estado_filtro: std_logic_vector (1 downto 0);

begin

process(clk, inicio)
begin
if inicio='1' then
    estado_filtro<="00";
elsif rising_edge(clk) then
    case estado_filtro is
    when "00" =>    cont_filtro<=0;
                    if entrada='1' then
                        estado_filtro<="01";
                    end if;                        
    when "01" =>    if entrada='0' then
                        estado_filtro<="00";
                    else
                        if cont_filtro>=1000000 then
                           estado_filtro<="10";
                        else
                            cont_filtro<=cont_filtro+1;
                            estado_filtro<="01";                           
                        end if;
                    end if;                                                                          
    when "10" =>    cont_filtro<=0;
                    if entrada='0' then
                        estado_filtro<="11";
                    end if;                        
    when "11" =>    if entrada='1' then
                        estado_filtro<="10";
                    else
                        if cont_filtro>=1000000 then
                           estado_filtro<="00";
                        else
                            cont_filtro<=cont_filtro+1;
                            estado_filtro<="11";                           
                        end if;
                    end if;                                                                          
    when others =>  estado_filtro<="00";
                    cont_filtro<=0;    
    end case;
end if;    
end process;

process(estado_filtro)
begin
case estado_filtro is
when "00" =>    salida<='0';
                salida_pin<='0';
when "01" =>    salida<='0';
                salida_pin<='0';
when "10" =>    salida<='1';
                salida_pin<='1';
when "11" =>    salida<='1';
                salida_pin<='1';
when others =>  salida<='0';
                salida_pin<='0';
end case;
end process;

end Behavioral;

