library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port(
	clk, rst : in std_logic;
	L : in std_logic;
	Ms, Cs, Ds, Us : in std_logic_vector(6 downto 0);
	M, C, D, U : out std_logic_vector(6 downto 0)
	);
end reg;

architecture store of reg is
component RegisterL is
	port(
	clk, rst : in std_logic;
	H : in std_logic;
	value : in std_logic_vector(6 downto 0);
	outValue : out std_logic_vector(6 downto 0)
	);
end component;
begin
	UnitR : RegisterL port map(clk, rst, L, Us, U);
	TensR : RegisterL port map(clk, rst, L, Ds, D);
	HundR : RegisterL port map(clk, rst, L, Cs, C);
	ThdsR : RegisterL port map(clk, rst, L, Ms, M);
end store;
