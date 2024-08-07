module SomadorCarryLookahead(
	input [3:0] A,
	input [3:0] B,
	input Cin,
	output [4:0] S
);
	wire [4:0] carry;
	wire [3:0] gen, prop, soma;
	
	// Geracao dos carries
	assign gen[0] = A[0] & B[0];
	assign gen[1] = A[1] & B[1];
	assign gen[2] = A[2] & B[2];
	assign gen[3] = A[3] & B[3];

	// Propagacao dos carries
	assign prop[0] = A[0] | B[0];
	assign prop[1] = A[1] | B[1];
	assign prop[2] = A[2] | B[2];
	assign prop[3] = A[3] | B[3];
	
	// Estabelecendo carries
	assign carry[0] = Cin;
	assign carry[1] = gen[0] | (prop[0] & carry[0]);
	assign carry[2] = gen[1] | (prop[1] & carry[1]);
	assign carry[3] = gen[2] | (prop[2] & carry[2]);
	assign carry[4] = gen[3] | (prop[3] & carry[3]);

	// Realizando a soma
	assign soma[0] = (A[0] ^ B[0]) ^ carry[0];
	assign soma[1] = (A[1] ^ B[1]) ^ carry[1];
	assign soma[2] = (A[2] ^ B[2]) ^ carry[2];
	assign soma[3] = (A[3] ^ B[3]) ^ carry[3];

	assign S = {carry[4], soma};
endmodule
