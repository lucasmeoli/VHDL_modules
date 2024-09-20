library IEEE;
use IEEE.std_logic_1164.all;

entity neg_tb is
end entity;

architecture neg_arq of neg_tb is 
    -- Esta es la parte declarativa

    -- Otra forma de hacerlo
    -- component neg is
		-- port(
			-- a_i: in std_logic;
			-- b_o: out std_logic
		-- );
	-- end component;


    signal a_tb: std_logic := '0';
    signal b_tb: std_logic;

begin
    -- Esta es la parte implementacion
    a_tb <= '1' after 150 ns, '0' after 400 ns;

    -- DUT: neg 
    --     port map (
    --         a_i => a_tb,
    --         b_o => b_tb
    -- );

    DUT: entity work.neg
    port map(
        a_i => a_tb,
        b_o => b_tb
    );
    
end;