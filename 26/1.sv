module RemoveDuplicates(
  input wire clk,
  input wire rst,
  input wire [31:0] nums [0:31],
  output wire [31:0] modified_nums [0:31],
  output wire [31:0] k
);

  reg [31:0] j, i;
  reg [31:0] nums_i, nums_i_minus_1;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      i <= 32'd1;
      j <= 32'd1;
    end else begin
      nums_i <= nums[i];
      nums_i_minus_1 <= nums[i-1];

      if (i < 32 && (i == 1 || nums_i != nums_i_minus_1)) begin
        modified_nums[j] <= nums_i;
        j <= j + 32'd1;
      end

      i <= i + 32'd1;
    end
  end

  assign k = j;
endmodule