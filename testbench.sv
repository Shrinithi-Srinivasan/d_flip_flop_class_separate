`include "stimuli.sv"
module d_flip_flop_tb;
  logic d;
  logic clk;
  logic rst;
  logic q;
  d_flip_flop dut(.d(d), .clk(clk),.rst(rst),.q(q));
  task clk_gen();
    begin
      clk = 0;  
      forever #5 clk = ~clk; 
    end
  endtask
  task rst_gen();
    begin
      rst = 1;
      #10 rst = 0;  
    end
  endtask
  DFlipFlopStimulus stimulus;
  initial begin
    stimulus = new();  
    d = 0;  
    fork
      clk_gen();        
      rst_gen();        
      begin
        #15 stimulus.generate_d(); d = stimulus.d;  
        #20 stimulus.generate_d(); d = stimulus.d;  
        #25 stimulus.generate_d(); d = stimulus.d;  
        #30 stimulus.generate_d(); d = stimulus.d; 
        #35 stimulus.generate_d(); d = stimulus.d; 
        #40 $finish;   
      end
    join
  end
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(1); 
  end
  initial begin
    $monitor("At time = %0t: clk = %0b rst = %0b d = %0b q = %0b", $time, clk, rst, d, q);
  end
endmodule
