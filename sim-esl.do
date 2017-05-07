vsim -t 10ns work.esl_demonstrator

# Add signal
add wave -position end sim:/esl_demonstrator/encoder/a
add wave -position end sim:/esl_demonstrator/encoder/b
add wave -position end sim:/esl_demonstrator/GPIO_0
add wave -position end sim:/esl_demonstrator/encoder/dir
add wave -position end sim:/esl_demonstrator/encoder/clk 
add wave -position end sim:/esl_demonstrator/LED
add wave -position end sim:/esl_demonstrator/encoder/ctr
