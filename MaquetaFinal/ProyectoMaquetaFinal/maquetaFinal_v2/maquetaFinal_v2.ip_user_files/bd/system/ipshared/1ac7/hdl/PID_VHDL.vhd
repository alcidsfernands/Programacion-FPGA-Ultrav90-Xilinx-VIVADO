

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity PID_VHDL is
 Port ( 
 clk: in std_logic;
 reset: in std_logic;
 error:  in std_logic_vector (6 downto 0);
 KP: in std_logic_vector (6 downto 0);
 KI: in std_logic_vector (6 downto 0);
 KD: in std_logic_vector (6 downto 0);
 PID_Reg: OUT STD_LOGIC_VECTOR(6  DOWNTO 0);
 PID_out: out std_logic_vector (6 downto 0)
 );
end PID_VHDL;

architecture Behavioral of PID_VHDL is

TYPE ultimo_estado IS 
(
E0, E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15, E16
);

SIGNAL atual_estado: ultimo_estado:=E0;
SIGNAL seguinte_estado: ultimo_estado;
SIGNAL Uk, U_k, Uk_1, Ek, Ek_1, Ek_2: integer:=0;
SIGNAL m_k: integer:=0;
SIGNAL CAL1, CAL2, CAL3, CAL4, CAL5, CAL6:INTEGER:=0;
SIGNAL A_integral, A_i: integer:=0;
SIGNAL m_k_intero: integer range 0 to 100;
CONSTANT T: INTEGER:=100;
SIGNAL AUX_KP: INTEGER:=0;
SIGNAL AUX_KI: INTEGER:=0;
SIGNAL AUX_KD: INTEGER:=0;


begin
AUX_KP<= TO_INTEGER(UNSIGNED(KP));
AUX_KI<= TO_INTEGER(UNSIGNED(KI));
AUX_KD<= TO_INTEGER(UNSIGNED(KD));



    PROCESS (clk, reset)
        BEGIN
            IF(clk'event and clk='1') THEN
                IF (reset='0') THEN
                    atual_estado<=E0;
                ELSE
                    atual_estado<=seguinte_estado;
                END IF;
             END IF;
     END PROCESS;

PROCESS(atual_estado)
BEGIN
    CASE atual_estado IS
    WHEN E0=>seguinte_estado<=E1;
    WHEN E1=>seguinte_estado<=E2;
    WHEN E2=>seguinte_estado<=E3;
    WHEN E3=>seguinte_estado<=E4;
    WHEN E4=>seguinte_estado<=E5;
    WHEN E5=>seguinte_estado<=E6;
    WHEN E6=>seguinte_estado<=E7;
    WHEN E7=>seguinte_estado<=E8;
    WHEN E8=>seguinte_estado<=E9;
    WHEN E9=>seguinte_estado<=E10;
    WHEN E10=>seguinte_estado<=E11;
    WHEN E11=>seguinte_estado<=E12;
    WHEN E12=>seguinte_estado<=E13;
    WHEN E13=>seguinte_estado<=E14;
    WHEN E14=>seguinte_estado<=E15;
    WHEN E15=>seguinte_estado<=E16;
    WHEN OTHERS => seguinte_estado<=E0;
    
    END CASE;
END PROCESS;

PROCESS(clk, atual_estado, error)
BEGIN
    IF(clk'event and clk='1') THEN
        CASE atual_estado IS
            WHEN E0=>
                m_k<=0;
                U_k<=0;
                Uk_1<=0;
                Ek<=0;
                Ek_1<=0;
                Ek_2<=0;
            
            WHEN E1=>
                Ek<= TO_INTEGER(UNSIGNED( error));
            
            WHEN E2=>
                CAL1<=AUX_KP*Ek;
            
            WHEN E3=>
                CAL2<=((AUX_KD*T)*Ek);    
            
            WHEN E4=>
                CAL3<=((AUX_KI*Ek_1)/(T));
            
            WHEN E5=>
                CAL4<= AUX_KP*Ek_1;
            
            WHEN E6=>
                CAL5<=2*AUX_KD*T*Ek_1;
            
            WHEN E7=>
                CAL6<=(AUX_KD*T)*Ek_2;
            
            WHEN E8=>
                A_INTEGRAL<=CAL3;
            
            WHEN E9=>
                IF (A_integral>10000000 or A_integral<=0) THEN
                A_I<=0;
                ELSE 
                    A_I<=A_integral;
                END IF;
           
           WHEN E10=>
                U_k<= Uk_1 + CAL1+CAL2+A_I-CAL4-CAL5+CAL6;
            
            WHEN E11=>
                IF U_k>10000000 THEN
                    Uk<=10000000;
                ELSIF U_k<=0 THEN
                    uk<=0;
                ELSE
                    Uk<=U_k;
                END IF;    
            
            WHEN E12=>
                m_k<=Uk;
            WHEN E13=>
                Uk_1<=m_k;
            WHEN E14=>
                Ek_2<=Ek_1;
            WHEN E15=>
                Ek_1<=Ek; 
            WHEN E16=>
                m_k_intero<= 100*m_k/10000000; 
        END CASE;
    END IF;
END PROCESS;

PID_OUT<= std_logic_vector(to_unsigned(m_k_intero, PID_OUT'length));
PID_Reg<=std_logic_vector(to_unsigned(m_k_intero, PID_OUT'length));

end Behavioral;
