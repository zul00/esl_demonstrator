library ieee;
use ieee.std_logic_1164.all;

entity esl_demonstrator is
	port (
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
end entity;


architecture behavior of esl_demonstrator is
  -- Component list
  COMPONENT QuadratureEncoder
    PORT (
           ab  : IN std_logic_vector(1 DOWNTO 0);    -- Encoder signal
           clk : IN std_logic;
           reset : IN std_logic;
           ctr : OUT std_logic_vector(31 DOWNTO 0)  -- Encoder ctr
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
  SIGNAL ab : std_logic_vector(1 DOWNTO 0);
  SIGNAL ctr : std_logic_vector(31 DOWNTO 0);

  signal placeholder : std_logic_vector(10 downto 0);
begin
	encoder : entity work.QuadratureEncoder
		port map (
			-- Map your encoder here to the I/O
				ab, clk, reset, ctr
		);
		
	pwm : entity work.PulseWidthModulator
		port map (
			-- Map your pulse width modulator here to the I/O
				clk, reset, pulse
		);
end architecture;
