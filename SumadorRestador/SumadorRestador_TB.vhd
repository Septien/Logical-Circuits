library ieee;
use ieee.std_logic_1164.all;

entity SumadorRestadorTB is
  generic( n : integer := 4 );
end SumadorRestadorTB;

architecture Banco of SumadorRestadorTB is
  signal a, b : std_logic_vector( n - 1 downto 0 );
  signal CBin, x : std_logic;
  signal SRR : std_logic_vector( n - 1 downto 0 );
  signal CBout : std_logic;

  component SumadorRestador is
  port(
    a, b : in std_logic_vector( n - 1 downto 0 );
    CBin, x : in std_logic;
    SR : out std_logic_vector( n - 1 downto 0 );
    CBout : out std_logic
    );
  end component;

begin
  SR : SumadorRestador port map(a, b, CBin, x, SRR, CBout);
  a <= "0001", "0000" after 1 ps, "0001" after 20 ns, "0101" after 40 ns, "1000" after 60 ns, "1010" after 80 ns, "0000" after 100 ns;
  b <= "0100", "0101" after 1 ps, "0110" after 20 ns, "0011" after 40 ns, "0101" after 60 ns, "1100" after 80 ns, "0000" after 100 ns;
  CBin <= '0';-- '0', '1' after 10 ns, '0' after 20 ns, '1' after 60 ns, '0' after 70 ns;
  x <= '0', '1' after 50 ns;
end Banco;

