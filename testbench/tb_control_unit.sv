module tb_control_unit; 
    logic [6:0] opcode; 
    logic [2:0] funct3;  
    logic [6:0] funct7;  
    logic [2:0] alu_op;  
    logic reg_write_enable; 

control_unit dut(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7), 
    .alu_op(alu_op),
    .reg_write_enable(reg_write_enable) 
);     
    initial begin
        //Test Case 1: AND Instruction
        opcode = 7'b0110011; 
        funct3 = 3'b111; 
        funct7 = 7'b0000000; 
        #1; 
        if(alu_op == 3'b010 & reg_write_enable == 1)
            $display("Test Case 1 Passed"); 
        else 
            $error("Test Case 1 Failed. Got %0b, expected 010", alu_op);
        
        //Test Case 2: OR Instruction 
        funct3 = 3'b110; 
        #1; 
        if(alu_op == 3'b011 & reg_write_enable == 1)
            $display("Test Case 2 Passed"); 
        else 
            $error("Test Case 2 Failed. Expected 011, but got %0b", alu_op); 
        
        //Test Case 3: XOR Instruction 
        funct3 = 3'b100; 
        #1; 
        if (alu_op == 3'b100 & reg_write_enable == 1)
            $display("Test Case 3 Passed"); 
        else 
            $error("Test Case 3 Failed. Expected 100 but got %0b", alu_op); 
        
        //Test Case 4: SLL Instruction 
        funct3 = 3'b011; 
        #1; 
        if (alu_op == 3'b101 & reg_write_enable == 1)
            $display("Test Case 4 Passed"); 
        else 
            $error("Test Case 4 Failed. Expected 101 but got %0b", alu_op); 
        
        //Test Case 5: SRL Instruction 
        funct3 = 3'b101; 
        #1; 
        if(alu_op == 3'b110 & reg_write_enable == 1)
            $display("Test Case 5 Passed"); 
        else 
            $error("Test Case 5 Failed. Expected 110 but got %0b", alu_op); 

        //Test Case 6: SLT Instruction 
        funct3 = 3'b010; 
        #1; 
        if(alu_op == 3'b111 & reg_write_enable == 1)
            $display("Test Case 6 Passed"); 
        else 
            $error("Test Case 6 Failed. Expected 111 but got %0b", alu_op);     

        //Test Case 7: ADD Instruction 
        funct3 = 3'b000; 
        funct7 = 7'b0000000; 
        #1; 
        if(alu_op == 3'b000 & reg_write_enable == 1)
            $display("Test Case 7 Passed"); 
        else 
            $error("Test Case 7 Failed. Expected 000 but got %0b", alu_op); 

        //Test Case 8: SUB Instruction 
        funct3 = 3'b000; 
        funct7 = 7'b0100000; 
        #1; 
        if(alu_op == 3'b001 & reg_write_enable == 1)
            $display("Test Case 8 Passed"); 
        else 
            $error("Test Case 8 Failed. Expected 001 but got %0b", alu_op); 

        //Test Case 9: Unrecognized OPCODE Instruction 
        opcode = 7'b0000000; 
        funct3 = 3'b000; 
        funct7 = 7'b0000000; 
        #1; 
        if(alu_op == 3'b000 & reg_write_enable == 0)
            $display("Test Case 9 Passed"); 
        else 
            $error("Test Case 9 Failed. Expected 000 but got %0b", alu_op); 
    end



endmodule
