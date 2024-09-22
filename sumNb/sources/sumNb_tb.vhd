library IEEE;
use IEEE.std_logic_1164.all;

entity sumNb_tb is
end;

architecture sumNb_tb_arq of sumNb_tb is
    
    constant N_tb: natural := 4;
    
    signal a_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal b_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal ci_tb: std_logic := '0';
    signal s_tb: std_logic_vector(N_tb-1 downto 0);
    signal co_tb: std_logic;

begin

    a_tb <=  "0111" after 100 ns, "0100" after 300 ns;
    b_tb <=  "0100" after 200 ns;
    ci_tb <= '1' after 400 ns;

    DUT: entity work.sumNb
        generic map(
            N => N_tb
        )
        port map(
            a_i  => a_tb, 
            b_i  => b_tb,
            ci_i => ci_tb,
            s_o  => s_tb,
            co_o => co_tb
        );
    
end;