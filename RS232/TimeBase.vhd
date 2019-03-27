library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TimeBase is
  port(
    clk, rst : in std_logic;
    B : out std_logic
  );
end TimeBase;

architecture counter of TimeBase is
  signal Qn, Qp, aux : unsigned(12 downto 0);
begin
  aux <= to_unsigned(5208, 13); -- 5208: 9600 baudios for a 50 MHz clock
  process(Qp)
  begin
    if (Qp = aux) then
      B <= '1';
      Qn <= (others => '0');
    else
      B <= '0';
      Qn <= Qp + 1;
    end if;
  end process;
  Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end counter;
