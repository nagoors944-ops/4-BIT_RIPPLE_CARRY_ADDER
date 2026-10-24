`timescale 1ns / 1ps

module tb_rca_4bit;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    // Instantiate Unit Under Test (UUT)
    rca_4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Monitor outputs in the Tcl Console
        $monitor("Time=%0t | A=%b (%0d) | B=%b (%0d) | Cin=%b | Cout=%b | Sum=%b (%0d)", 
                 $time, A, A, B, B, Cin, Cout, Sum, Sum);

        // Test Case 1: Simple addition without carry
        A = 4'b0001; B = 4'b0010; Cin = 1'b0; #10;

        // Test Case 2: Addition with internal ripple carry
        A = 4'b0111; B = 4'b0001; Cin = 1'b0; #10;

        // Test Case 3: Carry propagation to output Cout
        A = 4'b1111; B = 4'b0001; Cin = 1'b0; #10;

        // Test Case 4: Both inputs at maximum with Cin = 1
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #10;

        // Test Case 5: Random inputs
        A = 4'b1010; B = 4'b0101; Cin = 1'b1; #10;

        $finish;
    end

endmodule