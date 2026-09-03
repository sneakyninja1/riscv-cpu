module tb_program_counter; 
    logic clk = 0; 
    logic reset = 0; 
    logic [31:0] pc_out; 
    logic [31:0] expected_pc; 

program_counter dut(
    .clk(clk), 
    .reset(reset), 
    .pc_out(pc_out) 
); 
    always #5 clk = ~clk; 
    initial begin
        //Test Case 1: Reset should set pc_out to 0 
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
        for (int i = 0; i < 5; i++) begin
            expected_pc = pc_out + 4; 
            @(posedge clk); 
            #1; 
            if (expected_pc == pc_out)
                $display("Test Case 2 Passed"); 
            else
                $error("Test Case 2 Failed."); 
        end

        //Test Case 3: Reset pressed at 
        @(negedge clk); 
        #1; 
        reset = 1; 
        #1; 
        if (pc_out == 0)
            $display("Test Case 3 Passed"); 
        else 
            $error("Test Case 3 Failed");
    end
endmodule
