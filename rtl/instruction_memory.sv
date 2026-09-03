module instruction_memory(
    input logic [31:0] current_address, 
    output logic [31:0] instruction_found
); 
    logic [31:0] instr_mem [0:255]; 
    assign instruction_found = instr_mem[current_address[9:2]]; 
    initial begin 
        $readmemh("program.hex", instr_mem); 
    end


endmodule