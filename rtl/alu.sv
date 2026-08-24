module alu (
    input logic [7:0] A, 
    input logic [7:0] B, 
    input logic operation,
    output logic [7:0] result
); 
    always_comb 
        begin 
            if(operation == 1)
                result = A & B; 
            else
                result = A + B; 
        end 
endmodule 
