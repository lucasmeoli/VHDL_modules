library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cnt4b is
    port(
        clk : in std_logic;
        rst : in std_logic;
        ena : in std_logic;
        Q   : out std_logic_vector(3 downto 0)
    );
end entity;

architecture cnt4b_arq of cnt4b is

begin

    cnt4b_proc: process (clk) 
        variable count_i: integer range 0 to 16;
    begin 
        if (rising_edge(clk)) then
            if (rst = '1') then
                count_i := 0;
            elsif (ena = '1') then
                count_i := count_i + 1;
                if count_i = 16 then
                    count_i := 0;
                end if;
            end if;
        end if;
        Q <= std_logic_vector(to_unsigned(count_i,4));
    end process;

end architecture;