library ieee;
use ieee.std_logic_1164.all;

entity receptor is
  port(
    clk, rst : in std_logic;
    Rx : in std_logic;
    VD : out std_logic;
    EOR : out std_logic;
    Data : out std_logic_vector(7 downto 0)
  );
end receptor;

architecture recv of receptor is
  signal B, S, P : std_logic;
  signal R : std_logic_vector(7 downto 0);
  
  component DisplacementRegister is
  port(
    clk, rst : in std_logic;
    Rx : in std_logic;
    S : in std_logic;
    P : out std_logic;
    R : out std_logic_vector(7 downto 0)
  );
  end component;

  component TimeBaseR is
  port(
    clk, rst : in std_logic;
    B : out std_logic
  );
  end component;
  
  component RDetector is
  port(
    D : in std_logic_vector(7 downto 0);
    P : in std_logic;
    DV : out std_logic
  );
  end component;
  
  component FSMR is
  port(
    clk, rst : in std_logic;
    Rx : in std_logic;
    B : in std_logic;
    EOR : out std_logic;
    S : out std_logic
  );
  end component;
begin
  REG : DisplacementRegister port map(clk, rst, Rx, S, P, R);
  TB : TimeBaseR port map(clk, rst, B);
  PD : RDetector port map(R, P, VD);
  CTRL : FSMR port map(clk, rst, Rx, B, EOR, S);
  Data <= R;
end recv;
