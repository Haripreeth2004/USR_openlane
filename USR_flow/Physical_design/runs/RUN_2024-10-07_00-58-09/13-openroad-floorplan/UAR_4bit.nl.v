module UAR_4bit (clk,
    d_in,
    q,
    select);
 input clk;
 input [3:0] d_in;
 output [3:0] q;
 input [1:0] select;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire \bit0.d_left ;
 wire \bit0.mux.d_hold ;
 wire \bit1.d_left ;
 wire \bit2.d_left ;

 sky130_fd_sc_hd__inv_2 _09_ (.A(select[0]),
    .Y(_04_));
 sky130_fd_sc_hd__nor2_2 _10_ (.A(select[1]),
    .B(select[0]),
    .Y(_05_));
 sky130_fd_sc_hd__mux2_1 _11_ (.A0(\bit1.d_left ),
    .A1(d_in[3]),
    .S(select[1]),
    .X(_06_));
 sky130_fd_sc_hd__a22o_2 _12_ (.A1(\bit2.d_left ),
    .A2(_05_),
    .B1(_06_),
    .B2(select[0]),
    .X(_00_));
 sky130_fd_sc_hd__and3_2 _13_ (.A(select[1]),
    .B(select[0]),
    .C(d_in[0]),
    .X(_07_));
 sky130_fd_sc_hd__mux2_1 _14_ (.A0(\bit0.mux.d_hold ),
    .A1(\bit0.d_left ),
    .S(select[1]),
    .X(_08_));
 sky130_fd_sc_hd__a21o_2 _15_ (.A1(_04_),
    .A2(_08_),
    .B1(_07_),
    .X(_01_));
 sky130_fd_sc_hd__mux4_2 _16_ (.A0(\bit0.d_left ),
    .A1(\bit1.d_left ),
    .A2(\bit0.mux.d_hold ),
    .A3(d_in[1]),
    .S0(select[1]),
    .S1(select[0]),
    .X(_02_));
 sky130_fd_sc_hd__mux4_2 _17_ (.A0(\bit1.d_left ),
    .A1(\bit2.d_left ),
    .A2(\bit0.d_left ),
    .A3(d_in[2]),
    .S0(select[1]),
    .S1(select[0]),
    .X(_03_));
 sky130_fd_sc_hd__dfxtp_2 _18_ (.CLK(clk),
    .D(_00_),
    .Q(\bit2.d_left ));
 sky130_fd_sc_hd__dfxtp_2 _19_ (.CLK(clk),
    .D(_01_),
    .Q(\bit0.mux.d_hold ));
 sky130_fd_sc_hd__dfxtp_2 _20_ (.CLK(clk),
    .D(_02_),
    .Q(\bit0.d_left ));
 sky130_fd_sc_hd__dfxtp_2 _21_ (.CLK(clk),
    .D(_03_),
    .Q(\bit1.d_left ));
 sky130_fd_sc_hd__buf_2 _22_ (.A(\bit0.mux.d_hold ),
    .X(q[0]));
 sky130_fd_sc_hd__buf_2 _23_ (.A(\bit0.d_left ),
    .X(q[1]));
 sky130_fd_sc_hd__buf_2 _24_ (.A(\bit1.d_left ),
    .X(q[2]));
 sky130_fd_sc_hd__buf_2 _25_ (.A(\bit2.d_left ),
    .X(q[3]));
endmodule
