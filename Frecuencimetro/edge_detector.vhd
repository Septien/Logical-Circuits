library ieee;
use ieee.std_logic_1164.all;

entity EdgeDet is
  port(
  clk, rst  : in std_logic;
  Fx, h        : in std_logic;
  pulse     : out std_logic
);
end EdgeDet;

architecture detector of EdgeDet is
  signal R0, R1 : std_logic;
begin
  process(clk, rst, Fx, R0, R1)
  begin
	 if (h = '1') then
		if (rst = '0') then
			R0 <= '0';
			R1 <= '0';
		elsif (rising_edge(clk)) then
			R0 <= Fx;
			R1 <= R0;
		end if;
	else
      R0 <= '0';
      R1 <= '0';
    end if;
  end process;
    
  pulse <= (not R1) and R0;
end detector;
