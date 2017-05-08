LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY testset IS
    PORT (
    a, b, clk, reset : OUT std_logic);
    
END testset;

ARCHITECTURE set1 OF testset IS
    CONSTANT reset_active : std_logic := '0';   -- Reset active, check board
    SIGNAL iclk : std_logic;
    SIGNAL ctr : INTEGER;

BEGIN
    -- Clock Generator
    PROCESS
    BEGIN
       clk <= '0';
       WAIT FOR 10 ns;
       clk <= '1';
       WAIT FOR 10 ns;
    END PROCESS;
    
	-- Reset
    PROCESS 
    BEGIN
      reset <=  '1';
      WAIT FOR 50 ns;
      reset <= '0';
      WAIT;
    END PROCESS;
    
	-- Signal a
    PROCESS
    BEGIN
      FOR ictr IN 1 TO 1500 LOOP
        a <= '1';
        WAIT FOR 100 ns;
        a <= '0';  
        WAIT FOR 100 ns; 
      END LOOP;
      FOR ictr IN 1 TO 1500 LOOP
        a <= '0';
        WAIT FOR 50 ns;
        a <= '1';
        WAIT FOR 100 ns;
        a <= '0';  
        WAIT FOR 50 ns; 
      END LOOP;
      WAIT;
    END PROCESS;

    -- Signal b
    PROCESS
    BEGIN
      FOR ictr IN 1 TO 1500 LOOP
        b <= '0';
        WAIT FOR 50 ns;
        b <= '1';
        WAIT FOR 100 ns;
        b <= '0';  
        WAIT FOR 50 ns; 
      END LOOP;
      FOR ictr IN 1 TO 1500 LOOP
        b <= '1';
        WAIT FOR 100 ns;
        b <= '0';  
        WAIT FOR 100 ns; 
      END LOOP;
      WAIT;
    END PROCESS;

  END set1;
