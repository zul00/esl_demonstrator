vsim -t ns work.QuadratureEncoder

# Add signal
add wave -position end sim:/quadratureencoder/a
add wave -position end sim:/quadratureencoder/b
add wave -position end sim:/quadratureencoder/a_r
add wave -position end sim:/quadratureencoder/b_r
add wave -position end sim:/quadratureencoder/dir
add wave -position end sim:/quadratureencoder/ctr
add wave -position end sim:/quadratureencoder/clk 
add wave -position end sim:/quadratureencoder/reset
