library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity no3a2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Y : out STD_LOGIC);
end no3a2;

architecture Behavioral of no3a2 is

component and_gate
    Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
end component;
component or_gate
    Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
end component;
component not_gate
    Port (A : in STD_LOGIC; Y : out STD_LOGIC);
end component;

signal sig_or1_out  : STD_LOGIC;
signal sig_or2_out  : STD_LOGIC;
signal sig_and1_out : STD_LOGIC;

begin
    E_OR1  : or_gate  port map (A => A, B => B, Y => sig_or1_out);
    E_OR2  : or_gate  port map (A => sig_or1_out, B => C, Y => sig_or2_out);
    E_AND1 : and_gate port map (A => sig_or2_out, B => D, Y => sig_and1_out);
    E_NOT1 : not_gate port map (A => sig_and1_out, Y => Y);

end Behavioral;