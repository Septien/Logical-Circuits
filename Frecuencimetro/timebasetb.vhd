library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestTB is
generic(
  n : integer := 26
);
  port(
    clk, rst : in std_logic;
    H : in std_logic;
    T : out std_logic
  );
end TestTB;

architecture simple of TestTB is
  signal Qn, Qp, aux : unsigned(n - 1 downto 0);
begin
  aux <= to_unsigned(1000, n);
  combinational : process(Qp, aux)
  begin
    if (Qp = aux) then
      T <= '1';
      Qn <= (others => '0');
    else
      T <= '0';
      Qn <= Qp + 1;
    end if;
  end process combinational;
  Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end simple;
