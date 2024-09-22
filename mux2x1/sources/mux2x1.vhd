library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x1 is
    port (
        a_i: in std_logic;
        b_i: in std_logic;
        sel_i: in std_logic;
        s_o: out std_logic
    );
end entity;

architecture mux2x1_arq of mux2x1 is
begin
    s_o <= a_i when sel_i = '0' else b_i;
end architecture;