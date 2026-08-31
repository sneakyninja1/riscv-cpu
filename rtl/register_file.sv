module register_file(
    input logic clk, 
    input logic [4:0] read_addr_1, 
    input logic [4:0] read_addr_2,
    input logic [4:0] write_addr, 
    input logic [31:0] write_data,
    input logic write_enable, 
    output logic [31:0] data_1, 
    output logic [31:0] data_2,
    input logic reset
); 
    logic [31:0] registers [0:31]; //32 bit wide, 32 registers
    assign data_1 = (read_addr_1 == 0) ? 32'b0: registers[read_addr_1]; 
    assign data_2 = (read_addr_2 == 0) ? 32'b0: registers[read_addr_2];  

    always_ff @(posedge clk or posedge reset) begin 
        if (reset) //Reset all registers to 0 
            for (int i = 0; i < 32; i++) begin
                registers[i] <= 0; 
            end
        else if (write_enable == 1) // if control signal positive, store the data in the registers 
            registers[write_addr] <= write_data; 
    end 
endmodule 