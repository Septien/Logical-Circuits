library ieee;
use ieee.std_logic_1164.all;

entity UART is
port(
	clk, rst : in std_logic;
	Din : in std_logic_vector(7 downto 0);
	STT : in std_logic;
	Rx : in std_logic;
	Tx : out std_logic;
	EOT, EOR : out std_logic;
	VD : out std_logic;
	Dout : out std_logic_vector(7 downto 0)
);
end UART;

architecture TR of UART is
	component Transmissor is
	port(
		clk, rst : in std_logic;
		STT : in std_logic;
		D : in std_logic_vector(7 downto 0);
		EOT : out std_logic;
		Tx : out std_logic
	);
	end component;
	
	component receptor is
	port(
		clk, rst : in std_logic;
		Rx : in std_logic;
		VD : out std_logic;
		EOR : out std_logic;
		Data : out std_logic_vector(7 downto 0)
	);
	end component;
begin
	T : Transmissor port map(clk, rst, STT, Din, EOT, Tx);
	R : Receptor port map(clk, rst, Rx, VD, EOR, Dout);
end TR;
