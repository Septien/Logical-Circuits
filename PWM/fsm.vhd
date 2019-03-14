library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port(
  clk, rst : in std_logic;
  eoc, tb  : in std_logic;
  ld, p    : out std_logic
);
end FSM;

architecture control of FSM is
  type state is (S0, S1);
  signal Qn, Qp : state;
begin
  combinational : process(Qp, eoc, tb)
  begin
    Case Qp is
    when S0 =>
      if (tb = '1') then
        Qn <= S1;
      else
        Qn <= Qp;
      end if;
      ld <= '1';
      p <= '0';
    when S1 =>
      if (eoc = '1') then
        Qn <= S0;
      else
        Qn <= Qp;
      end if;
      ld <= '0';
      p <= '1';
    end case;
  end process combinational;
  Qp <= S0 when rst = '0' else Qn when rising_edge(clk);
end control;
