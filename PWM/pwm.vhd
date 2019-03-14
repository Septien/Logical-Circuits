library ieee;
use ieee.std_logic_1164.all;

entity PWM is
  port(
    clk, rst : in std_logic;
    kSel : in std_logic_vector(3 downto 0);
    P : out std_logic
  );
end PWM;

architecture pulse of PWM is
  signal KTime : std_logic_vector(15 downto 0);
  signal c, ld, eoc, stc : std_logic;
  
  component LUT is
  port(
    kSel  : in std_logic_vector(3 downto 0);
    KTime : out std_logic_vector(15 downto 0)
  );
  end component;
  
  component TimeBase is
  generic(
    n : integer := 16
  );
  port(
    clk, rst : in std_logic;
    c        : out std_logic
  );
  end component;
  
  component Counter is
  generic(
    n : integer := 16
  );
  port(
    clk, rst : in std_logic;
    k        : in std_logic_vector(n - 1 downto 0);
    ld       : in std_logic;
    eoc      : out std_logic
  );
end component;

  component FSM is
  port(
    clk, rst : in std_logic;
    eoc, tb  : in std_logic;
    ld, p    : out std_logic
  );
  end component;
  
begin
  mux     : LUT port map(kSel, kTime);
  TB      : TimeBase port map(clk, rst, c);
  count   : Counter port map(clk, rst, kTime, ld, eoc);
  Control : FSM port map(clk, rst, eoc, c, ld, P);
end pulse;
