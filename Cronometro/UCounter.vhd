-- Counter, from 0 to 9
library ieee;
use ieee.std_logic_1164.all;

entity UCounter is
	port(
	clk, rst : in std_logic;
	Hin : in std_logic;
	Unit : out std_logic_vector(6 downto 0);	-- To the display
	Hout : out std_logic				-- Send signal to next counter
	);
end UCounter;

architecture time of UCounter is
type state is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10);
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
			Unit <= "0000001";
			Hout <= '0';
			
			when S1 =>
			if (Hin = '1') then
				Qn <= S2;
			else
				Qn <= Qp;
			end if;
			Unit <= "1001111";
			Hout <= '0';
			
			when S2 =>
			if (Hin = '1') then
				Qn <= S3;
			else
				Qn <= Qp;
			end if;
			Unit <= "0010010";
			Hout <= '0';
			
			when S3 =>
			if (Hin = '1') then
				Qn <= S4;
			else
				Qn <= Qp;
			end if;
			Unit <= "0000110";
			Hout <= '0';
			
			when S4 =>
			if (Hin = '1') then
				Qn <= S5;
			else
				Qn <= Qp;
			end if;
			Unit <= "1001100";
			Hout <= '0';
			
			when S5 =>
			if (Hin = '1') then
				Qn <= S6;
			else
				Qn <= Qp;
			end if;
			Unit <= "0100100";
			Hout <= '0';
			
			when S6 =>
			if (Hin = '1') then
				Qn <= S7;
			else
				Qn <= Qp;
			end if;
			Unit <= "0100000";
			Hout <= '0';
			
			when S7 =>
			if (Hin = '1') then
				Qn <= S8;
			else
				Qn <= Qp;
			end if;
			Unit <= "0001111";
			Hout <= '0';
			
			when S8 =>
			if (Hin = '1') then
				Qn <= S9;
			else
				Qn <= Qp;
			end if;
			Unit <= "0000000";
			Hout <= '0';
			
			when S9 =>
			if (Hin = '1') then
				Qn <= S10;
			else
				Qn <= Qp;
			end if;
			Unit <= "0001100";
			Hout <= '0';
			when S10 =>
			Qn <= S0;
			Unit <= "0001100";
			Hout <= '1';
		end case;
	end process combinational;
	Qp <= S0 when rst = '0'	else Qn when rising_edge(clk);
end time;
