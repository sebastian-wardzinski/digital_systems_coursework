# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules to working dir
vlog ALU.v

# load simulation using the top level simulation module
vsim arithmetic_logic_unit

# log all signals and add some signals to waveform window
log {/*}
 
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# testing each function with as many cases as needed

#Functions 0,1: expecting the same output for both function, 5'b01010
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 0
run 10ns 

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {KEY[0]} 1
force {KEY[1]} 0
force {KEY[2]} 0
run 10ns 

#Funtion 2: expecting 8'b1000 1110 
force {SW[0]} 1	
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 1	
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {KEY[0]} 0
force {KEY[1]} 1
force {KEY[2]} 0
run 10ns 

#Function 3: Need one bitstream with all 0s, and one with at least one 1, expecting 8'b11000000 for second
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {KEY[2]} 0
run 10ns 

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {KEY[0]} 1
force {KEY[1]} 1
force {KEY[2]} 0
run 10ns 

#Function 4: One case that fulfills both requirement, and one that only fulfills one

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 1
run 10ns 

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 1
run 10ns 


#Function 5: One test case will do, expecting 8'b10010100
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {KEY[0]} 1
force {KEY[1]} 0
force {KEY[2]} 1
run 10ns 

#Function 6: Only well constructed test case will work, expecting 8'b11010010
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {KEY[0]} 0
force {KEY[1]} 1
force {KEY[2]} 1
run 10ns 

#Trying to triger default case, expecting 8'b00000000
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {KEY[2]} 1
run 10ns 
