LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY esl_demonstrator is
	PORT (
	-- CLOCK
	CLOCK_50	: in std_logic;
	-- LEDs are only available on the DE0 Nano board.
	LED		: out std_logic_vector(7 downto 0);
	KEY		: in std_logic_vector(1 downto 0);
	SW			: in std_logic_vector(3 downto 0);

	-- GPIO_0, GPIO_0 connect to GPIO Default
	GPIO_0		: inout std_logic_vector(33 downto 0);
	GPIO_0_IN	: in    std_logic_vector(1 downto 0);

	-- GPIO_1, GPIO_1 connect to GPIO Default
	GPIO_1		: inout std_logic_vector(33 downto 0);
	GPIO_1_IN	: in    std_logic_vector(1 downto 0)
	);
END ENTITY;


ARCHITECTURE behavior OF esl_demonstrator IS
  -- Component list
  COMPONENT QuadratureEncoder
    PORT (
           a  : IN std_logic;    -- Encoder signal
           b  : IN std_logic;    -- Encoder signal
           clk : IN std_logic;
           reset : IN std_logic;
           ctr : OUT std_logic_vector(11 DOWNTO 0)  -- Encoder ctr
         );
  END COMPONENT;
  COMPONENT PulseWidthModulator
    PORT (
           clk : IN std_logic;
           reset : IN std_logic;
           pulse : OUT std_logic
         );
  END COMPONENT;

  -- Signal list
  SIGNAL clk : std_logic;
  SIGNAL reset : std_logic;
  SIGNAL pulse : std_logic;
  SIGNAL a,b : std_logic;
  SIGNAL ctr : std_logic_vector(11 DOWNTO 0);

  signal placeholder : std_logic_vector(10 downto 0);
begin
	encoder : ENTITY work.QuadratureEncoder
		PORT MAP (
			-- MAP your encoder here to the I/O
				a, b, clk, reset, ctr
		);
		
	pwm : ENTITY work.PulseWidthModulator
		PORT MAP (
			-- MAP your pulse width modulator here to the I/O
				clk, reset, pulse
		);

    -- Connect Encoder 0
    LED <= ctr(7 DOWNTO 0);
    a <= GPIO_0(6);
    b <= GPIO_0(7);
    clk <= CLOCK_50;
END ARCHITECTURE;
