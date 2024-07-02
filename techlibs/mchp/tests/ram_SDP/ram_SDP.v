/*
ISC License

Copyright (C) 2024 Microchip Technology Inc. and its subsidiaries

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/

module ram_SDP(data,waddr,we,clk,q);
parameter d_width = 32;
parameter addr_width = 8;
parameter mem_depth = 256;
input [d_width-1:0] data;
input [addr_width-1:0] waddr;
input we, clk;
output reg [d_width-1:0] q;

reg [d_width-1:0] mem [mem_depth-1:0];

always @(posedge clk) begin
	if (we) begin 
		mem[waddr] <= data;
	end else begin
		q <= mem[waddr];
	end
end

endmodule

