library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity countNb is
    generic(
        N: natural := 4
    );
    port(
        clk : in std_logic;
        rst : in std_logic;
        ena : in std_logic;
        Q   : out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture countNb_arq of countNb is

begin

    countNb_proc: process (clk) 
        variable count_i: unsigned(N-1 downto 0);
    begin 
        if (rising_edge(clk)) then
            if (rst = '1') then
                count_i := (others => '0');
            elsif (ena = '1') then
                count_i := count_i + 1;
            end if;
        end if;
        Q <= std_logic_vector(count_i);
    end process;

end architecture;