library ieee;
use ieee.std_logic_1164.all;

entity LUT is
  port(
    M  : in std_logic_vector(3 downto 0);
    D  : in std_logic_vector(7 downto 0);
    P  : in std_logic;
    Tx : out std_logic
  );
end LUT;

architecture mux of LUT is
begin
  process(M, D, P)
  begin
    case M is
    when "0000" => Tx <= '0';
    when "0001" => Tx <= D(0);
    when "0010" => Tx <= D(1);
    when "0011" => Tx <= D(2);
    when "0100" => Tx <= D(3);
    when "0101" => Tx <= D(4);
    when "0110" => Tx <= D(5);
    when "0111" => Tx <= D(6);
    when "1000" => Tx <= D(7);
    when "1001" => Tx <= P;
    when others => Tx <= '1';
    end case;
  end process;
end mux;
