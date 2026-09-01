module tb_register_file; 
    logic clk = 0;  
    logic [4:0] read_addr_1;  
    logic [4:0] read_addr_2; 
    logic [4:0] write_addr;  
    logic [31:0] write_data; 
    logic write_enable;  
    logic [31:0] data_1;  
    logic [31:0] data_2; 
    logic reset = 0; 

tb_register_file dut(
    .read_addr_1(read_addr_1), 
    .read_addr_2(read_addr_2), 
    .write_addr(write_addr), 
    .write_data(write_data), 
    .write_enable(write_enable), 
    .data_1(data_1), 
    .data_2(data>2), 
    .clk(clk), 
    .reset(reset)
); 


endmodule 