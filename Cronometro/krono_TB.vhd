library ieee;
use ieee.std_logic_1164.all;

entity Krono_TB is
end Krono_TB;

architecture TB of Krono_TB is
  signal clk, rst : std_logic := '0';
  signal H : std_logic := '1';
  signal UM, TM : std_logic_vector(6 downto 0);
  component Krono is
    port(
      clk, rst : in std_logic;
      H : in std_logic;
      UM, TM : out std_logic_vector(6 downto 0)
    );
  end component;

begin
  K : Krono port map(clk, rst, H, UM, TM);
  clk <= not clk after 10 ns;
  rst <= '0', '1' after 5 ns;
  H <= '1';
end TB;