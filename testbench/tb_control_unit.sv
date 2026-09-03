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


endmodule
