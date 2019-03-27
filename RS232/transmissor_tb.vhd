library ieee;
use ieee.std_logic_1164.all;

entity TB is
end TB;

architecture Bench of TB is
  signal clk, rst : std_logic := '0';
  signal STT : std_logic;
  signal Data, DataR : std_logic_vector(7 downto 0);
  signal EOT, EOR : std_logic;
  signal Tx : std_logic;
  signal VD : std_logic;

  component Transmissor is
  port(
    clk, rst : in std_logic;
    STT : in std_logic;
    D : in std_logic_vector(7 downto 0);
    EOT : out std_logic;
    Tx : out std_logic
  );
  end component;
  
  component receptor is
  port(
    clk, rst : in std_logic;
    Rx : in std_logic;
    VD : out std_logic;
    EOR : out std_logic;
    Data : out std_logic_vector(7 downto 0)
  );
end component;
begin
  T : Transmissor port map(clk, rst, STT, Data, EOT, Tx);
  R : receptor port map(clk, rst, Tx, VD, EOR, DataR);
  clk <= not clk after 10 ns;
  rst <= '0', '1' after 10 ns;
  Data <= "10101010";
  STT <= '0', '1' after 100 ns, '0' after 110 ns;
end Bench;
