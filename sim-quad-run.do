restart

# Force signal
## reset
force reset 1, 0 20 ns
## f_clock = 50 MHz clock
force clk 0, 1 10 ns -repeat 20 ns
## encoder signal 2k pulses / rotation, assuming 1 rotation / second
## f_enc = 2 kHz
force a 1, 0 250 us -repeat 500 us
force b 0 125 us, 1 375 us -repeat 500 us

run 2 ms
