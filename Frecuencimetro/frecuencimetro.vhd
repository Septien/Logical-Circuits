library ieee;
use ieee.std_logic_1164.all;

entity Frecuencimetro is
	port(
	clk, rst : in std_logic;
	Fx : in std_logic;
	M, C, D, U : out std_logic_vector(6 downto 0)
	);
end Frecuencimetro;

architecture freq of Frecuencimetro is
signal sct, eoc, h, cc, l : std_logic;
signal Fxout : std_logic;
signal mb, cb, db, ub : std_logic_vector(3 downto 0);
signal ms, cs, ds, us : std_logic_vector(6 downto 0);

component TimeBase is
	port(
	clk, rst : in std_logic;
	sct : in std_logic;
	eoc : out std_logic
	);
end component;

component FSM is
	port(
	clk, rst : in std_logic;
	eoc : in std_logic;
	h, c, l, stc : out std_logic
	);
end component;

component Hab is
  port(
  H : in std_logic;
  Fxin : in std_logic;
  Fxout : out std_logic
  );
end component;

component PulseCounter is
	port(
	clk, rst : in std_logic;
	H : in std_logic;
	Mb, Cb, Db, Ub : out std_logic_vector(3 downto 0)
	);
end component;

component BCD2_7SEG is
	port(
	bcd : in std_logic_vector(3 downto 0);
	seg7 : out std_logic_vector(6 downto 0)
	);
end component;

component reg is
	port(
	clk, rst : in std_logic;
	L : in std_logic;
	Ms, Cs, Ds, Us : in std_logic_vector(6 downto 0);
	M, C, D, U : out std_logic_vector(6 downto 0)
	);
end component;
begin
	TB : TimeBase port map(clk, rst, sct, eoc);
	Control : FSM port map(clk, rst, eoc, h, cc, l, sct);
	HabC : Hab port map(h, Fx, Fxout);
	PulseC : PulseCounter port map(clk, cc, Fxout, mb, cb, db, ub);
	ConvM : BCD2_7SEG port map(mb, ms);
	ConvC : BCD2_7SEG port map(cb, cs);
	ConvD : BCD2_7SEG port map(db, ds);
	ConvU : BCD2_7SEG port map(ub, us);
	RegS : reg port map(clk, rst, l, ms, cs, ds, us, M, C, D, U);
end freq;
