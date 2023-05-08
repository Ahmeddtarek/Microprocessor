# Microprocessor
a Microprocessor contain ALU and memory using Verilog 
the inputs of the ALU is a locations specifed by op0 and op1 in the memory and the output is stored in the memory in location op2
the is a selector op that determine the operation of the ALU and also determine either i will read or write into the memory
op = 0 >>> mem[op2] = mem[op0] + mem[op1]
op = 1 >>>  mem[op2] = mem[op0] - mem[op1]
op = 2 >>>  mem[op2] = mem[op0] * mem[op1]
op = 3 >>>  mem[op2] = mem[op0] / mem[op1]
op = 4 >>>  mem[op2] = mem[op0] & mem[op1]
op = 5 >>>  mem[op2] = mem[op0] | mem[op1]
op = 6 >>>  mem[op2] = mem[op0] ^ mem[op1]
op = 7 >>>  out is the value in location "op2"
op = 8 >>> write value "op1" in location "op0"
if the op is given a value more than 8 an indicator op_err will be high 
