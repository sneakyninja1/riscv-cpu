module cpu(
    input logic clk, 
    input logic reset
); 

program_counter dut(); 

instruction_memory dut(); 

instruction_decoder dut(); 

control_unit dut(); 

register_file dut(); 

alu dut(); 


endmodule 