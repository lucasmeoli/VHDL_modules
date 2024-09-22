library IEEE;
use IEEE.std_logic_1164.all;

entity regNb is
    generic(
        N: natural := 4
    );
    port (
        clk: in std_logic;
        rst: in std_logic;
        ena: in std_logic;
        E: in std_logic;
        S: out std_logic
    );
end entity;

architecture regNb_arq of regNb is 
signal aux: std_logic_vector(N downto 0);

begin
    aux(0) <= E;
    S <= aux(N);

    regNb_gen: for i in 0 to N-1 generate
        ffd_inst: entity work.ffd
            port map(
                clk => clk, 
                rst => rst,
                ena => ena,
                D => aux(i), 
                Q => aux(i+1)
            );
    end generate;
end architecture;