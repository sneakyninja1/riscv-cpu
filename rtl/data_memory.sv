module data_memory(
    input logic [31:0] data_addr, 
    input logic [31:0] write_data, 
    input logic write_enable, 
    input logic clk, 
    output logic [31:0] data_read
); 
    logic [31:0] data_mem [0:255];
    assign data_read = data_mem[data_addr[9:2]]; 
    always_ff @(posedge clk) begin
        if(write_enable == 1)
            data_mem[data_addr[9:2]] <= write_data; 
    end
endmodule 