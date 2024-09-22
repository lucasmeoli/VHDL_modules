library IEEE;
use IEEE.std_logic_1164.all;

entity count4b_tb is
end entity;

architecture count4b_tb_arq of count4b_tb is
    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal ena_tb : std_logic := '0';
    signal Q_tb   : std_logic_vector(3 downto 0);

begin

    clk_tb <= not clk_tb after 10 ns;
    rst_tb <= '1' after 10 ns, '0' after 30 ns;
    ena_tb <= '1' after 50 ns;

    DUT: entity work.count4b
    port map (
        clk => clk_tb,
        rst => rst_tb,
        ena => ena_tb,
        Q   => Q_tb
    );
end architecture;
