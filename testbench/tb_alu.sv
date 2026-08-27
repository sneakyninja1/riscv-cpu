module tb_alu;
    logic [31:0] A;
    logic [31:0] B;
    logic [2:0] operation;
    logic [31:0] result; 

    alu dut(
        .A(A),
        .B(B), 
        .operation(operation), 
        .result(result)
    ); 
    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, tb_alu);
        
        // Test Case 1: A = 3, B = 5, operation = 000 (Addition)
        A = 32'd3; 
        B = 32'd5; 
        operation = 3'b000; 
        #10; 
        if (result == 32'd8)
            $display("Test Case 1 Passed: Add %0d + %0d = %0d", A, B, result);
        else
            $error("Test Case 1 Failed: Add %0d + %0d, expected 8, got %0d", A, B, result);

         //Test Case 2: A = 3, B = 5, operation = 001 (Subtraction)
        A = 32'd3;
        B = 32'd5; 
        operation = 3'b001;
        #10;
        if (result == 32'd4294967294) // 3 - 5 = -2 in 32-bit unsigned is 4294967294
            $display("Test Case 2 Passed: Sub %0d - %0d = %0d", A, B, result);
        else
            $error("Test Case 2 Failed: Sub %0d - %0d, expected 4294967294, got %0d", A, B, result);
        
        //Test Case 3: A = 3, B = 5, operation = 010 (AND)
        A = 32'd3;
        B = 32'd5; 
        operation = 3'b010;
        #10;
        if (result == 32'd1) // 3 & 5 = 1
            $display("Test Case 3 Passed: AND %0d & %0d = %0d", A, B, result);
        else
            $error("Test Case 3 Failed: AND %0d & %0d, expected 1, got %0d", A, B, result);

         //Test Case 4: A = 3, B = 5, operation = 011 (OR)
        A = 32'd3;
        B = 32'd5; 
        operation = 3'b011;
        #10;
        if (result == 32'd7) // 3 | 5 = 7
            $display("Test Case 4 Passed: OR %0d | %0d = %0d", A, B, result);
        else 
            $error("Test Case 4 Failed: OR %0d | %0d, expected 7, got %0d", A, B, result); 

         //Test Case 5: A = 3, B = 5, operation = 100 (XOR)           
        A = 32'd3;
        B = 32'd5; 
        operation = 3'b100;
        #10;
        if (result == 32'd6) // 3 ^ 5 = 6
            $display("Test Case 5 Passed: XOR %0d ^ %0d = %0d", A, B, result); 
        else
            $error("Test Case 5 Failed: XOR %0d ^ %0d, expected 6, got %0d", A, B, result); 

         //Test Case 6: A = 3, B = 5, operation = 101 (SLL)
        A = 32'd3;
        B = 32'd5; 
        operation = 3'b101;
        #10;
        if (result == 32'd96) // 3 << 5 = 96
            $display("Test Case 6 Passed: SLL %0d << %0d = %0d", A, B, result);
        else
            $error("Test Case 6 Failed: SLL %0d << %0d, expected 96, got %0d", A, B, result);

         //Test Case 7: A = 3, B = 5, operation = 110 (SRL)
        A = 32'd3;
        B = 32'd5; 
        operation = 3'b110;
        #10;
        if (result == 32'd0) // 3 >> 5 = 0
            $display("Test Case 7 Passed: SRL %0d >> %0d = %0d", A, B, result);
        else
            $error("Test Case 7 Failed: SRL %0d >> %0d, expected 0, got %0d", A, B, result);

         //Test Case 8: A = 5, B = 5, operation = 111 (Comparison)
        A = 32'd5;
        B = 32'd5; 
        operation = 3'b111;
        #10;
        if (result == 32'd1) // 5 == 5 = 1
            $display("Test Case 8 Passed: Comparison %0d == %0d = %0d", A, B, result);
        else
            $error("Test Case 8 Failed: Comparison %0d == %0d, expected 1, got %0d", A, B, result);

        //Test Case 9: A = 1, B = 15, operation = 101 (SLL)
        A = 32'd1; 
        B = 32'd15; 
        operation = 3'b101;
        #10;
        if (result == 32'd32768) // 1 << 15 = 32768
            $display("Test Case 9 Passed: SLL %0d << %0d = %0d", A, B, result);
        else
            $error("Test Case 9 Failed: SLL %0d << %0d, expected 32768, got %0d", A, B, result);
    end
endmodule
