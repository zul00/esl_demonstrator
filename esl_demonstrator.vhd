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
	signal placeholder : std_logic_vector(10 downto 0);
begin
	encoder : entity work.QuadratureEncoder
		port map (
			-- Map your encoder here to the I/O
		);
		
	pwm : entity work.PulseWidthModulator
		port map (
			-- Map your pulse width modulator here to the I/O
		);
end architecture;
