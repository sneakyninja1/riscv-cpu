module d_flip_flop(
    input logic clk,
    input logic D,
    output logic Q,
    input logic reset
); 
    always_ff @(posedge clk or posedge reset) begin 
        if (reset) //Reset button 
            Q <= 1'b0; 
        else
            Q <= D; 
    end 
endmodule 
   