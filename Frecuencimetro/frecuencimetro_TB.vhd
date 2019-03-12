library ieee;
use ieee.std_logic_1164.all;

entity TB is
end TB;

architecture test of TB is
  signal clk, rst : std_logic := '0';
  signal Fx : std_logic := '0';
  signal H : std_logic;
  signal M, C, D, U : std_logic_vector(6 downto 0);

component Frecuencimetro is
	port(
	clk, rst : in std_logic;
	Fx : in std_logic;
	M, C, D, U : out std_logic_vector(6 downto 0)
	);
end component;

component TestTB
port(
    clk, rst : in std_logic;
    H : in std_logic;
    T : out std_logic
  );
end component;

begin
  Freq : Frecuencimetro port map(clk, rst, Fx, M, C, D, U);
  --TBFx : TestTB port map(clk, rst, H, Fx);
  
  Fx <= not FX after 100 ns;
  clk <= not clk after 20 ns;
  rst <= '0', '1' after 20 ns;
  H <= '0', '1' after 20 ns;
end test;
