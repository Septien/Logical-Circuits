-- Counts form 0 to 5
library ieee;
use ieee.std_logic_1164.all;

entity TCounter is
	port(
	clk, rst : in std_logic;
	Hin : in std_logic;
	Tens : out std_logic_vector(6 downto 0);
	Hout : out std_logic
	);
end TCounter;

architecture time of TCounter is
type state is (S0, S1, S2, S3, S4, S5, S6);
signal Qn, Qp : state;
begin
	combinational : process(Qn, Qp, Hin)
	begin
		case Qp is
			when S0 =>
			if (Hin = '1') then
				Qn <= S1;
			else
				Qn <= Qp;
			end if;
			Tens <= "0000001";
			Hout <= '0';
			
			when S1 =>
			if (Hin = '1') then
				Qn <= S2;
			else
				Qn <= Qp;
			end if;
			Tens <= "1001111";
			Hout <= '0';
			
			when S2 =>
			if (Hin = '1') then
				Qn <= S3;
			else
				Qn <= Qp;
			end if;
			Tens <= "0010010";
			Hout <= '0';
			
			when S3 =>
			if (Hin = '1') then
				Qn <= S4;
			else
				Qn <= Qp;
			end if;
			Tens <= "0000110";
			Hout <= '0';
			
			when S4 =>
			if (Hin = '1') then
				Qn <= S5;
			else
				Qn <= Qp;
			end if;
			Tens <= "1001100";
			Hout <= '0';
			
			when S5 =>
			if (Hin = '1') then
				Qn <= S6;
			else
				Qn <= Qp;
			end if;
			Tens <= "0100100";
			Hout <= '0';
			when S6 =>
			Qn <= S0;
			Tens <= "0100100";
			Hout <= '1';
		end case;
	end process combinational;
	Qp <= S0 when rst = '0' else Qn when rising_edge(clk);
end time;