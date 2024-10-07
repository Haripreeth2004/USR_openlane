module mux_4to1(
    input wire d_hold, //Current bit value for hold
    input wire d_shift_left,  //Input from the left neighbour
    input wire d_shift_right,  //Input from the right neighbour
    input wire d_parallel_load,   //Parallel input data bit
    input wire [1:0] select,   //Control signals S1,S0
    output reg q   //Output bit after operation
);

always @(*)begin
  case (select)
        2'b00: q = d_hold;
        2'b01: q = d_shift_right;
        2'b10: q = d_shift_left;
        2'b11: q = d_parallel_load;
    default: q = d_hold;
  endcase
end
endmodule