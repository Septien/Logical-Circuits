library ieee;
use ieee.std_logic_1164.all;

entity SumadorRestador is
  generic ( n : integer := 4 );
  port(
    a, b : in std_logic_vector( n - 1 downto 0 );       -- a +/- b
    CBin, x : in std_logic;                             -- CBin -> input carry/borow, x -> wich operation
    SR : out std_logic_vector( n - 1 downto 0 );        -- Result
    CBout : out std_logic                               -- Output carry/borrow
    );
end SumadorRestador;

architecture Behavioral of SumadorRestador is
  signal c : std_logic;                                 -- Input carry/borrow to the adder
  signal bxorx : std_logic_vector( n - 1 downto 0);     -- B input ot the carry

  component sumador_nbits                               -- Adder
  port(
    a, b : in std_logic_vector(n - 1 downto 0);
    cin  : in std_logic;
    s    : out std_logic_vector(n - 1 downto 0);
    cout : out std_logic
  );
  end component;

begin
  SNb : sumador_nbits port map(a, bxorx, c, SR, CBout);
  process(a, b, CBin, x)
  begin
    -- Select the operation to perform
    c <= CBin xor x;
    -- Perform 1's complement or not according to x
    for i in 0 to n - 1 loop
      bxorx(i) <= b(i) xor x;
    end loop;
  end process;
end Behavioral;
