# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules to working dir
vlog mux7to1.v

# load simulation using top level simulation module
vsim mux7_to_1

# log all signals and add some signals to waveform window
log {/*}
 
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# testing all of the cases one after the other, expecting an ouput of "1" (light off) for all of the following
# testing case 1
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 0
run 10ns 

# case 2
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 0
run 10ns 

# case 3
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 1
force {SW[9]} 0
run 10ns 

# case 4
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 1
force {SW[9]} 0
run 10ns 

# case 5
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 1
run 10ns 

# case 6
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 1
run 10ns 

# case 7
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {SW[8]} 1
force {SW[9]} 1
run 10ns 

###################
# the next test cases contain pseudo random inputs
# expecting light ON 
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 0
run 10ns 

# light ON
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 1
force {SW[9]} 0
run 10ns 

# light OFF
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 1
run 10ns 

# light ON
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 1
force {SW[9]} 1
run 10ns 

# light ON
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 1
run 10ns 
