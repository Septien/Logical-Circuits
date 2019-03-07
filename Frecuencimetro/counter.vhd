library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter is
	port(
	clk, rst : in std_logic;
	Hin : in std_logic;
	count : out std_logic_vector(3 downto 0);
	Hout : out std_logic
	);
end Counter;

architecture count of Counter is
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
			count <= "0000";
			Hout <= '0';
			
			when S1 =>
			if (Hin = '1') then
				Qn <= S2;
			else
				Qn <= Qp;
			end if;
			count <= "0001";
			Hout <= '0';
			
			when S2 =>
			if (Hin = '1') then
				Qn <= S3;
			else
				Qn <= Qp;
			end if;
			count <= "0010";
			Hout <= '0';
			
			when S3 =>
			if (Hin = '1') then
				Qn <= S4;
			else
				Qn <= Qp;
			end if;
			count <= "0011";
			Hout <= '0';
			
			when S4 =>
			if (Hin = '1') then
				Qn <= S5;
			else
				Qn <= Qp;
			end if;
			count <= "0100";
			Hout <= '0';
			
			when S5 =>
			if (Hin = '1') then
				Qn <= S6;
			else
				Qn <= Qp;
			end if;
			count <= "0101";
			Hout <= '0';
			
			when S6 =>
			if (Hin = '1') then
				Qn <= S7;
			else
				Qn <= Qp;
			end if;
			count <= "0110";
			Hout <= '0';
			
			when S7 =>
			if (Hin = '1') then
				Qn <= S8;
			else
				Qn <= Qp;
			end if;
			count <= "0111";
			Hout <= '0';
			
			when S8 =>
			if (Hin = '1') then
				Qn <= S9;
			else
				Qn <= Qp;
			end if;
			count <= "1000";
			Hout <= '0';
			
			when S9 =>
			if (Hin = '1') then
				Qn <= S10;
			else
				Qn <= Qp;
			end if;
			count <= "1001";
			Hout <= '0';
			
			when S10 =>
			Qn <= S0;
			count <= "1001";
			Hout <= '1';
			
		end case;
	end process combinational;
	Qp <= S0 when rst = '0' else Qn when rising_edge(clk);
end count;