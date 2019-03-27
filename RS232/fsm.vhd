library ieee;
use ieee.std_logic_1164.all;

entity FSMS is
  port(
    clk, rst : in std_logic;
    B, STT   : in std_logic;
    EOT      : out std_logic;
    M        : out std_logic_vector(3 downto 0)
  );
end FSMS;

architecture control of FSMS is
  type state is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12);
  signal Qn, Qp : state;
begin
  process(Qp, STT, B)
  begin
    case Qp is
    when S0 =>
      if (STT = '1') then
        Qn <= Qp;
      else
        Qn <= S1;
      end if;
      EOT <= '1';
      M <= "1111";
    
    when S1 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S2;
      end if;
      EOT <= '0';
      M <= "1111";
    
    when S2 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S3;
      end if;
      EOT <= '0';
      M <= "0000";
      
    when S3 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S4;
      end if;
      EOT <= '0';
      M <= "0001";
      
    when S4 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S5;
      end if;
      EOT <= '0';
      M <= "0010";
      
    when S5 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S6;
      end if;
      EOT <= '0';
      M <= "0011";
      
    when S6 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S7;
      end if;
      EOT <= '0';
      M <= "0100";
      
    when S7 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S8;
      end if;
      EOT <= '0';
      M <= "0101";
    
    when S8 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S9;
      end if;
      EOT <= '0';
      M <= "0110";
    
    when S9 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S10;
      end if;
      EOT <= '0';
      M <= "0111";
      
    when S10 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S11;
      end if;
      EOT <= '0';
      M <= "1000";
      
    when S11 =>
      if (B = '0') then
        Qn <= Qp;
      else
        Qn <= S12;
      end if;
      EOT <= '0';
      M <= "1001";
    
    when S12 =>
      Qn <= S0;
      EOT <= '0';
      M <= "1111";

    end case;
  end process;
  Qp <= S0 when rst = '0' else Qn when rising_edge(clk);
end control;
