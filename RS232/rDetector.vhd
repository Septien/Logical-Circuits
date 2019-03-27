-- Parity checker for the reciever
library ieee;
use ieee.std_logic_1164.all;

entity RDetector is
  port(
    D : in std_logic_vector(7 downto 0);
    P : in std_logic;
    DV : out std_logic
  );
end RDetector;

architecture simple of RDetector is
begin
  DV <= (((D(0) xor D(1)) xor (D(2) xor D(3))) xor ((D(4) xor D(5)) xor (D(6) xor D(7))) xor P);
end simple;
