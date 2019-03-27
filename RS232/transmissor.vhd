library ieee;
use ieee.std_logic_1164.all;

entity Transmissor is
  port(
    clk, rst : in std_logic;
    STT : in std_logic;
    D : in std_logic_vector(7 downto 0);
    EOT : out std_logic;
    Tx : out std_logic
  );
end Transmissor;

architecture Sender of Transmissor is
  signal M : std_logic_vector(3 downto 0);
  signal P, B : std_logic;
  
  component detector is
  port(
    D : in std_logic_vector(7 downto 0);
    P : out std_logic
  );
  end component;
  
  component TimeBase is
  port(
    clk, rst : in std_logic;
    B : out std_logic
  );
  end component;
  
  component FSMS is
  port(
    clk, rst : in std_logic;
    B, STT   : in std_logic;
    EOT      : out std_logic;
    M        : out std_logic_vector(3 downto 0)
  );
  end component;
  
  component LUT is
  port(
    M  : in std_logic_vector(3 downto 0);
    D  : in std_logic_vector(7 downto 0);
    P  : in std_logic;
    Tx : out std_logic
  );
  end component;
  
begin
  ParityD : detector port map(D, P);
  TB : TimeBase port map(clk, rst, B);
  Control : FSMS port map(clk, rst, B, STT, EOT, M);
  MUX : LUT port map(M, D, P, Tx);
end Sender;