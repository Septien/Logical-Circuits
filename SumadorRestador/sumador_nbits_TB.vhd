library ieee;
use ieee.std_logic_1164.all;

entity sumador_nbits_TB is
  generic ( n : integer := 4 );
end sumador_nbits_TB;

architecture Banco of sumador_nbits_TB is
  signal a, b : std_logic_vector(n - 1 downto 0);
  signal cin : std_logic;
  signal s : std_logic_vector(n - 1 downto 0);
  signal cout : std_logic;

  component sumador_nbits
  generic (n : integer := 4 );
  port(
    a, b : in std_logic_vector(n - 1 downto 0);
    cin  : in std_logic;
    s    : out std_logic_vector(n - 1 downto 0);
    cout : out std_logic
  );
  end component;

begin
  SNb : sumador_nbits
    generic map (n => 4)
    port map (a => a, b => b, cin => cin, s => s, cout => cout);
  a <= "0101", "0111" after 20 ns, "1000" after 40 ns, "0110" after 60 ns;
  b <= "1111", "1010" after 20 ns, "1011" after 40 ns, "1110" after 60 ns;
  cin <= '1', '0' after 10 ns, '1' after 50 ns;
end Banco;
