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
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

         //Test Case 2: A = 3, B = 5, operation = 001 (Subtraction)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b001;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

        //Test Case 3: A = 3, B = 5, operation = 010 (AND)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b010;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

         //Test Case 4: A = 3, B = 5, operation = 011 (OR)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b011;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

         //Test Case 5: A = 3, B = 5, operation = 100 (XOR)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b100;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

         //Test Case 6: A = 3, B = 5, operation = 101 (SLL)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b101;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

         //Test Case 7: A = 3, B = 5, operation = 110 (SRL)
        A = 8'd3;
        B = 8'd5; 
        operation = 3'b110;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

         //Test Case 8: A = 5, B = 5, operation = 111 (Comparison)
        A = 8'd5;
        B = 8'd5; 
        operation = 3'b111;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);
    end
endmodule
