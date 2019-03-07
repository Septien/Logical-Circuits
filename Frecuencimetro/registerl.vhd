library ieee;
use ieee.std_logic_1164.all;

entity RegisterL is
	port(
	clk, rst : in std_logic;
	H : in std_logic;
	value : in std_logic_vector(6 downto 0);
	outValue : out std_logic_vector(6 downto 0)
	);
end RegisterL;

architecture Reg of RegisterL is
signal Qn, Qp : std_logic_vector(6 downto 0);
begin
	combinational : process(Qp, H, value)
	begin
		if (H = '1') then
			Qn <= value;
		else
			Qn <= Qp;
		end if;
		outValue <= Qp;
	end process combinational;
	Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end Reg;