module tb_d_flip_flop; 
    logic clk = 0;
    logic D;
    logic Q; 

d_flip_flop dut (
    .D(D),
    .Q(Q), 
    .clk(clk) 
); 

    always #5 clk = ~clk; 
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
    end
endmodule 
