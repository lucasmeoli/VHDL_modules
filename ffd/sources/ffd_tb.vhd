library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_tb is
end entity;

architecture ffd_tb_arq of ffd_tb is
    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal ena_tb : std_logic := '0';
    signal D_tb   : std_logic := '0';
    signal Q_tb   : std_logic;

begin

    clk_tb <= not clk_tb after 10 ns;
    rst_tb <= '1' after 150 ns, '0' after 180 ns;
    ena_tb <= '1' after 30 ns, '0' after 50 ns, '1' after 70 ns;

    D_tb <= not D_tb after 15 ns;

    DUT: entity work.ffd
    port map (
        clk => clk_tb,
        rst => rst_tb,
        ena => ena_tb,
        D   => D_tb,
        Q   => Q_tb
    );
end architecture;
