module miniALU(a, b, op, result);
input [3:0] a, b;
input op;
output reg [19:0] result;

always_comb begin
if (op == 1'b0) begin
result = a + b;
end else begin
result = a << b;
end
end



endmodule