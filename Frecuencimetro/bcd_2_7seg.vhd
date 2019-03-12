library ieee;
use ieee.std_logic_1164.all;

entity BCD2_7SEG is
	port(
	bcd : in std_logic_vector(3 downto 0);
	seg7 : out std_logic_vector(6 downto 0)
	);
end BCD2_7SEG;

architecture conv of BCD2_7SEG is
begin
	process(bcd)
	begin
		case bcd is
			when "0000" => seg7 <= "0000001";
			when "0001" => seg7 <= "1001111";
			when "0010" => seg7 <= "0010010";
			when "0011" => seg7 <= "0000110";
			when "0100" => seg7 <= "1001100";
			when "0101" => seg7 <= "0100100";
			when "0110" => seg7 <= "0100000";
			when "0111" => seg7 <= "0001111";
			when "1000" => seg7 <= "0000000";
			when "1001" => seg7 <= "0001100";
			when others => seg7 <= "-------";
		end case;
	end process;
end conv;
