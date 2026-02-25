
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity variant2 is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           y1 : out STD_LOGIC;
           y2 : out STD_LOGIC;
           y3 : out STD_LOGIC;
           y4 : out STD_LOGIC);
end variant2;

architecture Structural of variant2 is
    -- and_gate: Y = A AND B
    component and_gate
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- or_gate: Y = A OR B
    component or_gate
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- not_gate: Y = NOT A
    component not_gate
        Port (A : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- a2: Y = A AND B
    component a2
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- ex2: Y = A XOR B
    component ex2
        Port (A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- na3: Y = NOT(A AND B AND C)
    component na3
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- nao2: Y = NOT((A AND B) OR C)
    component nao2
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- no3: Y = NOT(A OR B OR C)
    component no3
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- naoa2: Y = NOT((A AND B) OR (C AND D))
    component naoa2
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; D : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- no3a2: Y = NOT((A OR B OR C) AND D)
    component no3a2
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; D : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- noa3: Y = NOT((A AND B AND C) OR D)
    component noa3
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; D : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- noao2: Y = NOT((A OR B) AND (C OR D))
    component noao2
        Port (A : in STD_LOGIC; B : in STD_LOGIC; C : in STD_LOGIC; D : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
signal sig_a2_out : STD_LOGIC;
signal sig_not_a2_nx4_out : STD_LOGIC;
signal sig_not_x2_out : STD_LOGIC;
signal sig_not_x1_out : STD_LOGIC;
signal sig_not_t_a2_nx4 : STD_LOGIC;
signal sig_not_x4_out : STD_LOGIC;
signal sig_no3_out : STD_LOGIC;
signal sig_na3_out : STD_LOGIC;
signal sig_ex2_out : STD_LOGIC;
signal sig_x3_out : STD_LOGIC;
signal sig_noa3_out : STD_LOGIC;
signal sig_noao2_out : STD_LOGIC;
signal sig_no3a2_out : STD_LOGIC;
signal sig_nao2_out : STD_LOGIC;
signal sig_naoa2_out : STD_LOGIC;
begin
    NOT_X4 : not_gate port map (A => x4, Y => sig_not_x4_out);
    
    A2_X1_NX4 : A2 port map (A => x1, B => sig_not_x4_out, Y => sig_a2_out);
    
    NOT_A2_NX4 : not_gate port map (A => sig_a2_out, Y => sig_not_a2_nx4_out);
    NOT_X2 : not_gate port map (A => x2, Y => sig_not_x2_out);
    
    NOT_X1 : not_gate port map (A => x1, Y => sig_not_x1_out);
    NOT_T_A2_NX4 : not_gate port map (A => sig_not_a2_nx4_out, Y => sig_not_t_a2_nx4);
    NO3_Block : NO3 port map (A => sig_not_x2_out, B => x3, C => x1, Y => sig_no3_out);
    
    NA3_Block : NA3 port map (A => x2, B => sig_not_x4_out, C => sig_not_x1_out, Y => sig_na3_out);
    EX2_Block : EX2 port map (A => x3, B => sig_not_t_a2_nx4, Y => sig_ex2_out);
    NOT_X3 : not_gate port map (A => x3, Y => sig_x3_out);
    NOA3_Block : NOA3 port map (A => sig_no3_out, B => x3, C => sig_not_x2_out, D => x1, Y => sig_noa3_out);
    
    NOAO2_Block : NOAO2 port map (A => sig_x3_out, B => sig_na3_out, C => x2, D => sig_not_a2_nx4_out, Y => sig_noao2_out);
    y3 <= sig_noao2_out;
    NO3A2_Block : NO3A2 port map (A => x3, B => x4, C => sig_not_x2_out, D => x2, Y => sig_no3a2_out);
    y2 <= sig_no3a2_out;
    NAO2_Block : NAO2 port map (A => sig_ex2_out, B => x4, C => x2, Y => sig_nao2_out);
    y1 <= sig_nao2_out;
    NAOA2_Block : NAOA2 port map (A => sig_noa3_out, B=> x4, C => sig_not_x2_out, D => x1, Y => sig_naoa2_out);
    y4 <= sig_naoa2_out;
end Structural;
