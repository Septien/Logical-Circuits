library ieee;
use ieee.std_logic_1164.all;

entity sumador_nbits is
  generic (n : integer := 4 );
  port(
    a, b : in std_logic_vector(n - 1 downto 0);
    cin  : in std_logic;
    s    : out std_logic_vector(n - 1 downto 0);
    cout : out std_logic
  );
end sumador_nbits;

architecture sumador of sumador_nbits is
  signal c : std_logic_vector(n downto 0);
begin
  process(a, b, c, cin)
  begin
    c(0) <= cin;
    for i in 0 to n - 1 loop
      s(i) <= a(i) xor b(i) xor c(i);
      c(i + 1) <= (a(i) and b(i)) or (a(i) and c(i)) or (c(i) and b(i));
    end loop;
  end process;
  cout <= c(n);
end sumador;
