module fa(a,b,cin,S,C);
input a,b,cin;
output S,C;
assign {C,S}=a+b+cin;
endmodule
