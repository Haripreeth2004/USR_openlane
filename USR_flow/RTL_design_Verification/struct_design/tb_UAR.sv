module tb_UAR;

// Inputs to DUT
reg [3:0] d_in;
reg clk;
reg [1:0] select;

// Output from DUT
wire [3:0] q;

// Instantiate the DUT (Design Under Test)
UAR_4bit dut (
    .d_in(d_in),
    .clk(clk),
    .select(select),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock period = 10 time units
end

// Test procedure
initial begin
    // Apply reset-like behavior
    d_in = 4'b0000;
    select = 2'b00;  // Hold
    #10;

    // Parallel load 4'b1010 into the register
    d_in = 4'b1010;
    select = 2'b11;  // Parallel load
    #10;

    // Test shift left
    select = 2'b10;
    #10;

    // Test shift right
    select = 2'b01;
    #10;

    // Hold the current value
    select = 2'b00;
    #10;
    // Parallel load another value 4'b1100
    d_in = 4'b1100;
    select = 2'b11;
    #10;

    // Test additional shifts and hold operations
    select = 2'b10;  // Shift left
    #10;
    select = 2'b00;  // Hold
    #10;
    select = 2'b01;  // Shift right
    #10;

    // Finish simulation
    $finish;
end

// Monitor the changes
initial begin
    $monitor("At time %t: d_in = %b, select = %b, q = %b", $time, d_in, select, q);
end

endmodule