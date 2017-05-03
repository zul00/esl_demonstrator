LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PulseWidthModulator IS
  PORT (
         clk : IN std_logic;
         reset : IN std_logic;
         pulse : OUT std_logic
       );
END ENTITY;

ARCHITECTURE bhv OF PulseWidthModulator IS
BEGIN
END ARCHITECTURE bhv;
