module tb_cpu;
    logic clk = 0;
    logic reset = 0;

    cpu dut (
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;
    initial begin
        reset = 1;
        #1;
        @(posedge clk);
        #1;
        reset = 0;

        // Run for a few cycles to let all 4 instructions execute
        repeat (5) @(posedge clk);
        #1;

    //Test Case 1: Check x1 == 5 (ADDI, x1, x0, 5)
    if (dut.reg_file.registers[1]==5)
        $display("Test Case 1 Passed: x1 = %0d", dut.reg_file.registers[1]); 
    else 
        $error("Test Case 1 Failed. Expected 5 but got %0d", dut.reg_file.registers[1]); 

    //Test Case 2: Check x2 == 5 (ADDI, x2, x0, 5)
    if (dut.reg_file.registers[2]==3)
        $display("Test Case 2 Passed: x2 = %0d", dut.reg_file.registers[2]); 
    else 
        $error("Test Case 2 Failed. Expected 3 but got %0d", dut.reg_file.registers[2]); 
    
    //Test Case 3: Check x3 == 5 (ADDI, x3, x1, x2)
    if (dut.reg_file.registers[3]==8)
        $display("Test Case 3 Passed: x3 = %0d", dut.reg_file.registers[3]); 
    else 
        $error("Test Case 3 Failed. Expected 8 but got %0d", dut.reg_file.registers[3]); 

    //Test Case 4: Check x4 == 2 (SUB, x4, x1, x2)
    if (dut.reg_file.registers[4]==2)
        $display("Test Case 4 Passed: x4 = %0d", dut.reg_file.registers[4]); 
    else 
        $error("Test Case 4 Failed. Expected 2 but got %0d", dut.reg_file.registers[4]); 

    end
endmodule