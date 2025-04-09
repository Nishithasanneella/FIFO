/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_fifo(
  input  wire [7:0] ui_in,
  output wire [7:0] uo_out,
  input  wire [7:0] uio_in,
  output wire [7:0] uio_out,
  output wire [7:0] uio_oe,
  input  wire ena,
  input  wire clk,
  input  wire rst_n
);

  // Internal FIFO signals
  reg [31:0] fifo [0:15];
  reg [3:0] wr_ptr = 0;
  reg [3:0] rd_ptr = 0;
  reg [4:0] count = 0;

  wire wr_en = ui_in[0];
  wire rd_en = ui_in[1];
  wire enable = ui_in[2];
  wire [7:0] data_from_ui = ui_in[7:0];

  wire full = (count == 16);
  wire empty = (count == 0);

  assign uo_out[0] = full;
  assign uo_out[1] = empty;
  assign uo_out[7:2] = fifo[rd_ptr][5:0];

  assign uio_oe  = 8'b00000000;
  assign uio_out = 8'b00000000;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr <= 0;
      rd_ptr <= 0;
      count  <= 0;
    end else if (enable) begin
      if (wr_en && !full) begin
        fifo[wr_ptr] <= {24'b0, data_from_ui};
        wr_ptr <= wr_ptr + 1;
        count <= count + 1;
      end

      if (rd_en && !empty) begin
        rd_ptr <= rd_ptr + 1;
        count <= count - 1;
      end
    end
  end

endmodule

