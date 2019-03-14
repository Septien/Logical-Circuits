library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LUT is
  port(
    kSel  : in std_logic_vector(3 downto 0);
    KTime : out std_logic_vector(15 downto 0)
  );
end LUT;

architecture mux of LUT is
begin
  muxp : process(KSel)
  begin
    case KSel is
    when "0000" =>
      kTime <= std_logic_vector(to_unsigned(0, 16));    -- 0% of the time
    when "0001" =>
      kTime <= std_logic_vector(to_unsigned(4999, 16));    -- 10%
    when "0010" =>
      kTime <= std_logic_vector(to_unsigned(9999, 16));    -- 20%
    when "0011" =>
      kTime <= std_logic_vector(to_unsigned(14999, 16));   -- 30%
    when "0100" =>
      kTime <= std_logic_vector(to_unsigned(19999, 16));   -- 40%
    when "0101" =>
      kTime <= std_logic_vector(to_unsigned(24999, 16));   -- 50%
    when "0110" =>
      kTime <= std_logic_vector(to_unsigned(29999, 16));   -- 60%
    when "0111" =>
      kTime <= std_logic_vector(to_unsigned(34999, 16));   -- 70%
    when "1000" =>
      kTime <= std_logic_vector(to_unsigned(39999, 16));   -- 80%
    when "1001" =>
      kTime <= std_logic_vector(to_unsigned(44999, 16));   -- 90%
    when others =>
      kTime <= std_logic_vector(to_unsigned(49999, 16));   -- 100%
    end case;
  end process muxp;end mux;
