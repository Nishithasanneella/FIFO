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
  reg [5:0] fifo [0:15];
  reg [3:0] wr_ptr, rd_ptr;
  reg [5:0] data_out;
  
  wire wr_en = ui_in[0];
  wire rd_en = ui_in[1];
  wire [5:0] data_in = ui_in[7:2];

  wire full = ((wr_ptr + 4'd1) == rd_ptr);
  wire empty = (wr_ptr == rd_ptr);

  assign uo_out[0] = full;
  assign uo_out[1] = empty;
  assign uo_out[7:2] = data_out[5:0];

  assign uio_oe  = 8'b00000000;
  assign uio_out = 8'b00000000;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr <= 0;
      rd_ptr <= 0;
      data_out <= 0;
    end 
    
    else if (ena) begin
      if (wr_en && !full) begin
        fifo[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
      end

      if (rd_en && !empty) begin
        data_out <= fifo[rd_ptr];
        rd_ptr <= rd_ptr + 1;
      end
    end
  end

endmodule
