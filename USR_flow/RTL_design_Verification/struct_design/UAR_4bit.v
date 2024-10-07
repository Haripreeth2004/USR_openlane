module UAR_4bit(
    input wire [3:0] d_in,       // 4-bit parallel input data
    input wire clk,              // Clock signal
    input wire [1:0] select,     // Control signals S1, S0
    output wire [3:0] q          // 4-bit register Output of the flipflop
);

// No need to declare q0, q1, q2, q3 separately since they are part of q[3:0]

// Instantiate the 4 bits of the UAR

// Bit 0 (Rightmost bit, shift right input is 0)
UAR bit0 (
    .d_left(q[1]),              // Input from bit 1 (left neighbor)
    .d_right(1'b0),             // No right neighbor (shift right input is 0)
    .d_in(d_in[0]),             // Parallel load data
    .clk(clk),
    .select(select),
    .q(q[0])                    // Output of bit 0
);

// Bit 1
UAR bit1 (
    .d_left(q[2]),              // Input from bit 2 (left neighbor)
    .d_right(q[0]),             // Input from bit 0 (right neighbor)
    .d_in(d_in[1]),             // Parallel load data
    .clk(clk),
    .select(select),
    .q(q[1])                    // Output of bit 1
);

// Bit 2
UAR bit2 (
    .d_left(q[3]),              // Input from bit 3 (left neighbor)
    .d_right(q[1]),             // Input from bit 1 (right neighbor)
    .d_in(d_in[2]),             // Parallel load data
    .clk(clk),
    .select(select),
    .q(q[2])                    // Output of bit 2
);

// Bit 3 (Leftmost bit, shift left input is 0)
UAR bit3 (
    .d_left(1'b0),              // No left neighbor (shift left input is 0)
    .d_right(q[2]),             // Input from bit 2 (right neighbor)
    .d_in(d_in[3]),             // Parallel load data
    .clk(clk),
    .select(select),
    .q(q[3])                    // Output of bit 3
);

endmodule
