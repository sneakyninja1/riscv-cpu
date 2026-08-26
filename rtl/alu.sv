module alu (
    input logic [7:0] A, 
    input logic [7:0] B, 
    input logic [2:0] operation,
    output logic [7:0] result
); 
    always_comb 
        begin
            case(operation)
                3'b000: result = A + B; //ADD
                3'b001: result = A - B; //SUB
                3'b010: result = A & B; //AND
                3'b011: result = A | B; //OR
                3'b100: result = A ^ B; //XOR
                3'b101: result = A << B[2:0]; //SLL
                3'b110: result = A >> B[2:0]; //SRL
                3'b111: result = A == B; //Comparison
                default: result = 8'b00000000;
            endcase
        end 
endmodule 
