library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TimeBase is
	generic(
		n : integer := 26
	);
	port(
	clk, rst : in std_logic;
	sct : in std_logic;
	eoc : out std_logic
	);
end TimeBase;

architecture simple of TimeBase is
signal Qn, Qp, aux : unsigned(n - 1 downto 0);
begin
	aux <= to_unsigned(49999999, n);
	combinational : process(sct, Qp)
	begin
		if (Qp = aux) then
			if (sct = '0') then
				Qn <= Qp;
			else
				Qn <= (others => '0');
			end if;
			eoc <= '1';
		else
			Qn <= Qp + 1;
			eoc <= '0';
		end if;
	end process combinational;
	Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end simple;
