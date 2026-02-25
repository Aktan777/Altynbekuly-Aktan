----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2026 05:59:43 AM
-- Design Name: 
-- Module Name: nao2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nao2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Y : out STD_LOGIC);  -- ??????????: out
end nao2;

architecture Behavioral of nao2 is

component and_gate
    Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
end component;
component or_gate
    Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
end component;
component not_gate
    Port (A : in STD_LOGIC; Y : out STD_LOGIC);
end component;

signal sig_and1_out : STD_LOGIC;
signal sig_or1_out  : STD_LOGIC;

begin
    -- A AND B
    E_AND1 : and_gate port map (A => A, B => B, Y => sig_and1_out);
    -- (A AND B) OR C
    E_OR1  : or_gate  port map (A => sig_and1_out, B => C, Y => sig_or1_out);
    -- NOT((A AND B) OR C)
    E_NOT1 : not_gate port map (A => sig_or1_out, Y => Y);

end Behavioral;