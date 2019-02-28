library ieee;
use ieee.std_logic_1164.all;

entity FSM is
  port(
    H : in std_logic;
    clk, rst : in std_logic;
    leds : out std_logic_vector(3 downto 0)
  );
end FSM;

architecture behavioural of FSM is
  type state is (S0, S1, S2, S3, S4, S5);
  signal Qp, Qn : state;
begin
  combinational : process(Qp, Qn, H)
  begin
      case Qp is
      when S0 =>
        if (H = '1') then
          Qn <= S1;
        else
          Qn <= Qp;
        end if;
        leds <= "1000";
        
      when S1 =>
        if (H = '1') then
          Qn <= S2;
        else
          Qn <= Qp;
        end if;
        leds <= "0100";
        
      when S2 =>
        if (H = '1') then
          Qn <= S3;
        else
          Qn <= Qp;
        end if;
        leds <= "0010";
        
      when S3 =>
        if (H = '1') then
          Qn <= S4;
        else
          Qn <= Qp;
        end if;
        leds <= "0001";
        
      when S4 =>
        if (H = '1') then
          Qn <= S5;
        else
          Qn <= Qp;
        end if;
        leds <= "0010";
        
      when S5 =>
        if (H = '1') then
          Qn <= S0;
        else
          Qn <= Qp;
        end if;
        leds <= "0100";

      when others =>
        Qn <= S0;
        leds <= "1111";
        
      end case;
   end process combinational;
  
  sequential : process(clk, rst)
  begin
    if (rst = '0') then
      Qp <= S0;
    elsif (rising_edge(clk)) then
      Qp <= Qn;
    end if;
  end process sequential;
end behavioural;
