module UAR_behav_8bit (
    input wire [7:0] d_in,    // 8-bit parallel data input
    input wire clk,           // Clock signal
    input wire [1:0] select,  // Control signals S1, S0
    output reg [7:0] q        // 8-bit register output
);

always @(posedge clk) begin
    case (select)
        2'b00: q <= q;                       // Hold: Keep the current value
        2'b01: q <= {1'b0, q[7:1]};          // Shift Right: Insert 0 from the left
        2'b10: q <= {q[6:0], 1'b0};          // Shift Left: Insert 0 from the right
        2'b11: q <= d_in;                    // Parallel Load: Load new data
        default: q <= q;                     // Default to hold
    endcase
end

initial begin
    $dumpfile("dump_1 .vcd");  // Generate the VCD file
    $dumpvars(0, UAR_behav_8bit);  // Dump all variables in the top-level module
end

endmodule