# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules to working dir
vlog bit_8_Rotating_Register.v

# load simulation using the top level simulation module
vsim bit_8_RotatingRegister

# log all signals and add some signals to waveform window
log {/*}
 
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# testing each function with as many cases as needed

#Scanario 2: Load takes precedance, Q = D = 8'b1100 1111 
force {D} 8'b11001110

force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Load will be zero for the rest of the scenarios, D will also be static
#Scenario 3: Rotate right and 0 pad, Q = 8'b0110 0111
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Scenario 4: Rotate right and wrap, Q = 8'b1011 0011
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 0
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Scenario 5: Rotate left and wrap, Q = 8'b0110 0111
force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Set up: setting up input for testing last scenario
force {D} 8'b11111111

force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1

run 10ns 

#Scenario 6: rotate left and 0 pad, Q = 8'b1111 1110
force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Testing Reset, want Q = 0
force {SW[9]} 1
force {D} 8'b11111111
force {KEY[1]} 0
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 