LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY QuadratureEncoder IS
  PORT (
         a  : IN std_logic;    -- Encoder signal
         b  : IN std_logic;    -- Encoder signal
         clk : IN std_logic;
         reset : IN std_logic;
         ctr : OUT std_logic_vector(31 DOWNTO 0)  -- Encoder ctr
       );
END ENTITY;

ARCHITECTURE bhv OF QuadratureEncoder IS
  SIGNAL a_r : std_logic_vector(1 DOWNTO 0);
  SIGNAL b_r : std_logic_vector(1 DOWNTO 0);
  SIGNAL ad : std_logic_vector(1 DOWNTO 0);
BEGIN
  event:PROCESS(clk, reset)
  VARIABLE ctr_tmp : signed(ctr'RANGE);
  BEGIN
    IF reset='1' THEN
      ctr <= (OTHERS => '0');
      ctr_tmp := to_signed(0, ctr'LENGTH);
      a_r <= (OTHERS => '0');
      b_r <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      a_r <= a_r(0) & a;
      b_r <= b_r(0) & b;

      -- Check direction
      CASE a_r IS
        WHEN "01" =>    -- rising edge
          IF b = '1' THEN
            ad <= "01";   -- up
          ELSIF b = '0' THEN
            ad <= "10";   -- down
          END IF;
        WHEN "10" =>    -- falling edge
          IF b = '1' THEN
            ad <= "10";   -- down
          ELSIF b = '0' THEN
            ad <= "01";   -- up
          END IF;
        WHEN OTHERS =>
          ad <= "00";
      END CASE;

      -- Update counter
      CASE ad IS
        WHEN "01" =>  -- up
          ctr_tmp := ctr_tmp + 1;
        WHEN "10" =>  -- down
          ctr_tmp := ctr_tmp - 1;
        WHEN OTHERS =>
          ctr_tmp := ctr_tmp;
      END CASE;
      ctr <= std_logic_vector(ctr_tmp);
    END IF;
  END PROCESS;
END ARCHITECTURE bhv;
