library ieee;
use ieee.std_logic_1164.all;

entity seqLed_TB is
end seqLed_TB;

architecture TB of seqLed_TB is
  signal clk : std_logic := '0';
  signal rst : std_logic;
  signal B : std_logic_vector(3 downto 0);
  signal leds : std_logic_vector(3 downto 0);
  
  component seqLeds is
  port(
    clk, rst : in std_logic;
    B : in std_logic_vector(3 downto 0);
    leds : out std_logic_vector(3 downto 0)
  );
  end component;
  
begin
  SL : seqLeds port map(clk, rst, B, leds);
  clk <= not clk after 10 ns;
  rst <= '0', '1' after 10 ns;
  B <= "0000";
end TB;
