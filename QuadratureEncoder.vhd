LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY QuadratureEncoder IS
  PORT (
         ab  : IN std_logic_vector(1 DOWNTO 0);    -- Encoder signal
         ctr : OUT std_logic_vector(31 DOWNTO 0);  -- Encoder ctr
         clk : IN std_logic
       );
END ENTITY;

ARCHITECTURE bhv OF QuadratureEncoder IS
  SIGNAL ab_last : std_logic_vector(1 DOWNTO 0);
BEGIN
  p1:PROCESS(clk)
  BEGIN
    IF rising_edge(clk) THEN
      ab_last <= ab;
    END IF;
  END PROCESS;
END ARCHITECTURE bhv;
