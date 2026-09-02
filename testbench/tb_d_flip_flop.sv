module tb_d_flip_flop; 
    logic clk = 0;
    logic D;
    logic Q;
    logic reset = 0;  

d_flip_flop dut (
    .D(D),
    .Q(Q), 
    .clk(clk),
    .reset(reset)
); 

    always #5 clk = ~clk; //Every 5 cycles switch 
    initial begin
        //Test Case 1: D = 0
        D = 0; 
        @(posedge clk); // Waiting for rising edge of clock
        #1; //Delay by 1 time unit to let Q settle after the positive edge 
        if (Q == 0)
            $display("Test Case 1 Passed: Q is %0d",Q);
        else
            $error("Test Case 1 Failed: Expected 0, got %0d", Q);

        //Test Case 2: D = 1
        D = 1; 
        @(posedge clk); 
        #1; 
        if (Q == 1)
            $display("Test Case 2 Passed: Q is %0d", Q); 
        else 
            $error("Test Case 2 Failed: Expected 1 got %0d", Q); 
        
        //Test Case 3: D = 1, Reset 
        @(posedge clk);
        reset = 1;  
        #1; 
        if (Q == 0)
            $display("Test Case 3 Passed: Q is %0d", Q); 
        else 
            $error("Test Case 3 Failed: Expected 0 got %0d", Q); 
        
        //Test Case 4: D = 1, Asynchronous Reset 
        reset = 0;
        D = 1;
        @(posedge clk); //Setting Q to 1 
        #1;  
        reset = 1; 
        #1; 
        if (Q == 0)
            $display("Test Case 4 Passed: Q is %0d", Q); 
        else 
            $error("Test Case 4 Failed: Expected 0 got %0d", Q); 
    end
endmodule 
