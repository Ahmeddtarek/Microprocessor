module mcu_tb;
  parameter clk_period = 10ns;
  parameter op_sz = 32;
  parameter mem_sz = 10;
  reg clk_tb = 0;
  always #(clk_period/2) clk_tb = ~clk_tb;
  reg [mem_sz-1 : 0] op0_tb;
  reg [op_sz-1 : 0] op1_tb;
  reg [mem_sz-1 : 0] op2_tb;
  reg [3:0] op_tb;
  wire [op_sz-1 : 0] out_tb;
  wire op_err_tb;
  reg reset_tb;
  reg [op_sz-1:0] mem_tb [0:2**(mem_sz)-1];
  
  
  mcu dut (
    .clk(clk_tb),
    .op0(op0_tb),
    .op1(op1_tb),
    .op2(op2_tb),
    .op(op_tb),
    .out(out_tb),
    .op_err(op_err_tb),
    .reset(reset_tb)
    
  );
  
  function reg check_add(
    input reg [op_sz-1 : 0] out,
    input reg [op_sz-1 : 0] in0,
    input reg [op_sz-1 : 0] in1
  );
    if (out == (in0 + in1)) return (1);
      else return (0) ;
  endfunction
  
   function reg check_sub(
    input reg [op_sz-1 : 0] out,
    input reg [op_sz-1 : 0] in0,
    input reg [op_sz-1 : 0] in1
  );
     if (out == (in0 - in1)) return (1);
      else return (0) ;
  endfunction
  
   function reg check_mul(
    input reg [op_sz-1 : 0] out,
    input reg [op_sz-1 : 0] in0,
    input reg [op_sz-1 : 0] in1
  );
     if (out == (in0 * in1)) return (1);
      else return (0) ;
  endfunction
  
   function reg check_div(
    input reg [op_sz-1 : 0] out,
    input reg [op_sz-1 : 0] in0,
    input reg [op_sz-1 : 0] in1
  );
     if (out == (in0 / in1)) return (1);
      else return (0) ;
  endfunction
  
   function reg check_and(
    input reg [op_sz-1 : 0] out,
    input reg [op_sz-1 : 0] in0,
    input reg [op_sz-1 : 0] in1
  );
     if (out == (in0 & in1)) return (1);
      else return (0) ;
  endfunction
  
   function reg check_or(
    input reg [op_sz-1 : 0] out,
    input reg [op_sz-1 : 0] in0,
    input reg [op_sz-1 : 0] in1
  );
     if (out == (in0 | in1)) return (1);
      else return (0) ;
  endfunction
  
   function reg check_xor(
    input reg [op_sz-1 : 0] out,
    input reg [op_sz-1 : 0] in0,
    input reg [op_sz-1 : 0] in1
  );
     if (out == (in0 ^ in1)) return (1);
      else return (0) ;
  endfunction
      
  
  task ADD(
    
    input reg [mem_sz-1 : 0] op0, 
    input reg [op_sz-1 : 0] op1,
    input reg [mem_sz-1 : 0] op2
  );
  
    reset_tb = 0;
    op_tb = 0;
    op0_tb = op0;
    op1_tb = op1;
    op2_tb = op2;
    
    #(clk_period);
   
    
    $display("ADD >> value in location op2 =%d ,, op_err =%d",                         out_tb, op_err_tb);
  endtask
  
  task SUB(
  
    input reg [mem_sz-1 : 0] op0, 
    input reg [op_sz-1 : 0] op1,
    input reg [mem_sz-1 : 0] op2
  );
     reset_tb = 0;
    op_tb = 1;
    op0_tb = op0;
    op1_tb = op1;
    op2_tb = op2;
    
    #(clk_period);
    
    $display("SUB >> value in location op2 =%d ,, op_err =%d",                         out_tb, op_err_tb);
  endtask
  
  task MUL(
   
    input reg [mem_sz-1 : 0] op0, 
    input reg [op_sz-1 : 0] op1,
    input reg [mem_sz-1 : 0] op2
  );
     reset_tb = 0;
    op_tb = 2;
    op0_tb = op0;
    op1_tb = op1;
    op2_tb = op2;
    
    #(clk_period);
   
    
    $display("MUL >> value in location op2 =%d ,, op_err =%d",                         out_tb, op_err_tb);
  endtask
  
  task DIV(
    input reg [mem_sz-1 : 0] op0, 
    input reg [op_sz-1 : 0] op1,
    input reg [mem_sz-1 : 0] op2
  );
     reset_tb = 0;
    op_tb = 3;
    op0_tb = op0;
    op1_tb = op1;
    op2_tb = op2;
    
    #(clk_period);
   
    
    $display("DIV >> value in location op2 =%d ,, op_err =%d",                         out_tb, op_err_tb);
  endtask
  
  task AND(
    
    input reg [mem_sz-1 : 0] op0, 
    input reg [op_sz-1 : 0] op1,
    input reg [mem_sz-1 : 0] op2
  );
     reset_tb = 0;
    op_tb = 4;
    op0_tb = op0;
    op1_tb = op1;
    op2_tb = op2;
    
    #(clk_period);
   
    
    $display("AND >> value in location op2 =%d ,, op_err =%d",                         out_tb, op_err_tb);
  endtask
  
  task OR(
    input reg [mem_sz-1 : 0] op0, 
    input reg [op_sz-1 : 0] op1,
    input reg [mem_sz-1 : 0] op2
  );
     reset_tb = 0;
    op_tb = 5;
    op0_tb = op0;
    op1_tb = op1;
    op2_tb = op2;
    
    #(clk_period);
   
    
    $display("OR >> value in location op2 =%d ,, op_err =%d",                         out_tb, op_err_tb);
  endtask
  
  task XOR(
    
    input reg [mem_sz-1 : 0] op0, 
    input reg [op_sz-1 : 0] op1,
    input reg [mem_sz-1 : 0] op2
  );
     reset_tb = 0;
    op_tb = 6;
    op0_tb = op0;
    op1_tb = op1;
    op2_tb = op2;
    
    #(clk_period);
   
    
    $display("XOR >> value in location op2 =%d ,, op_err =%d",                         out_tb, op_err_tb);
  endtask
  
   task WRITE(
     input reg [mem_sz-1 : 0] op0,
     input reg [op_sz-1 : 0] op1
  );
     reset_tb = 0;
     op_tb = 8;
     op0_tb = op0;
     op1_tb = op1;
    
    #(clk_period);
     $display("WRITE >> LOCATION(op0) =%d ,, VALUE(op1) =%d ,, op_err=%d", op0_tb, op1, op_err_tb);
     
   endtask
  
  task READ(
    input reg [mem_sz-1 : 0] op0
  );
     reset_tb = 0;
     op_tb = 7;
     op0_tb = op0;
    
    #(clk_period);
    $display("READ >> out =%d ,, op_err =%d", out_tb, op_err_tb);
    
  endtask
    
  task op_test(
    input reg [3:0] op
  );
    op_tb = op;
    #(clk_period);
    $display("op_test >> op_err =%d",op_err_tb);
    
  endtask
  
  initial begin
    reg [op_sz-1 : 0] test;
    
    
    ////////////////// 1st inputs //////////////////
    
    WRITE(100,2);
    WRITE(101,1);
    ADD(100,101,102);
    test = check_add(out_tb,2,1);
    $display("test_fun >> test =%d",test);
    
    SUB(100,101,102);
    test = check_sub(out_tb,2,1);
    $display("test_fun >> test =%d",test);
    
    MUL(100,101,102);
    test = check_mul(out_tb,2,1);
    $display("test_fun >> test =%d",test);
    
    DIV(100,101,102);
    test = check_div(out_tb,2,1);
    $display("test_fun >> test =%d",test);
    
    AND(100,101,102);
    test = check_and(out_tb,2,1);
    $display("test_fun >> test =%d",test);
    
    OR(100,101,102);
    test = check_or(out_tb,2,1);
    $display("test_fun >> test =%d",test);
    
    XOR(100,101,102);
    test = check_xor(out_tb,2,1);
    $display("test_fun >> test =%d",test);
    
    READ(100); 
    op_test(10);
    
    //////////////////////////2nd inputs /////////////////////
    
    WRITE(1000,6);
    WRITE(1001,3);
    
    ADD(1000,1001,1002);
    test = check_add(out_tb,6,3);
    $display("test_fun >> test =%d",test);
    
    SUB(1000,1001,1002);
    test = check_sub(out_tb,6,3);
    $display("test_fun >> test =%d",test);
    
    MUL(1000,1001,1002);
    test = check_mul(out_tb,6,3);
    $display("test_fun >> test =%d",test);
    
    DIV(1000,1001,1002);
    test = check_div(out_tb,6,3);
    $display("test_fun >> test =%d",test);
    
    AND(1000,1001,1002);
    test = check_and(out_tb,6,3);
    $display("test_fun >> test =%d",test);
    
    OR(1000,1001,1002);
    test = check_or(out_tb,6,3);
    $display("test_fun >> test =%d",test);
    
    XOR(1000,1001,1002);
    test = check_xor(out_tb,6,3);
    $display("test_fun >> test =%d",test);
    
    READ(1000);
    op_test(12);
    
    $finish();
  end
  
endmodule

