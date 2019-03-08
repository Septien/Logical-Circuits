library ieee;
use ieee.std_logic_1164.all;

entity Hab is
  port(
  H : in std_logic;
  Fxin : in std_logic;
  Fxout : out std_logic
  );
end Hab;

architecture simple of Hab is
begin
  process(H, Fxin)
  begin
    if (H = '1') then
      Fxout <= Fxin;
    else
      Fxout <= '0';
    end if;
  end process;
end simple;
