library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TimeBase is
generic(
  n : integer := 26
);
port(
  clk, rst : in std_logic;
  H : in std_logic;
  k : in std_logic_vector(n - 1 downto 0);
  T : out std_logic
);
end TimeBase;

architecture simple of TimeBase is
  signal Qn, Qp, aux : unsigned(n - 1 downto 0);
begin
  aux <= unsigned(k);
  combinational : process(Qp, H, aux)
  begin
    if (Qp = aux) then
		if (H = '1') then
			T <= '1';
		else
			T <= '0';
		end if;
		Qn <= (others => '0');
	else
		if (H = '1') then
      		Qn <= Qp + 1;
	  	else
		  Qn <= Qp;
		end if;
		T <= '0';
    end if;
    
  end process combinational;
  Qp <= (others => '0') when rst = '0' else Qn when rising_edge(clk);
end simple;