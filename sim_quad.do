vsim -t ns work.QuadratureEncoder

# Add signal
add wave *

# Force signal
## f_clock = 50 MHz clock
force clk 0, 1 10 ns -repeat 20 ns
## encoder signal 2k pulses / rotation, assuming 1 rotation / second
## f_enc = 2 kHz
force ab(0) 1, 0 250 us -repeat 500 us        # A
force ab(1) 0 125 us, 1 375 us -repeat 500 us # B

run 2 ms
