class DFlipFlopStimulus;
  rand logic d;  
  function new();
    d = 0; 
  endfunction
  task generate_d();
    d = $urandom_range(0, 1); 
  endtask
endclass
