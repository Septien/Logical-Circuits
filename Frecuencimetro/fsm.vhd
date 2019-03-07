library ieee;
use ieee.std_logic_1164.all;

entity FSM is
	port(
	clk, rst : in std_logic;
	eoc : in std_logic;
	h, c, l, stc : out std_logic
	);
end FSM;

architecture control of FSM is
type state is (S0, S1, S2);
signal Qn, Qp : state;
begin
	combinational : process(Qp, eoc)
	begin
		case Qp is
			when S0 =>
			h <= '0';
			c <= '1';
			l <= '0';
			stc <= '1';
			Qn <= S1;
			
			when S1 =>
			if (eoc = '1') then
				Qn <= S2;
			else
				Qn <= Qp;
			end if;
			h <= '1';
			c <= '0';
			l <= '0';
			stc <= '0';
			
			when S2 =>
			h <= '0';
			c <= '0';
			l <= '1';
			stc <= '0';
			Qn <= S0;
		end case;
	end process combinational;
	Qp <= S0 when rst = '0' else Qn when rising_edge(clk);
end control;