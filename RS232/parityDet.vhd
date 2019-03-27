library ieee;
use ieee.std_logic_1164.all;

entity detector is
  port(
    D : in std_logic_vector(7 downto 0);
    P : out std_logic
  );
end detector;

architecture simple of detector is
begin
  P <= ((D(0) xor D(1)) xor (D(2) xor D(3))) xor ((D(4) xor D(5)) xor (D(6) xor D(7)));
end simple;
