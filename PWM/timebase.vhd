library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity TimeBase is
  generic(
    n : integer := 16
  );
  port(
    clk, rst : in std_logic;
    c        : out std_logic
  );
end TimeBase;

architecture time of TimeBase is
  signal Qn, Qp, aux : unsigned(n - 1 downto 0);
begin
  aux <= (others => '0');   -- 1 ms 
  combinational : process(Qp)
  begin
    if (Qp = aux) then
      Qn <= to_unsigned(49999, n);
      c <= '1';
    else
      Qn <= Qp - 1;
      c <= '0';
    end if;
  end process combinational;
  Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end time;
