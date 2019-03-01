-- Cronometer
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Krono is
	generic(
  		n : integer := 26
	);
	port(
	clk, rst : in std_logic;
	H : in std_logic;
	US, DS, UM, DM : out std_logic_vector(6 downto 0);
	Hout : out std_logic
	);
end Krono;

architecture timer of Krono is
signal H1, H2, H3, H4 : std_logic;
signal k : std_logic_vector(25 downto 0);

component TimeBase is
generic(
  n : integer := 26
);
port(
  clk, rst : in std_logic;
  H : in std_logic;
  k : in std_logic_vector(n - 1 downto 0);
  T : out std_logic
);
end component;

component UCounter is
	port(
	clk, rst : in std_logic;
	Hin : in std_logic;
	Unit : out std_logic_vector(6 downto 0);
	Hout : out std_logic
	);
end component;

component TCounter is
	port(
	clk, rst : in std_logic;
	Hin : in std_logic;
	Tens : out std_logic_vector(6 downto 0);
	Hout : out std_logic
	);
end component;

begin
	k <= std_logic_vector(to_unsigned(49999999, 26));
	TB : TimeBase port map(clk, rst, H, k, H1);
	US1 : UCounter port map(clk, rst, H1, US, H2);
	DS1 : TCounter port map(clk, rst, H2, DS, H3);
	UM1 : UCounter port map(clk, rst, H3, UM, H4);
	DM1 : TCounter port map(clk, rst, H4, DM, Hout);
end timer;
