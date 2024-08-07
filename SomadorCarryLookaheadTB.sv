`timescale 1ns/1ns

module SomadorCarryLookaheadTB;

	reg [3:0] A, B;
	reg Cin;
	wire [4:0] S;

	SomadorCarryLookahead somador(
		.A(A),
		.B(B),
		.Cin(Cin),
		.S(S)
	);

	initial
		begin
			#10;
			A = 4'b0010;
			B = 4'b1000;
			Cin = 1'b0;
			#10;
			A = 4'b0110;
			B = 4'b1010;
			Cin = 1'b0;
			#10;
			A = 4'b1010;
			B = 4'b0110;
			Cin = 1'b1;
			#10;
			A = 4'b1111;
			B = 4'b1111;
			Cin = 1'b1;
			#10;
		end
endmodule 