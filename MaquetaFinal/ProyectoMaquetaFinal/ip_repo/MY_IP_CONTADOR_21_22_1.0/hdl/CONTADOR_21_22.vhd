library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTADOR_21_22 is
port (
inicio: in std_logic;
clk: in std_logic;
entrada: in std_logic;
--tipo_pulso: in std_logic;
contador: out std_logic_vector (6 downto 0)
 );
end CONTADOR_21_22;

architecture Behavioral of CONTADOR_21_22 is

signal contador_aux: std_logic_vector (6 downto 0);
signal pulso: std_logic;

signal estado_pulso_positivo: std_logic_vector (1 downto 0);
signal estado_pulso_negativo: std_logic_vector (1 downto 0);
signal pulso_positivo: std_logic;
signal pulso_negativo: std_logic;

begin

process(inicio, clk)
begin
if inicio='1' then
    estado_pulso_positivo<="00";
elsif rising_edge(clk) then
    case estado_pulso_positivo is
    when "00" =>   if entrada='1' then
                        estado_pulso_positivo<="01";
                    end if;
    when "01" =>    estado_pulso_positivo<="10";
    when "10" =>    if entrada='0' then
                        estado_pulso_positivo<="00";
                    end if;                                         
    when others =>  estado_pulso_positivo<="00";
    end case;
end if;
end process;

process(estado_pulso_positivo)
begin
case estado_pulso_positivo is
    when "00" => pulso_positivo<='0';
    when "01" => pulso_positivo<='1';
    when "10" => pulso_positivo<='0';
    when others => pulso_positivo<='0';
end case;
end process;


--process(pulso_positivo, pulso_negativo, tipo_pulso)
--begin
--if tipo_pulso='0' then
    --pulso<=pulso_negativo;    
--else
    pulso<=pulso_positivo;    
--end if;
--end process;

process(clk, inicio)
begin
if inicio='1' then
    contador_aux<="0000000";
elsif rising_edge(clk) then
    if pulso='1' then
        if contador_aux=100 then
            contador_aux<="0000000";
        else
            contador_aux<=contador_aux+10;
        end if;
    end if;    
end if;
end process;
contador<=contador_aux;                    

end Behavioral;
