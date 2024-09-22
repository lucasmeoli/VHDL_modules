library IEEE;
use IEEE.std_logic_1164.all;

entity regNb_tb is
end entity;

architecture regNb_tb_arq of regNb_tb is
    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal ena_tb : std_logic := '0';
    signal E_tb   : std_logic := '0';
    signal S_tb   : std_logic;

begin

    clk_tb <= not clk_tb after 10 ns;
    rst_tb <= '1' after 10 ns, '0' after 30 ns;
    ena_tb <= '1' after 50 ns;

    E_tb <= not E_tb after 65 ns;

    DUT: entity work.regNb
    port map (
        clk => clk_tb,
        rst => rst_tb,
        ena => ena_tb,
        E   => E_tb,
        S   => S_tb
    );
end architecture;
