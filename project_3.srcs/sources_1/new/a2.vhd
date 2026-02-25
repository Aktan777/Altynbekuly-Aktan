

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity a2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Y : out STD_LOGIC);
end a2;

architecture Behavioral of a2 is
component and_gate
    Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
end component;
signal sig_and1_out : STD_LOGIC;
begin
    E_AND1 : and_gate port map (A => A, B => B, Y => sig_and1_out);
Y <= sig_and1_out;
end Behavioral;
