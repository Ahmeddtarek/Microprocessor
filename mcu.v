module mcu #(

parameter op_sz = 32,
parameter mem_sz = 10

) 
  
(

input wire clk, reset,
input wire [mem_sz-1 : 0] op0, 
input wire [op_sz-1 : 0] op1, 
input wire [mem_sz-1 : 0] op2,
input wire [3:0] op, 
output wire [op_sz-1 : 0] out,
output wire op_err


);
  
  reg [op_sz-1:0] mem [0:2**(mem_sz)-1];
  
  
  always @(posedge clk) begin
    
    if (reset==1)
      
      for (int i = 0; i < op_sz-1; i+1) begin
        for (int j = 0; j < 2**mem_sz-1; j+1) begin
          mem[i][j] = 0;
        end
      end
    
    else begin
      
      case (op)
        0: begin 
          
            mem[op2] = mem[op0] + mem[op1];

        end
        1: begin
          
            mem[op2] = mem[op0] - mem[op1];
           
        end
        2: begin
          
            mem[op2] = mem[op0] * mem[op1];
            
        end
        3: begin
          
            mem[op2] = mem[op0] / mem[op1];
          
        end  
        4: begin 
          
            mem[op2] = mem[op0] & mem[op1];
        
        end
        5: begin
          
            mem[op2] = mem[op0] | mem[op1];
        end
        6: begin
          
            mem[op2] = mem[op0] ^ mem[op1];
        end      
        
        8: begin  
          mem[op0] = op1; 
        end
      endcase
    end 
  end
  
  assign op_err = (op>8) ? 1:0;
  assign out = (op==7) ? mem[op0] : mem[op2];
  
endmodule
