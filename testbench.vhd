LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE structure OF testbench IS
    COMPONENT testset
    PORT (
    a, b, clk, reset : OUT std_logic);
    END COMPONENT;
    
    COMPONENT QuadratureEncoder
    PORT (clk : IN std_logic;
		  reset : IN std_logic;
		  a  : IN  std_logic;
          b : IN std_logic;
		  ctr : OUT std_logic_vector(11 DOWNTO 0));
    END COMPONENT;

    -- local connections
    SIGNAL lcl_a, lcl_b, lcl_clk, lcl_reset : std_logic;
    SIGNAL lcl_counter : std_logic_vector(11 DOWNTO 0);
    
BEGIN
  
    -- Test Set
    ts: testset
    PORT MAP(
                a => lcl_a,
                b => lcl_b,
                clk => lcl_clk,
                reset => lcl_reset
            );
            
    -- Pattern Recognizer
    qe: QuadratureEncoder
    PORT MAP(
                clk => lcl_clk,
                reset => lcl_reset,
                a => lcl_a,
                b => lcl_b,
                ctr => lcl_counter
            );

END structure;
