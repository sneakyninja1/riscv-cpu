module cpu(
    input logic clk, 
    input logic reset
); 
    logic [31:0] pc_address; 
    program_counter pc_inst(
        .clk(clk),
        .reset(reset),
        .pc_out(pc_address)
    ); 
    
    logic [31:0] instruction; 
    instruction_memory imem_inst(
        .current_address(pc_address),
        .instruction_found(instruction)
    ); 
    
    logic [6:0] funct7;
    logic [4:0] rs2; 
    logic [4:0] rs1; 
    logic [2:0] funct3;  
    logic [4:0] rd; 
    logic [6:0] opcode; 

    instruction_decoder instr_decod(
        .instruction(instruction), 
        .funct7(funct7), 
        .rs2(rs2), 
        .rs1(rs1), 
        .funct3(funct3), 
        .rd(rd), 
        .opcode(opcode)
    ); 
    logic [31:0] extended_imm; 
    assign extended_imm = {{20{imm[11]}}, imm};

    logic [2:0] alu_op; 
    logic reg_write_enable; 
    control_unit ctrl_unt(
        .opcode(opcode), 
        .funct3(funct3), 
        .funct7(funct7), 
        .alu_op(alu_op), 
        .reg_write_enable(reg_write_enable)
    ); 

    logic [31:0] data_1; 
    logic [31:0] data_2; 
    logic [31:0] result; 
    register_file reg_file(
        .clk(clk), 
        .reset(reset), 
        .read_addr_1(rs1), 
        .read_addr_2(rs2), 
        .write_addr(rd), 
        .write_enable(reg_write_enable), 
        .write_data(result), 
        .data_1(data_1), 
        .data_2(data_2)
    ); 
    
    alu alu_file(
        .A(data_1), 
        .B(data_2), 
        .operation(alu_op), 
        .result(result)
    ); 
endmodule 
