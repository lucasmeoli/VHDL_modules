library IEEE;
use IEEE.std_logic_1164.all;

entity count4b is
    port(
        clk : in std_logic;
        rst : in std_logic;
        ena : in std_logic;
        Q   : out std_logic_vector(3 downto 0)
    );
end entity;

architecture count4b_arq of count4b is
    signal Q_aux : std_logic_vector(3 downto 0);
    signal and_aux : std_logic_vector(3 downto 0);
    signal D_aux : std_logic_vector(3 downto 0); 


begin
    and_aux(0) <= ena;
    and_aux(1) <= Q_aux(0) and ena;
    and_aux(2) <= Q_aux(1) and and_aux(1);
    and_aux(3) <= Q_aux(2) and and_aux(2);

    D_aux(0) <= Q_aux(0) xor and_aux(0);
    D_aux(1) <= Q_aux(1) xor and_aux(1);
    D_aux(2) <= Q_aux(2) xor and_aux(2);
    D_aux(3) <= Q_aux(3) xor and_aux(3);

    count4b_gen: for i in 0 to 3 generate
    ffd_inst: entity work.ffd
        port map(
            clk => clk, 
            rst => rst,
            ena => ena,
            D => D_aux(i),
            Q => Q_aux(i)
        );
    end generate;

    Q <= Q_aux;

end architecture;
