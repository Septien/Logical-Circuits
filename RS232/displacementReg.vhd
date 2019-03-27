library ieee;
use ieee.std_logic_1164.all;

entity DisplacementRegister is
  port(
    clk, rst : in std_logic;
    Rx : in std_logic;
    S : in std_logic;
    P : out std_logic;
    R : out std_logic_vector(7 downto 0)
  );
end DisplacementRegister;

architecture store of DisplacementRegister is
  signal Qn, Qp : std_logic_vector(8 downto 0);
begin
  process(Qp, Rx, S)
  begin
    if (S = '0') then
      Qn <= Qp;
    else
      Qn <= Rx & Qp(8 downto 1);
    end if;
    P <= Qp(8);
    R <= Qp(7 downto 0);
  end process;
  Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end store;
