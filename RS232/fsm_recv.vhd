library ieee;
use ieee.std_logic_1164.all;

entity FSMR is
  port(
    clk, rst : in std_logic;
    Rx : in std_logic;
    B : in std_logic;
    EOR : out std_logic;
    S : out std_logic
  );
end FSMR;

architecture control of FSMR is
  signal Qn, Qp : std_logic_vector(5 downto 0);
begin
  process(Qp, Rx, B)
  begin
    case Qp is
	   when "000000" =>
	   if (Rx = '1') then
      Qn <= Qp;
	   else
	    Qn <= "000001";
	   end if;
	   EOR <= '0';
	   S <= '0';

	   when "000001" =>           -- Starting bit
	   if (B = '0') then
			Qn <= Qp;
		 else
			Qn <= "000010";
		 end if;
		 EOR <= '0';
		 S <= '0';

		 when "000010" =>
		 if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "000011";
		end if;
		EOR <= '0';
		S <= '0';

		when "000011" =>
		Qn <= "000100";
		EOR <= '0';
		S <= '1';

		when "000100" =>
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "000101";
		end if;
		EOR <= '0';
		S <= '0';

		when "000101" =>
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "000110";
		end if;
		EOR <= '0';
		S <= '0';

		when "000110" =>           -- D0
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "000111";
		end if;
		EOR <= '0';
		S <= '0';

		when "000111" =>
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "001000";
		end if;
		EOR <= '0';
		S <= '0';

		when "001000" =>
		Qn <= "001001";
		EOR <= '0';
		S <= '1';

		when "001001" =>
		if (B = '0') then
		  Qn <= Qp;
		else
			Qn <= "001010";
		end if;
		EOR <= '0';
		S <= '0';

		when "001010" =>
		if (B = '0') then
		  Qn <= Qp;
		else
			Qn <= "001011";
		end if;
		EOR <= '0';
		S <= '0';

		when "001011" =>           -- D1
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "001100";
		end if;
		EOR <= '0';
		S <= '0';

		when "001100" =>
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "001101";
		end if;
		EOR <= '0';
		S <= '0';

		when "001101" =>
		Qn <= "001110";
		EOR <= '0';
		S <= '1';

		when "001110" =>
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "001111";
		end if;
		EOR <= '0';
		S <= '0';

		when "001111" =>
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "010000";
		end if;
		EOR <= '0';
		S <= '0';

		when "010000" =>           -- D2
		if (B = '0') then
			Qn <= Qp;
		else
			Qn <= "010001";
		end if;
		EOR <= '0';
		S <= '0';

		when "010001" =>
		if (B = '0') then
		  Qn <= Qp;
		else
			Qn <= "010010";
		end if;
		EOR <= '0';
		S <= '0';

			when "010010" =>
			Qn <= "010011";
			EOR <= '0';
			S <= '1';

			when "010011" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "010100";
			end if;
			EOR <= '0';
			S <= '0';

			when "010100" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "010101";
			end if;
			EOR <= '0';
			S <= '0';

			when "010101" =>           -- D3
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "010110";
			end if;
			EOR <= '0';
			S <= '0';

			when "010110" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "010111";
			end if;
			EOR <= '0';
			S <= '0';

			when "010111" =>
			Qn <= "011000";
			EOR <= '0';
			S <= '1';

			when "011000" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "011001";
			end if;
			EOR <= '0';
			S <= '0';

			when "011001" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "011010";
			end if;
			EOR <= '0';
			S <= '0';

			when "011010" =>           -- D4
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "011011";
			end if;
			EOR <= '0';
			S <= '0';

			when "011011" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "011100";
			end if;
			EOR <= '0';
			S <= '0';

			when "011100" =>
			Qn <= "011101";
			EOR <= '0';
			S <= '1';

			when "011101" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "011110";
			end if;
			EOR <= '0';
			S <= '0';

			when "011110" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "011111";
			end if;
			EOR <= '0';
			S <= '0';

			when "011111" =>           -- D5
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "100000";
			end if;
			EOR <= '0';
			S <= '0';

			when "100000" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "100001";
			end if;
			EOR <= '0';
			S <= '0';

			when "100001" =>
			Qn <= "100010";
			EOR <= '0';
			S <= '1';

			when "100010" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "100011";
			end if;
			EOR <= '0';
			S <= '0';

			when "100011" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "100100";
			end if;
			EOR <= '0';
			S <= '0';

			when "100100" =>           -- D6
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "100101";
			end if;
			EOR <= '0';
			S <= '0';

			when "100101" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "100110";
			end if;
			EOR <= '0';
			S <= '0';

			when "100110" =>
			Qn <= "100111";
			EOR <= '0';
			S <= '1';

			when "100111" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "101000";
			end if;
			EOR <= '0';
			S <= '0';

			when "101000" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "101001";
			end if;
			EOR <= '0';
			S <= '0';

			when "101001" =>           -- D7
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "101010";
			end if;
			EOR <= '0';
			S <= '0';

			when "101010" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "101011";
			end if;
			EOR <= '0';
			S <= '0';

			when "101011" =>
			Qn <= "101100";
			EOR <= '0';
			S <= '1';

			when "101100" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "101101";
			end if;
			EOR <= '0';
			S <= '0';

			when "101101" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "101110";
			end if;
			EOR <= '0';
			S <= '0';

			when "101110" =>           -- Parity bit
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "101111";
			end if;
			EOR <= '0';
			S <= '0';

			when "101111" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "110000";
			end if;
			EOR <= '0';
			S <= '0';

			when "110000" =>
			Qn <= "110001";
			EOR <= '0';
			S <= '1';

			when "110001" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "110010";
			end if;
			EOR <= '0';
			S <= '0';

			when "110010" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "110011";
			end if;
			EOR <= '0';
			S <= '0';

			when "110011" =>      -- Halt bit
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "110100";
			end if;
			EOR <= '0';
			S <= '0';

			when "110100" =>
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "110101";
			end if;
			EOR <= '0';
			S <= '0';

			when "110101" =>     -- Data reading
			if (B = '0') then
			Qn <= Qp;
			else
			Qn <= "000000";
			end if;
			EOR <= '1';
			S <= '0';

			when others =>
			Qn <= "000000";
			EOR <= '0';
			S <= '0';
    
  end case;
  end process;
  Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end control;
