module Testbench;

parameter NUM_ELEMENTS = 10;
parameter CLK_PERIOD = 10;

reg clk;
reg rst;
reg [31:0] nums [0:NUM_ELEMENTS-1];

wire [31:0] modified_nums [0:NUM_ELEMENTS]
wire [31:0] k;

RemoveDuplicates uut(
  .clk(clk),
  .rst(rst),
  .nums(nums),
  .modified_nums(modified_nums),
  .k(k)
);

always begin
  #CLK_PERIOD/2 clk = ~clk;
end

initial begin
  clk = 0;
  rst = 0;
  for (int i = 0; i < NUMS_ELEMENTS; i = i + 1) begin
    nums[i] = i;
  end

  rst = 1;
  #10 rst = 0;

  #CLK_PERIOS*2;

  rst = 1;

  #CLK_PERIOD * NUM_ELEMENTS

  $display("Original Array:");
  for (int i = 0; i < NUM_ELEMENTS; i = i + 1) begin
    $display("nums[%0d] = %d", i, nums[i]);
  end

  $display("Modified Array (Unique Elements):");
  for (int i = 0; i < k; i = i + 1) begin
    $display("modified_nums[%0d] = %d", i, modified_nums[i]);
  end

  $display("Number of Unique Elements (k): %d", k);

  $finish;
end

endmodule