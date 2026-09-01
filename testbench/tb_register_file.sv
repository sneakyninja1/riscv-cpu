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
    int error_count = 0;

register_file dut(
    .read_addr_1(read_addr_1), 
    .read_addr_2(read_addr_2), 
    .write_addr(write_addr), 
    .write_data(write_data), 
    .write_enable(write_enable), 
    .data_1(data_1), 
    .data_2(data_2), 
    .clk(clk), 
    .reset(reset)
); 
    always #5 clk = ~clk; 
    initial begin 
        //Test Case 1, reset = 1
        reset = 1;
        #1; 
        for (int i= 0; i < 32; i++) begin
            read_addr_1 = i; 
            #1; 
            if (data_1 != 0)
                error_count+=1; 
        end
        if (error_count > 0)
            $error("Test Case 1 Failed: %0d registers are not cleared", error_count); 
        else 
            $display("Test Case 1 Passed. All registers cleared"); 

        //Test Case 2, Write to a Register and Read it Back 
        reset = 0; 
        write_enable = 1; 
        write_addr = 5'd2; 
        write_data = 32'd48;
        @(posedge clk); 
        #1;  
        read_addr_1 = write_addr; 
        #1; 
        if (data_1 != write_data)
            $error("Test Case 2 Failed: Expected 48, got %0d", data_1);  
        else
            $display("Test Case 2 Passed");
        
        //Test Case 3, Writing to 0x port
        write_addr = 0; 
        write_data = 32'd932; 
        write_enable = 1; 
        #1; 
        @(posedge clk); 
        #1; 
        read_addr_1 = write_addr; 
        #1; 
        if(data_1 == 0)
            $display("Test Case 3 Passed"); 
        else 
            $error("Test Case 3 Failed"); 
        
        //Test Case 4, Writing while control signal is off 
        write_addr = 5'd29; 
        write_data = 32'd999; 
        write_enable = 0; 
        #1; 
        @(posedge clk); 
        #1; 
        read_addr_1 = write_addr; 
        #1; 
        if (data_1 == 0)
            $display("Test Case 4 Passed.");  
        else
            $error("Test Case 4 Failed. Expected 0, got %0d", data_1);
    
        //Test Case 5 Checking 2 data ports simultaneously 
        write_addr = 5'd10; 
        write_data = 32'd77; 
        write_enable = 1; 
        #1; 
        @(posedge clk); 
        #1; 
        read_addr_2 = write_addr; 
        read_addr_1 = 5'd2; 
        #1; 
        if (data_1 == 48 && data_2 == 77)
            $display("Test Case 5 Passed"); 
        else
            $error("Test Case 5 Failed. Expected data1 to be 48 but got %0d, and data2 to be 77 but got %0d", data_1, data_2); 
    end 
endmodule 