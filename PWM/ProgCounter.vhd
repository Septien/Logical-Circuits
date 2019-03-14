library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Counter is
  generic(
    n : integer := 16
  );
  port(
    clk, rst : in std_logic;
    k        : in std_logic_vector(n - 1 downto 0);
    ld       : in std_logic;
    eoc      : out std_logic
  );
end Counter;

architecture count of Counter is
  signal Qn, Qp, aux : unsigned(n - 1 downto 0);
begin
  aux <= (others => '0');
  combinational : process(ld, Qp)
  begin
    if (Qp = aux) then
      if (ld = '1') then
        Qn <= unsigned(k);
      else
        Qn <= Qp;
      end if;
      eoc <= '1';
    else
      if (ld = '1') then
        Qn <= Qp;
      else
        Qn <= Qp - 1;
      end if;
      eoc <= '0';
    end if;
  end process combinational;
  Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end count;
