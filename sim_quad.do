vsim -t ns work.QuadratureEncoder

# Add signal
add wave *

# Force signal
force clk 0, 1 10 ns -repeat 20 ns

run 1000 ns
