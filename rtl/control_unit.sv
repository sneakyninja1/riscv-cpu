module control_unit(
    input logic [6:0] opcode, 
    input logic [2:0] funct3, 
    input logic [6:0] funct7, 
    output logic [2:0] alu_op, 
    output logic reg_write_enable
); 
    always_comb begin
        case(opcode)
            7'b0110011: begin
                reg_write_enable = 1; 
                case(funct3)
                    3'b000: begin //Check if signal is ADD or SUB
                        if (funct7 == 7'b0000000)
                            alu_op = 3'b000; //ADD
                        else 
                            alu_op = 3'b001; //SUB
                    end
                    3'b001: alu_op = 3'b001; 
                    3'b010: alu_op = 3'b010; 
                    3'b011: alu_op = 3'b011; 
                    3'b100: alu_op = 3'b100; 
                    3'b101: alu_op = 3'b101; 
                    3'b110: alu_op = 3'b110; 
                    3'b111: alu_op = 3'b111; 
                endcase
            end  
            default: begin
                alu_op = 3'b000; 
                reg_write_enable = 0; 
            end
        endcase 
    end
endmodule