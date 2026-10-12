class  mux2to1;
  rand logic a, b, sel;
  
  // write the constraint
  constraint ab_differ{
    a != b; 
  }
endclass 

// write a class object
  mux2to1 inp;

module mux2to1_tb;
  
  // signal declaration 
  logic a, b, sel, y;
  
  // connect the DUT
  mux2to1 DUT (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );
 
  // initial block
    initial begin
       inp = new ();
     repeat(10)begin
      if (!inp.randomize())
    $error("Randomization failed");
        a=inp.a; b=inp.b; sel=inp.sel; #10;
       
       assert (y == (sel ? b : a) )
         else $error("Fail: a=%b,  b=%b, sel=%b | y=%b", a, b, sel, y);
      end
      $finish;
    end
    
endmodule
