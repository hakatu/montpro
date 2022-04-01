`define TEST256
`define TEST
module tb_montprowrap;
`ifdef TEST4
parameter WID = 4;
`else
parameter WID = 256;
`endif
reg t_clk;
reg t_rst;

always begin
t_clk = 0;
#50 t_clk=1;
#50;
end
//input reg/output wire

reg [WID-1:0] a;
reg [WID-1:0] b;
reg [WID-1:0] m;
reg           start;

wire          done;
wire [WID-1:0] result;

//instant


montprowrap imontprowrap
    (
     .clk(t_clk),
     .rst(t_rst),
     
     .a(a),//input a
     .b(b),//input b
     .m(m),
     .r(result),//output result
     
     .start(start), //status report
     .done(done)
     );

//operation
`ifdef TEST4
initial begin
m = 4'd13;
t_rst = 1'b0;
a = 4'd12;
b = 4'd13;
start = 1'b0;
#200 t_rst = 1'b1;
#200 t_rst = 1'b0;
start = 1'b1;
#100;
start = 1'b0;
#5000;
a = 4'd1;
b = 4'd12;
start = 1'b1;
#100 start = 1'b0;
#5000;
a = 4'd12;
b = 4'd11;
start = 1'b1;
#100 start = 1'b0;
#5000;
a = 4'd4;
b = 4'd3;
start = 1'b1;
#100 start = 1'b0;
#5000;
a = 4'd15;
b = 4'd15;
start = 1'b1;
#100 start = 1'b0;
#5000;
$stop;
end
`else
initial begin
m = 256'd115792089210356248762697446949407573530086143415290314195533631308867097853951;
t_rst = 1'b0;
a = 256'd12;
b = 256'd13;
start = 1'b0;
#200 t_rst = 1'b1;
#200 t_rst = 1'b0;
start = 1'b1;
#100;
start = 1'b0;
#27000;
a = 256'd1;
b = 256'd12;
start = 1'b1;
#100 start = 1'b0;
#27000;
a = 256'd12;
b = 256'd11;
start = 1'b1;
#100 start = 1'b0;
#27000;
a = 256'd4;
b = 256'd3;
start = 1'b1;
#100 start = 1'b0;
#27000;
a = 256'd15;
b = 256'd15;
start = 1'b1;
#100 start = 1'b0;
#27000;
$stop;
end
`endif

initial begin
$display ("==========OUTPUT==========");
$monitor ("Output : %d ", result);
end

endmodule