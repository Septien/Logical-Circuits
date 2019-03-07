library ieee;
use ieee.std_logic_1164.all;

entity PulseCounter is
	port(
	clk, rst : in std_logic;
	H : in std_logic;
	Mb, Cb, Db, Ub : out std_logic_vector(3 downto 0)
	);
end PulseCounter;

architecture count of PulseCounter is
signal H1, H2, H3, H4 : std_logic;	 
component Counter is
	port(
	clk, rst : in std_logic;
	Hin : in std_logic;
	count : out std_logic_vector(3 downto 0);
	Hout : out std_logic
	);
end component;
begin
	UnitC : Counter port map(clk, rst, H, Ub, H1);
	TensC : Counter port map(clk, rst, H1, Db, H2);
	HndsC : Counter port map(clk, rst, H2, Cb, H3);
	ThndC : Counter port map(clk, rst, H3, Mb, H4);
end count;