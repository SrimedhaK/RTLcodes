module fa16(a, b, ci, s, co);
parameter n=16;
input [n-1:0] a, b;
input ci;
output [n-1:0] s;
output co;
wire [n-1:0] c;
assign c[0] = ci;
genvar i;
generate
    for (i = 0; i < n-1; i = i + 1) begin: adder
        assign s[i] = a[i] ^ b[i] ^ c[i];
        assign c[i+1] = (a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i]);
    end
endgenerate
assign s[n-1] = a[n-1] ^ b[n-1] ^ c[n-1];
assign co = c[n-1];
endmodule
