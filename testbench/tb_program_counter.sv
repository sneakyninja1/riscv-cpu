module tb_program_counter; 
    logic clk = 0; 
    logic reset = 0; 
    logic [32:0] pc_out; 

program_counter dut(
    .clk(clk); 
    .reset(reset); 
    .pc_out(pc_out); 
); 

    initial begin
        //Test Case 1: Reset should set pc_out to 0 
        pc_out = 32'd332; 
        reset = 1; 
        #1; 
        @(posedge clk);
        #1; 
        if (pc_out == 0)
            $display("Test Case 1 Passed."); 
        else 
            $error("Test Case 1 Failed. Expected pc out to be 0 but got %0d", pc_out); 
        
        //Test Case 2: Verify pc_out increases by 4 each cycle 
        reset = 0; 
        for (int i = 0; i < 5; i++) 
            @(posedge clk); 
            #1; 
            if (pc_out == pc_out + 4)
                $display("Test Case 2 Passed"); 
            else
                $error("Test Case 2 Failed."); 

        //Test Case 3: Reset pressed at 
        @(negedge clk); 
        pc_out = 32'd300; 
        #1; 
        reset = 1; 
        #1; 
        if (pc_out == 0)
            $errr0("Test Case 3 Failed. Got 0 but expected 300"); 
        else 
            $display("Test Case 3 Passed");
    end
endmodule
