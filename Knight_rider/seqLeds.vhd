library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seqLeds is
port(
  clk, rst : in std_logic;
  B : in std_logic_vector(3 downto 0);
  leds : out std_logic_vector(3 downto 0)
);
end seqLeds;

architecture simple of seqLeds is
  signal k : std_logic_vector(25 downto 0);
  signal H : std_logic;
  
  component FSM
  port(
    H : in std_logic;
    clk, rst : in std_logic;
    leds : out std_logic_vector(3 downto 0)
  );
  end component;
  
  component TimeBase is
  generic(
    n : integer := 26
  );
  port(
    clk, rst : in std_logic;
    k : in std_logic_vector(n - 1 downto 0);
    T : out std_logic
  );
  end component;

begin
  FMS1 : FSM port map(H, clk, rst, leds);
  BT : TimeBase generic map(26) port map(clk, rst, k, H);
    
  mux : process(B)
  begin
    case B is
    when "0000" =>
      k <= std_logic_vector(to_unsigned(49999999, 26));
    when "0001" =>
      k <= std_logic_vector(to_unsigned(44999999, 26));
    when "0010" =>
      k <= std_logic_vector(to_unsigned(39999999, 26));
    when "0011" =>
      k <= std_logic_vector(to_unsigned(34999999, 26));
    when "0100" =>
      k <= std_logic_vector(to_unsigned(29999999, 26));
    when "0101" =>
      k <= std_logic_vector(to_unsigned(24999999, 26));
    when "0110" =>
      k <= std_logic_vector(to_unsigned(19999999, 26));
    when "0111" =>
      k <= std_logic_vector(to_unsigned(14999999, 26));
    when "1000" =>
      k <= std_logic_vector(to_unsigned(9999999, 26));
    when others =>
      k <= std_logic_vector(to_unsigned(4999999, 26));
    end case;
  end process mux;
end simple;