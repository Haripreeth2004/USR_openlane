module UAR(
    input wire d_left,     //Data from the left neighbour
    input wire d_right,    //Data from the right neighbour
    input wire d_in,       // parallel input data
    input wire clk,         // Clock signal
    input wire [1:0] select,    // COntrol signals S1,S0
    output reg q                // Output of the flipflop
);

wire d_mux_out; // Output from the multiplier

//Multiplier instance
mux_4to1 mux(
    .d_hold(q),
    .d_shift_left(d_left),
    .d_shift_right(d_right),
    .d_parallel_load(d_in),
    .select(select),
    .q(d_mux_out)
);

// D-fliflop to store the selected value
always @(posedge clk)begin
  q <= d_mux_out;
end

endmodule
