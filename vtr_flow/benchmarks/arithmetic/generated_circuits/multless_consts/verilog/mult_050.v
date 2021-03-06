/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */
/* ./multBlockGen.pl 2677 -fractionalBits 0*/
module multiplier_block (
    i_data0,
    o_data0
);

  // Port mode declarations:
  input   [31:0] i_data0;
  output  [31:0]
    o_data0;

  //Multipliers:

  wire [31:0]
    w1,
    w4,
    w5,
    w2048,
    w2047,
    w640,
    w2687,
    w10,
    w2677;

  assign w1 = i_data0;
  assign w10 = w5 << 1;
  assign w2047 = w2048 - w1;
  assign w2048 = w1 << 11;
  assign w2677 = w2687 - w10;
  assign w2687 = w2047 + w640;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;
  assign w640 = w5 << 7;

  assign o_data0 = w2677;

  //multiplier_block area estimate = 7171.71836743236;
endmodule //multiplier_block

module surround_with_regs(
	i_data0,
	o_data0,
	clk
);

	// Port mode declarations:
	input   [31:0] i_data0;
	output  [31:0] o_data0;
	reg  [31:0] o_data0;
	input clk;

	reg [31:0] i_data0_reg;
	wire [30:0] o_data0_from_mult;

	always @(posedge clk) begin
		i_data0_reg <= i_data0;
		o_data0 <= o_data0_from_mult;
	end

	multiplier_block mult_blk(
		.i_data0(i_data0_reg),
		.o_data0(o_data0_from_mult)
	);

endmodule
