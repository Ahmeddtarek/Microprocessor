# Microprocessor
a Microprocessor contain ALU and memory using Verilog <br>
the inputs of the ALU is a locations specified by op0 and op1 in the memory and the output is stored in the memory in location op2 <br>
the selector op determines the operation of the ALU and also determine either i will read or write into the memory <br>
op = 0 >>> mem[op2] = mem[op0] + mem[op1] <br>
op = 1 >>>  mem[op2] = mem[op0] - mem[op1] <br>
op = 2 >>>  mem[op2] = mem[op0] * mem[op1] <br>
op = 3 >>>  mem[op2] = mem[op0] / mem[op1] <br>
op = 4 >>>  mem[op2] = mem[op0] & mem[op1] <br>
op = 5 >>>  mem[op2] = mem[op0] | mem[op1] <br>
op = 6 >>>  mem[op2] = mem[op0] ^ mem[op1] <br>
op = 7 >>>  out is the value in location "op2" <br>
op = 8 >>> write value "op1" in location "op0" <br>
if the op is given a value more than 8 an indicator op_err will be high <br> 
