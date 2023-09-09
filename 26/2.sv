module RemoveDuplicatesOptimized(
  input wire clk,
  input wire rst,
  input wire [31:0] nums [0:31],
  output wire [31:0] modified_nums [0:31],
  output wire [31:0] k
);

reg [31:0] j;
reg [31:0] nums_i, nums_i_minus_1;
reg [31:0] unique_nums [0:31];

integer i;

always @(posedge clk or posedge rst) begin
  if (rst) begin
    j <= 32'd0;
    i <= 0;
  end else begin
    if (i == 0) begin
      nums_i <= nums[0];
      nums_i_minus_1 <= nums[0];
      unique_nums[j] <= nums_i;
      j <= j + 1;
      i <= 1;
    end else begin
      nums_i <= nums[i];
      nums_i_minus_1 <= nums[i - 1];

      if (nums_i != nums_i_minus_1) begin
        unique_nums[j] <= nums_i;
        j <= j + 1;
      end
      i <= i + 1;
    end
  end
end
endmodule