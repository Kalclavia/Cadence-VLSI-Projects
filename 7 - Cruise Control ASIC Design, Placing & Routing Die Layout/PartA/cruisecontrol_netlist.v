/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12-SP1
// Date      : Thu Oct 24 13:20:18 2024
/////////////////////////////////////////////////////////////


module cruisecontrol_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module cruisecontrol_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module cruisecontrol ( clk, reset, throttle, set, accel, coast, cancel, resume, 
        brake, speed, cruisespeed, cruisectrl );
  output [7:0] speed;
  output [7:0] cruisespeed;
  input clk, reset, throttle, set, accel, coast, cancel, resume, brake;
  output cruisectrl;
  wire   n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, N49, N62, N64, N66, N114, N116, N117,
         N118, N119, N120, N121, N132, N133, N134, N135, N136, N137, N138,
         N139, N149, N150, N151, N152, N153, N154, N155, N156, N175, N176, n2,
         n3, n4, n5, n6, n7, n8, n9, n18, n19, n21, n22, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n36, n39, n40, n41, n42, n44, n45, n46,
         n49, n50, n51, n53, n54, n56, n58, n59, n61, n62, n63, n64, n65, n68,
         n69, n70, n71, n72, n73, n76, n77, n78, n79, n81, n82, n84, n86, n87,
         n89, n91, n92, n94, n96, n97, n99, n100, n101, n102, n104, n105, n107,
         n111, n112, n113, n114, n115, n116, n119, n120, n121, n122, n123,
         n124, n125, n128, n129, n131, n132, n133, n134, n137, n138, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n157, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n188, n194, n196, n198, n200, n201, n203, n205, n207, n209, n211,
         n213, n215, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304;
  wire   [2:0] state;

  DFFPOSX1 \cruisespeed_reg[0]  ( .D(n179), .CLK(clk), .Q(n319) );
  DFFPOSX1 \cruisespeed_reg[7]  ( .D(n178), .CLK(clk), .Q(n312) );
  DFFPOSX1 \cruisespeed_reg[6]  ( .D(n177), .CLK(clk), .Q(n313) );
  DFFPOSX1 \speed_reg[1]  ( .D(n176), .CLK(clk), .Q(n311) );
  DFFPOSX1 \state_reg[2]  ( .D(n175), .CLK(clk), .Q(state[2]) );
  DFFPOSX1 \speed_reg[7]  ( .D(n174), .CLK(clk), .Q(n305) );
  DFFPOSX1 \speed_reg[6]  ( .D(n173), .CLK(clk), .Q(n306) );
  DFFPOSX1 \speed_reg[5]  ( .D(n172), .CLK(clk), .Q(n307) );
  DFFPOSX1 \speed_reg[4]  ( .D(n171), .CLK(clk), .Q(n308) );
  DFFPOSX1 \state_reg[0]  ( .D(n170), .CLK(clk), .Q(state[0]) );
  DFFPOSX1 \state_reg[1]  ( .D(n169), .CLK(clk), .Q(state[1]) );
  DFFPOSX1 \speed_reg[3]  ( .D(n168), .CLK(clk), .Q(n309) );
  DFFPOSX1 \speed_reg[2]  ( .D(n167), .CLK(clk), .Q(n310) );
  DFFPOSX1 \speed_reg[0]  ( .D(n166), .CLK(clk), .Q(N114) );
  DFFPOSX1 cruisectrl_reg ( .D(n165), .CLK(clk), .Q(n320) );
  DFFPOSX1 \cruisespeed_reg[3]  ( .D(n164), .CLK(clk), .Q(n316) );
  DFFPOSX1 \cruisespeed_reg[2]  ( .D(n163), .CLK(clk), .Q(n317) );
  DFFPOSX1 \cruisespeed_reg[4]  ( .D(n162), .CLK(clk), .Q(n315) );
  DFFPOSX1 \cruisespeed_reg[5]  ( .D(n161), .CLK(clk), .Q(n314) );
  DFFPOSX1 \cruisespeed_reg[1]  ( .D(n160), .CLK(clk), .Q(n318) );
  NAND2X1 U3 ( .A(n18), .B(n19), .Y(n160) );
  AOI22X1 U4 ( .A(n311), .B(n280), .C(N150), .D(n21), .Y(n19) );
  AOI22X1 U5 ( .A(N133), .B(n22), .C(n318), .D(n281), .Y(n18) );
  NAND2X1 U6 ( .A(n24), .B(n25), .Y(n161) );
  AOI22X1 U7 ( .A(n307), .B(n280), .C(N154), .D(n21), .Y(n25) );
  AOI22X1 U8 ( .A(N137), .B(n22), .C(n314), .D(n281), .Y(n24) );
  NAND2X1 U9 ( .A(n26), .B(n27), .Y(n162) );
  AOI22X1 U10 ( .A(n308), .B(n280), .C(N153), .D(n21), .Y(n27) );
  AOI22X1 U11 ( .A(N136), .B(n22), .C(cruisespeed[4]), .D(n281), .Y(n26) );
  NAND2X1 U12 ( .A(n28), .B(n29), .Y(n163) );
  AOI22X1 U13 ( .A(n310), .B(n280), .C(N151), .D(n21), .Y(n29) );
  AOI22X1 U14 ( .A(N134), .B(n22), .C(cruisespeed[2]), .D(n281), .Y(n28) );
  NAND2X1 U15 ( .A(n30), .B(n31), .Y(n164) );
  AOI22X1 U16 ( .A(n309), .B(n280), .C(N152), .D(n21), .Y(n31) );
  AOI22X1 U17 ( .A(N135), .B(n22), .C(n316), .D(n281), .Y(n30) );
  NOR2X1 U18 ( .A(reset), .B(n32), .Y(n165) );
  AOI22X1 U19 ( .A(n33), .B(n304), .C(cruisectrl), .D(n291), .Y(n32) );
  OAI21X1 U21 ( .A(n292), .B(n302), .C(n39), .Y(n33) );
  NAND3X1 U22 ( .A(n40), .B(state[0]), .C(n41), .Y(n39) );
  OAI21X1 U23 ( .A(n42), .B(n201), .C(n44), .Y(n166) );
  NAND2X1 U24 ( .A(n45), .B(n46), .Y(n44) );
  OAI21X1 U25 ( .A(n283), .B(N114), .C(n49), .Y(n46) );
  AOI22X1 U29 ( .A(n9), .B(n50), .C(N114), .D(n51), .Y(n49) );
  OAI21X1 U31 ( .A(n203), .B(n42), .C(n53), .Y(n167) );
  NAND2X1 U32 ( .A(n45), .B(n54), .Y(n53) );
  OAI21X1 U33 ( .A(n283), .B(n218), .C(n56), .Y(n54) );
  AOI22X1 U34 ( .A(n7), .B(n50), .C(N116), .D(n51), .Y(n56) );
  OAI21X1 U37 ( .A(n205), .B(n42), .C(n58), .Y(n168) );
  NAND2X1 U38 ( .A(n45), .B(n59), .Y(n58) );
  OAI21X1 U39 ( .A(n283), .B(n297), .C(n61), .Y(n59) );
  AOI22X1 U40 ( .A(n6), .B(n50), .C(N117), .D(n51), .Y(n61) );
  OAI21X1 U43 ( .A(n304), .B(n62), .C(n63), .Y(n169) );
  OAI21X1 U44 ( .A(n64), .B(n65), .C(n279), .Y(n63) );
  OAI22X1 U45 ( .A(n292), .B(n299), .C(n68), .D(n69), .Y(n65) );
  NAND3X1 U48 ( .A(n71), .B(n72), .C(n73), .Y(n64) );
  OAI21X1 U49 ( .A(n40), .B(n286), .C(n300), .Y(n73) );
  NOR2X1 U50 ( .A(reset), .B(n76), .Y(n170) );
  AOI22X1 U51 ( .A(n77), .B(n62), .C(n70), .D(state[0]), .Y(n76) );
  NAND3X1 U52 ( .A(n302), .B(n286), .C(n78), .Y(n62) );
  NOR2X1 U53 ( .A(state[0]), .B(reset), .Y(n78) );
  OAI21X1 U54 ( .A(brake), .B(n68), .C(n79), .Y(n77) );
  OAI21X1 U55 ( .A(n207), .B(n42), .C(n81), .Y(n171) );
  NAND2X1 U56 ( .A(n45), .B(n82), .Y(n81) );
  OAI21X1 U57 ( .A(n283), .B(n221), .C(n84), .Y(n82) );
  AOI22X1 U58 ( .A(n5), .B(n50), .C(N118), .D(n51), .Y(n84) );
  OAI21X1 U60 ( .A(n209), .B(n42), .C(n86), .Y(n172) );
  NAND2X1 U61 ( .A(n45), .B(n87), .Y(n86) );
  OAI21X1 U62 ( .A(n283), .B(n298), .C(n89), .Y(n87) );
  AOI22X1 U63 ( .A(n4), .B(n50), .C(N119), .D(n51), .Y(n89) );
  OAI21X1 U65 ( .A(n42), .B(n211), .C(n91), .Y(n173) );
  NAND2X1 U66 ( .A(n45), .B(n92), .Y(n91) );
  OAI21X1 U67 ( .A(n283), .B(n186), .C(n94), .Y(n92) );
  AOI22X1 U68 ( .A(n3), .B(n50), .C(N120), .D(n51), .Y(n94) );
  OAI21X1 U71 ( .A(n42), .B(n213), .C(n96), .Y(n174) );
  NAND2X1 U72 ( .A(n45), .B(n97), .Y(n96) );
  OAI21X1 U73 ( .A(n283), .B(n180), .C(n99), .Y(n97) );
  AOI22X1 U74 ( .A(n2), .B(n50), .C(N121), .D(n51), .Y(n99) );
  AND2X1 U77 ( .A(n100), .B(n279), .Y(n175) );
  OAI21X1 U78 ( .A(n101), .B(n68), .C(n102), .Y(n100) );
  OAI21X1 U79 ( .A(n215), .B(n42), .C(n104), .Y(n176) );
  NAND2X1 U80 ( .A(n45), .B(n105), .Y(n104) );
  OAI21X1 U81 ( .A(n283), .B(n296), .C(n107), .Y(n105) );
  AOI22X1 U82 ( .A(n8), .B(n50), .C(n215), .D(n51), .Y(n107) );
  OAI21X1 U83 ( .A(n287), .B(n68), .C(n79), .Y(n50) );
  AOI21X1 U84 ( .A(n303), .B(n41), .C(n284), .Y(n79) );
  OAI21X1 U86 ( .A(n112), .B(n41), .C(n304), .Y(n111) );
  NOR2X1 U87 ( .A(state[0]), .B(n113), .Y(n112) );
  OAI21X1 U89 ( .A(n115), .B(n116), .C(n69), .Y(n114) );
  OAI21X1 U90 ( .A(throttle), .B(n295), .C(n290), .Y(n116) );
  OAI21X1 U94 ( .A(n41), .B(n120), .C(n121), .Y(n119) );
  NOR2X1 U95 ( .A(n122), .B(n123), .Y(n121) );
  XNOR2X1 U96 ( .A(state[1]), .B(state[0]), .Y(n120) );
  AND2X1 U97 ( .A(n42), .B(n279), .Y(n45) );
  NAND3X1 U99 ( .A(n200), .B(n282), .C(n128), .Y(n125) );
  AOI22X1 U100 ( .A(n129), .B(n303), .C(N176), .D(n285), .Y(n128) );
  OAI21X1 U103 ( .A(state[2]), .B(n304), .C(n131), .Y(n129) );
  AOI21X1 U104 ( .A(N176), .B(n70), .C(n41), .Y(n131) );
  NOR2X1 U105 ( .A(n286), .B(state[2]), .Y(n41) );
  NOR2X1 U106 ( .A(n302), .B(state[1]), .Y(n70) );
  OAI21X1 U108 ( .A(state[0]), .B(n102), .C(n132), .Y(n51) );
  NAND3X1 U109 ( .A(n71), .B(n133), .C(n134), .Y(n124) );
  NOR2X1 U110 ( .A(n300), .B(n123), .Y(n134) );
  NOR2X1 U111 ( .A(n295), .B(n72), .Y(n123) );
  NAND3X1 U112 ( .A(n301), .B(n286), .C(n288), .Y(n72) );
  OAI21X1 U115 ( .A(n137), .B(n138), .C(n293), .Y(n133) );
  NAND2X1 U117 ( .A(n113), .B(n304), .Y(n102) );
  NOR2X1 U118 ( .A(n302), .B(resume), .Y(n113) );
  NAND3X1 U119 ( .A(n201), .B(n215), .C(n140), .Y(n138) );
  NOR2X1 U120 ( .A(n309), .B(speed[2]), .Y(n140) );
  NAND3X1 U122 ( .A(n207), .B(n209), .C(n141), .Y(n137) );
  NOR2X1 U123 ( .A(speed[7]), .B(n306), .Y(n141) );
  NAND3X1 U126 ( .A(n288), .B(n301), .C(throttle), .Y(n71) );
  NAND2X1 U128 ( .A(n142), .B(n143), .Y(n177) );
  AOI22X1 U129 ( .A(n306), .B(n280), .C(N155), .D(n21), .Y(n143) );
  AOI22X1 U130 ( .A(N138), .B(n22), .C(n313), .D(n281), .Y(n142) );
  NAND2X1 U131 ( .A(n144), .B(n145), .Y(n178) );
  AOI22X1 U132 ( .A(n305), .B(n280), .C(N156), .D(n21), .Y(n145) );
  AOI22X1 U133 ( .A(N139), .B(n22), .C(cruisespeed[7]), .D(n281), .Y(n144) );
  NAND2X1 U134 ( .A(n146), .B(n147), .Y(n179) );
  AOI22X1 U135 ( .A(N114), .B(n280), .C(N149), .D(n21), .Y(n147) );
  NOR2X1 U136 ( .A(n148), .B(n149), .Y(n21) );
  OAI21X1 U138 ( .A(n300), .B(n36), .C(n151), .Y(n150) );
  NOR2X1 U139 ( .A(reset), .B(n281), .Y(n151) );
  OAI21X1 U140 ( .A(n68), .B(n152), .C(n132), .Y(n36) );
  AOI22X1 U141 ( .A(N132), .B(n22), .C(n319), .D(n281), .Y(n146) );
  NAND3X1 U143 ( .A(n154), .B(n132), .C(n282), .Y(n153) );
  OAI21X1 U145 ( .A(n68), .B(n289), .C(n157), .Y(n155) );
  NOR2X1 U146 ( .A(reset), .B(n122), .Y(n157) );
  AOI21X1 U147 ( .A(n152), .B(n148), .C(n68), .Y(n122) );
  NAND2X1 U148 ( .A(coast), .B(n288), .Y(n148) );
  NAND2X1 U150 ( .A(n101), .B(n289), .Y(n115) );
  NAND2X1 U151 ( .A(cancel), .B(n294), .Y(n152) );
  NAND2X1 U154 ( .A(brake), .B(n301), .Y(n132) );
  NAND3X1 U155 ( .A(n300), .B(n40), .C(throttle), .Y(n154) );
  AND2X1 U156 ( .A(set), .B(N49), .Y(n40) );
  NAND3X1 U158 ( .A(n304), .B(n302), .C(state[0]), .Y(n159) );
  NOR2X1 U160 ( .A(n69), .B(n149), .Y(n22) );
  NAND2X1 U161 ( .A(n301), .B(n279), .Y(n149) );
  NAND3X1 U164 ( .A(state[0]), .B(n302), .C(state[1]), .Y(n68) );
  NAND2X1 U166 ( .A(accel), .B(n101), .Y(n69) );
  NOR2X1 U167 ( .A(cancel), .B(brake), .Y(n101) );
  OR2X2 U98 ( .A(n124), .B(n125), .Y(n42) );
  cruisecontrol_DW01_inc_0 add_118 ( .A({cruisespeed[7], n313, n314, 
        cruisespeed[4], n316, cruisespeed[2], n318, n319}), .SUM({N139, N138, 
        N137, N136, N135, N134, N133, N132}) );
  cruisecontrol_DW01_inc_1 r126 ( .A({speed[7], n306, speed[5:0]}), .SUM({n2, 
        n3, n4, n5, n6, n7, n8, n9}) );
  XNOR2X1 U168 ( .A(speed[7]), .B(n224), .Y(n180) );
  OR2X2 U169 ( .A(speed[2]), .B(speed[1]), .Y(n181) );
  OR2X2 U170 ( .A(speed[3]), .B(n181), .Y(n182) );
  OR2X2 U171 ( .A(speed[4]), .B(n182), .Y(n183) );
  OR2X2 U172 ( .A(speed[5]), .B(n183), .Y(n184) );
  OR2X2 U173 ( .A(n306), .B(n184), .Y(n185) );
  XOR2X1 U174 ( .A(n306), .B(n223), .Y(n186) );
  INVX8 U175 ( .A(n233), .Y(cruisespeed[1]) );
  INVX1 U176 ( .A(n318), .Y(n233) );
  INVX2 U177 ( .A(n320), .Y(n188) );
  INVX8 U178 ( .A(n188), .Y(cruisectrl) );
  INVX8 U179 ( .A(n235), .Y(cruisespeed[3]) );
  INVX1 U180 ( .A(n316), .Y(n235) );
  INVX8 U181 ( .A(n234), .Y(cruisespeed[5]) );
  INVX1 U182 ( .A(n314), .Y(n234) );
  INVX8 U183 ( .A(N149), .Y(cruisespeed[0]) );
  INVX1 U184 ( .A(n319), .Y(N149) );
  INVX8 U185 ( .A(n272), .Y(cruisespeed[6]) );
  INVX1 U186 ( .A(n313), .Y(n272) );
  INVX2 U187 ( .A(n312), .Y(n194) );
  INVX8 U188 ( .A(n194), .Y(cruisespeed[7]) );
  INVX2 U189 ( .A(n317), .Y(n196) );
  INVX8 U190 ( .A(n196), .Y(cruisespeed[2]) );
  OR2X2 U191 ( .A(n203), .B(cruisespeed[2]), .Y(n242) );
  INVX2 U192 ( .A(n315), .Y(n198) );
  INVX8 U193 ( .A(n198), .Y(cruisespeed[4]) );
  OR2X2 U194 ( .A(n207), .B(cruisespeed[4]), .Y(n245) );
  INVX2 U195 ( .A(n310), .Y(n203) );
  INVX2 U196 ( .A(n311), .Y(n215) );
  INVX2 U197 ( .A(n309), .Y(n205) );
  INVX2 U198 ( .A(n308), .Y(n207) );
  INVX2 U199 ( .A(n307), .Y(n209) );
  INVX2 U200 ( .A(n306), .Y(n211) );
  INVX2 U201 ( .A(n305), .Y(n213) );
  INVX2 U202 ( .A(N114), .Y(n201) );
  INVX2 U203 ( .A(n51), .Y(n200) );
  INVX2 U204 ( .A(n153), .Y(n281) );
  XNOR2X1 U205 ( .A(speed[1]), .B(speed[2]), .Y(N116) );
  XNOR2X1 U206 ( .A(n181), .B(speed[3]), .Y(N117) );
  XNOR2X1 U207 ( .A(n182), .B(speed[4]), .Y(N118) );
  XNOR2X1 U208 ( .A(n183), .B(speed[5]), .Y(N119) );
  XNOR2X1 U209 ( .A(n184), .B(n306), .Y(N120) );
  XNOR2X1 U210 ( .A(speed[7]), .B(n185), .Y(N121) );
  INVX8 U211 ( .A(n201), .Y(speed[0]) );
  INVX8 U212 ( .A(n203), .Y(speed[2]) );
  INVX8 U213 ( .A(n205), .Y(speed[3]) );
  INVX8 U214 ( .A(n207), .Y(speed[4]) );
  INVX8 U215 ( .A(n209), .Y(speed[5]) );
  INVX8 U216 ( .A(n211), .Y(speed[6]) );
  INVX8 U217 ( .A(n213), .Y(speed[7]) );
  INVX8 U218 ( .A(n215), .Y(speed[1]) );
  NAND2X1 U219 ( .A(n215), .B(n201), .Y(n217) );
  OAI21X1 U220 ( .A(n201), .B(n215), .C(n217), .Y(N62) );
  NOR2X1 U221 ( .A(n217), .B(speed[2]), .Y(n219) );
  AOI21X1 U222 ( .A(n217), .B(n310), .C(n219), .Y(n218) );
  NAND2X1 U223 ( .A(n219), .B(n205), .Y(n220) );
  OAI21X1 U224 ( .A(n219), .B(n205), .C(n220), .Y(N64) );
  NOR2X1 U225 ( .A(n220), .B(n308), .Y(n222) );
  AOI21X1 U226 ( .A(n220), .B(n308), .C(n222), .Y(n221) );
  NAND2X1 U227 ( .A(n222), .B(n209), .Y(n223) );
  OAI21X1 U228 ( .A(n222), .B(n209), .C(n223), .Y(N66) );
  NOR2X1 U229 ( .A(n306), .B(n223), .Y(n224) );
  NAND2X1 U230 ( .A(n233), .B(N149), .Y(n225) );
  OAI21X1 U231 ( .A(N149), .B(n233), .C(n225), .Y(N150) );
  NOR2X1 U232 ( .A(n225), .B(cruisespeed[2]), .Y(n227) );
  AOI21X1 U233 ( .A(n225), .B(cruisespeed[2]), .C(n227), .Y(n226) );
  NAND2X1 U234 ( .A(n227), .B(n235), .Y(n228) );
  OAI21X1 U235 ( .A(n227), .B(n235), .C(n228), .Y(N152) );
  NOR2X1 U236 ( .A(n228), .B(cruisespeed[4]), .Y(n230) );
  AOI21X1 U237 ( .A(n228), .B(cruisespeed[4]), .C(n230), .Y(n229) );
  NAND2X1 U238 ( .A(n230), .B(n234), .Y(n231) );
  OAI21X1 U239 ( .A(n230), .B(n234), .C(n231), .Y(N154) );
  XNOR2X1 U240 ( .A(n313), .B(n231), .Y(N155) );
  NOR2X1 U241 ( .A(n313), .B(n231), .Y(n232) );
  XOR2X1 U242 ( .A(cruisespeed[7]), .B(n232), .Y(N156) );
  INVX2 U243 ( .A(n229), .Y(N153) );
  INVX2 U244 ( .A(n226), .Y(N151) );
  NOR2X1 U245 ( .A(speed[7]), .B(speed[6]), .Y(n238) );
  NAND3X1 U246 ( .A(speed[3]), .B(speed[2]), .C(speed[1]), .Y(n236) );
  OAI21X1 U247 ( .A(n239), .B(speed[4]), .C(speed[5]), .Y(n237) );
  NAND2X1 U248 ( .A(n238), .B(n237), .Y(N49) );
  INVX2 U249 ( .A(n236), .Y(n239) );
  NAND2X1 U250 ( .A(cruisespeed[7]), .B(n213), .Y(n268) );
  NAND2X1 U251 ( .A(speed[5]), .B(n234), .Y(n263) );
  AND2X1 U252 ( .A(n245), .B(n263), .Y(n248) );
  NAND2X1 U253 ( .A(cruisespeed[2]), .B(n203), .Y(n254) );
  NAND2X1 U254 ( .A(n242), .B(n254), .Y(n256) );
  NAND2X1 U255 ( .A(speed[0]), .B(N149), .Y(n240) );
  OAI21X1 U256 ( .A(n215), .B(n240), .C(n318), .Y(n241) );
  OAI21X1 U257 ( .A(speed[1]), .B(n278), .C(n241), .Y(n244) );
  NAND2X1 U258 ( .A(speed[3]), .B(n235), .Y(n257) );
  AND2X1 U259 ( .A(n242), .B(n257), .Y(n243) );
  OAI21X1 U260 ( .A(n256), .B(n244), .C(n243), .Y(n246) );
  NOR2X1 U261 ( .A(n235), .B(speed[3]), .Y(n259) );
  NAND2X1 U262 ( .A(cruisespeed[4]), .B(n207), .Y(n260) );
  NAND2X1 U263 ( .A(n245), .B(n260), .Y(n262) );
  NAND3X1 U264 ( .A(n246), .B(n270), .C(n271), .Y(n247) );
  NOR2X1 U265 ( .A(n234), .B(speed[5]), .Y(n265) );
  AOI21X1 U266 ( .A(n248), .B(n247), .C(n265), .Y(n249) );
  XOR2X1 U267 ( .A(speed[6]), .B(n272), .Y(n251) );
  AOI22X1 U268 ( .A(speed[6]), .B(n272), .C(n249), .D(n251), .Y(n250) );
  NOR2X1 U269 ( .A(n213), .B(cruisespeed[7]), .Y(n269) );
  OAI21X1 U270 ( .A(n274), .B(n250), .C(n275), .Y(N175) );
  NOR2X1 U271 ( .A(N149), .B(speed[0]), .Y(n253) );
  AOI21X1 U272 ( .A(n215), .B(n253), .C(n318), .Y(n252) );
  OAI21X1 U273 ( .A(n253), .B(n215), .C(n276), .Y(n255) );
  OAI21X1 U274 ( .A(n256), .B(n255), .C(n254), .Y(n258) );
  OAI21X1 U275 ( .A(n259), .B(n258), .C(n257), .Y(n261) );
  OAI21X1 U276 ( .A(n262), .B(n261), .C(n260), .Y(n264) );
  OAI21X1 U277 ( .A(n265), .B(n264), .C(n263), .Y(n266) );
  OAI22X1 U278 ( .A(n273), .B(n266), .C(speed[6]), .D(n272), .Y(n267) );
  OAI21X1 U279 ( .A(n269), .B(n277), .C(n268), .Y(N176) );
  INVX2 U280 ( .A(n259), .Y(n270) );
  INVX2 U281 ( .A(n262), .Y(n271) );
  INVX2 U282 ( .A(n251), .Y(n273) );
  INVX2 U283 ( .A(n268), .Y(n274) );
  INVX2 U284 ( .A(n269), .Y(n275) );
  INVX2 U285 ( .A(n252), .Y(n276) );
  INVX2 U286 ( .A(n267), .Y(n277) );
  INVX2 U287 ( .A(n240), .Y(n278) );
  INVX2 U288 ( .A(reset), .Y(n279) );
  INVX2 U289 ( .A(n150), .Y(n280) );
  INVX2 U290 ( .A(n155), .Y(n282) );
  INVX2 U291 ( .A(n119), .Y(n283) );
  INVX2 U292 ( .A(n111), .Y(n284) );
  INVX2 U293 ( .A(n72), .Y(n285) );
  INVX2 U294 ( .A(throttle), .Y(n286) );
  INVX2 U295 ( .A(n114), .Y(n287) );
  INVX2 U296 ( .A(n115), .Y(n288) );
  INVX2 U297 ( .A(accel), .Y(n289) );
  INVX2 U298 ( .A(coast), .Y(n290) );
  INVX2 U299 ( .A(n36), .Y(n291) );
  INVX2 U300 ( .A(resume), .Y(n292) );
  INVX2 U301 ( .A(n102), .Y(n293) );
  INVX2 U302 ( .A(brake), .Y(n294) );
  INVX2 U303 ( .A(N175), .Y(n295) );
  INVX2 U304 ( .A(N62), .Y(n296) );
  INVX2 U305 ( .A(N64), .Y(n297) );
  INVX2 U306 ( .A(N66), .Y(n298) );
  INVX2 U307 ( .A(n70), .Y(n299) );
  INVX2 U308 ( .A(n159), .Y(n300) );
  INVX2 U309 ( .A(n68), .Y(n301) );
  INVX2 U310 ( .A(state[2]), .Y(n302) );
  INVX2 U311 ( .A(state[0]), .Y(n303) );
  INVX2 U312 ( .A(state[1]), .Y(n304) );
endmodule

