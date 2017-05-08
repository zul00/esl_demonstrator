LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY QuadratureEncoder IS
  GENERIC (w : positive := 12);
  PORT (clk : IN std_logic;
        reset : IN std_logic;
        a  : IN  std_logic;
        b : IN std_logic;
        ctr : OUT std_logic_vector(w-1 DOWNTO 0));
END QuadratureEncoder;

ARCHITECTURE behaviour OF QuadratureEncoder IS

BEGIN

  PROCESS(clk, reset)
    TYPE states IS (S01, S10, S11, S00);
    VARIABLE state : states;
    VARIABLE lcl_counter : signed(ctr'RANGE);
  BEGIN
    IF reset = '1' THEN
      lcl_counter := to_signed(0, ctr'LENGTH);

      IF a='1' AND b='1' THEN 
        state := S11;
      ELSIF a='0' AND b='0' THEN
        state := S00;
      ELSIF a='0' AND b='1' THEN
        state := S01;
      ELSIF a='1' AND b='0' THEN
        state := S10;
      END IF;

    ELSIF rising_edge(clk) THEN
      CASE state IS 
        WHEN S01 => 
          IF a='1' AND b='1' THEN 
            lcl_counter := lcl_counter-1;
            state := S11;
          ELSIF a='0' AND b='0' THEN
            lcl_counter := lcl_counter+1;
            state := S00;
          END IF;
        WHEN S10 => 
          IF a='1' AND b='1' THEN 
            lcl_counter := lcl_counter+1;
            state := S11;
          ELSIF a='0' AND b='0' THEN
            lcl_counter := lcl_counter-1;
            state := S00;
          END IF;
        WHEN S11 => 
          IF a='1' AND b='0' THEN 
            lcl_counter := lcl_counter-1;
            state := S10;
          ELSIF a='0' AND b='1' THEN
            lcl_counter := lcl_counter+1;
            state := S01;
          END IF;
        WHEN S00 => 
          IF a='1' AND b='0' THEN 
            lcl_counter := lcl_counter+1;
            state := S10;
          ELSIF a='0' AND b='1' THEN
            lcl_counter := lcl_counter-1;
            state := S01;
          END IF;
        WHEN OTHERS =>
          IF a='1' AND b='1' THEN 
            state := S11;
          ELSIF a='0' AND b='0' THEN
            state := S00;
          ELSIF a='0' AND b='1' THEN
            state := S01;
          ELSIF a='1' AND b='0' THEN
            state := S10;
          END IF;
      END CASE;
    END IF;

    ctr <= std_logic_vector(lcl_counter);
  END PROCESS;
END behaviour;
