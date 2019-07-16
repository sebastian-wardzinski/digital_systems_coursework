# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules to working dir
vlog ALUregister.v

# load simulation using the top level simulation module
vsim arithmetic_logic_unitv2

# log all signals and add some signals to waveform window
log {/*}
 
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# testing each function with as many cases as needed

#Functions 0,1: expecting the same output for both function, ALUout = 8'b00000101
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0

force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Funtion 2:  B = 4'b0101:expecting 8'b1110 1000
force {SW[0]} 1	
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 0
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Function 3: B = 4'b1000:expecting 8'b1100 0000
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 0
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Function 4: B = 4'b0000:expecting 8b1100 0000

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0

force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Function 5: B = 4'b0000:expecting 8'b0000 0110
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1

force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Function 6: B = 4'b0110, expecting 8'b1111 0000
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1

force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Function 7: HOLD, expecting 8'b11110000
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1

force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1
run 10ns 

#Reset, 8'b00000000
force {SW[9]} 1
force {KEY[0]} 0
run 1ns
force {KEY[0]} 1


run 10ns