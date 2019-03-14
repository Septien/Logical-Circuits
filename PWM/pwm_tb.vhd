library ieee;
use ieee.std_logic_1164.all;

entity tb is
end;

architecture bench of tb is
  signal clk : std_logic := '0';
  signal rst : std_logic;
  signal p : std_logic;
  signal kSel : std_logic_vector(3 downto 0);

  component PWM is
  port(
    clk, rst : in std_logic;
    kSel : in std_logic_vector(3 downto 0);
    P : out std_logic
  );
  end component;
begin
  pulse : PWM port map(clk, rst, kSel, p);
  clk <= not clk after 20 ns;
  rst <= '0', '1' after 20 ns;
  kSel <= "0000";
end bench;