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
			when "0000" => seg7 <= "1111110";
			when "0001" => seg7 <= "0110000";
			when "0010" => seg7 <= "1101101";
			when "0011" => seg7 <= "1111001";
			when "0100" => seg7 <= "0110011";
			when "0101" => seg7 <= "1011011";
			when "0110" => seg7 <= "1011111";
			when "0111" => seg7 <= "1110000";
			when "1000" => seg7 <= "1111111";
			when "1001" => seg7 <= "1110011";
			when others => seg7 <= "-------";
		end case;
	end process;
end conv;
