module tb_alu;
    logic [7:0] A;
    logic [7:0] B;
    logic operation;
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
        
        // Test Case 1: A = 3, B = 5, operation = 0 (Addition)
        A = 8'd3; 
        B = 8'd5; 
        operation = 1'b0; 
        #10; 
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);

        //Test Case 2: A = 3, B = 5, operation = 1 (AND)
        A = 8'd3;
        B = 8'd5; 
        operation = 1'b1;
        #10;
        $display("A=%d B=%d operation=%b result=%d", A, B, operation, result);
    end
endmodule
