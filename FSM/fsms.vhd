library ieee;
use ieee.std_logic_1164.all;

entity fsms is
  port(
    clk, rst : in std_logic;
    T, B : in std_logic;
    M : out std_logic
    );
end fsms;

architecture behaviour of fsms is
  signal Qp, Qn : std_logic;
begin
  combinacional : process(T, B, Qp)
  begin
    if ( QP = '0' ) then
      if ( T  = '0' and B = '0' ) then
        Qn <= '1';
      else
        Qn <= '0';
      end if;
      M <= '0';
    else
      if ( T = '1' and B = '1' ) then
        Qn <= '0';
      else
        Qn <= '1';
      end if;
      M <= '1';
    end if;
  end process combinacional;

  secuencial : process(clk, rst)
  begin
    if ( rst = '1' ) then
      Qp <= '0';
    elsif ( clk'event and clk = '1' ) then
      Qp <= Qn;
    end if;
  end process secuencial;

  -- When-else register
  -- Qp <= '0' when rst = '1' else Qn when rising_edge(clk);

end behaviour;

