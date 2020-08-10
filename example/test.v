module TOP (
  clk,
  datain,
  dataout
);
  input clk;
  input datain;
  output dataout;

  wire clk, datain, dataout;

  SUB sub (
    .clk(clk),
    .datain(datain),
    .dataout(dataout)
  );

endmodule

module SUB (
  clk,
  datain,
  dataout
);
  input clk;
  input datain;
  output dataout;

  wire clk, datain, dataout;

  SUBSUB sub (
    .clk(clk),
    .datain(datain),
    .dataout(dataout)
  );

endmodule

module SUBSUB (
  clk,
  datain,
  dataout
);
  input clk;
  input datain;
  output dataout;

  wire clk, datain, dataout;

  wire clkw, clkw2;
  BUF clkbuf  (.A(clk), .Y(clkw));
  BUF clkbuf2 (.A(clkw), .Y(clkw2));

  reg dinw;
//always @(posedge clkw) begin
//  dinw <= datain;
//end
  DFF_P dinf (.CLK(clkw2), .D(datain), .Q(dinw));

  INV doutinv (.A(dinw), .Y(dataout));


endmodule
// vim: sw=2 ts=2 expandtab softtabstop=2:
