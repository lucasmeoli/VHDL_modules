library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x1_tb is
end entity;

architecture mux2x1_tb_arq of mux2x1_tb is 
    signal a_tb: std_logic := '0';
    signal b_tb: std_logic := '0';
    signal sel_tb: std_logic := '0';
    signal so_tb: std_logic;

begin

    sel_tb <= not sel_tb after 10 ns;
    a_tb <= not a_tb after 20 ns;
    b_tb <= not b_tb after 40 ns;

    DUT: entity work.mux2x1
    port map(
        a_i => a_tb,
        b_i => b_tb,
        sel_i => sel_tb,
        s_o => so_tb
    );
    
end;