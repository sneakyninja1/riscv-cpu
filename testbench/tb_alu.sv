module tb_alu;
    logic [7:0] A;
    logic [7:0] B;
    logic [2:0] operation;
    logic [7:0] result; 

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
        A = 8'd3; 
        B = 8'd5; 
        operation = 3'b000; 
        #10; 
        if (result == 8'd8)
            $display("Test Case 1 Passed: Add %d + %d = %d", A, B, result);
        else
            $error("Test Case 1 Failed: Add %d + %d, expected 8, got %d", A, B, result);

         //Test Case 2: A = 3, B = 5, operation = 001 (Subtraction)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b001;
        #10;
        if (result == 8'd254) // 3 - 5 = -2 in 8-bit unsigned is 254
            $display("Test Case 2 Passed: Sub %d - %d = %d", A, B, result);
        else
            $error("Test Case 2 Failed: Sub %d - %d, expected 254, got %d", A, B, result);
        
        //Test Case 3: A = 3, B = 5, operation = 010 (AND)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b010;
        #10;
        if (result == 8'd1) // 3 & 5 = 1
            $display("Test Case 3 Passed: AND %d & %d = %d", A, B, result);
        else
            $error("Test Case 3 Failed: AND %d & %d, expected 1, got %d", A, B, result);

         //Test Case 4: A = 3, B = 5, operation = 011 (OR)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b011;
        #10;
        if (result == 8'd7) // 3 | 5 = 7
            $display("Test Case 4 Passed: OR %d | %d = %d", A, B, result);
        else 
            $error("Test Case 4 Failed: OR %d | %d, expected 7, got %d", A, B, result); 

         //Test Case 5: A = 3, B = 5, operation = 100 (XOR)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b100;
        #10;
        if (result == 8'd12) // 3 ^ 5 = 12
            $display("Test Case 5 Passed: XOR %d ^ %d = %d", A, B, result); 
        else
            $error("Test Case 5 Failed: XOR %d ^ %d, expected 12, got %d", A, B, result); 

         //Test Case 6: A = 3, B = 5, operation = 101 (SLL)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b101;
        #10;
        if (result == 8'd96) // 3 << 5 = 96
            $display("Test Case 6 Passed: SLL %d << %d = %d", A, B, result);
        else
            $error("Test Case 6 Failed: SLL %d << %d, expected 96, got %d", A, B, result);

         //Test Case 7: A = 3, B = 5, operation = 110 (SRL)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b110;
        #10;
        if (result == 8'd0) // 3 >> 5 = 0
            $display("Test Case 7 Passed: SRL %d >> %d = %d", A, B, result);
        else
            $error("Test Case 7 Failed: SRL %d >> %d, expected 0, got %d", A, B, result);

         //Test Case 8: A = 5, B = 5, operation = 111 (Comparison)
        A = 8'd5;
        B = 8'd5; 
        operation = 3'b111;
        #10;
        if (result == 8'd1) // 5 == 5 = 1
            $display("Test Case 8 Passed: Comparison %d == %d = %d", A, B, result);
        else
            $error("Test Case 8 Failed: Comparison %d == %d, expected 1, got %d", A, B, result);
    end
endmodule
