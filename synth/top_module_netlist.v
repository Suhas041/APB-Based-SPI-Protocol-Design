/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06
// Date      : Thu May 28 22:56:33 2026
/////////////////////////////////////////////////////////////


module top_module ( pclk, preset_n, paddr, pwrite, psel, penable, pwdata, miso, 
        ss, sclk, spi_interrupt_req, mosi, pr_data, pready, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] pr_data;
  input pclk, preset_n, pwrite, psel, penable, miso;
  output ss, sclk, spi_interrupt_req, mosi, pready, pslverr;
  wire   spiswai, cpol, cpha, miso_receive_sclk, miso_receive_sclk0,
         mosi_send_sclk, send_data, lsbfe, rcv_data, mstr, \blk1/N76 ,
         \blk1/N75 , \blk1/N74 , \blk1/N73 , \blk1/N72 , \blk1/N71 ,
         \blk1/N70 , \blk1/N69 , \blk1/N68 , \blk1/N67 , \blk1/N66 ,
         \blk1/N65 , \blk3/N82 , \blk3/rcv , \blk3/N56 , \blk3/N53 ,
         \blk3/N52 , \blk3/N51 , \blk3/N50 , \blk3/N49 , \blk3/N48 ,
         \blk3/N47 , \blk3/N46 , \blk3/N45 , \blk3/N44 , \blk3/N43 ,
         \blk3/N42 , \blk3/N41 , \blk3/N40 , \blk4/SPI_state[0] , \blk4/N116 ,
         \blk4/N115 , \blk4/N114 , \blk4/N113 , \blk4/N112 , \blk4/N111 ,
         \blk4/N110 , \blk4/N109 , \blk4/spi_cr2_0 , \blk4/spi_cr1_1 ,
         \blk4/ns1[1] , n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n849, n850, n851, n852, n853, n854;
  wire   [2:0] sppr;
  wire   [2:0] spr;
  wire   [11:0] \blk1/count ;
  wire   [2:0] \blk2/count3 ;
  wire   [2:0] \blk2/count2 ;
  wire   [2:0] \blk2/count1 ;
  wire   [2:0] \blk2/count ;
  wire   [7:0] \blk2/temp_reg ;
  wire   [7:0] \blk2/shift_register ;
  wire   [15:0] \blk3/count ;
  wire   [7:0] \blk4/spi_dr ;
  wire   [7:2] \blk4/spi_cr2 ;
  wire   [7:5] \blk4/spi_cr1 ;
  wire   [1:0] \blk4/state ;

  FD2 \blk4/SPI_state_reg[0]  ( .D(1'b1), .CP(pclk), .CD(preset_n), .Q(
        \blk4/SPI_state[0] ) );
  FD2 \blk4/state_reg[1]  ( .D(\blk4/ns1[1] ), .CP(pclk), .CD(preset_n), .Q(
        \blk4/state [1]), .QN(n835) );
  FD2 \blk4/state_reg[0]  ( .D(n372), .CP(pclk), .CD(preset_n), .Q(
        \blk4/state [0]) );
  FD2 \blk4/spi_dr_reg[7]  ( .D(\blk4/N116 ), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_dr [7]), .QN(n797) );
  FD2 \blk1/count_reg[0]  ( .D(\blk1/N65 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [0]), .QN(n819) );
  FD2 \blk1/count_reg[1]  ( .D(\blk1/N66 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [1]), .QN(n796) );
  FD2 \blk1/count_reg[2]  ( .D(\blk1/N67 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [2]) );
  FD2 \blk1/count_reg[3]  ( .D(\blk1/N68 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [3]), .QN(n814) );
  FD2 \blk1/count_reg[4]  ( .D(\blk1/N69 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [4]) );
  FD2 \blk1/count_reg[5]  ( .D(\blk1/N70 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [5]), .QN(n820) );
  FD2 \blk1/count_reg[6]  ( .D(\blk1/N71 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [6]) );
  FD2 \blk1/count_reg[7]  ( .D(\blk1/N72 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [7]), .QN(n825) );
  FD2 \blk1/count_reg[8]  ( .D(\blk1/N73 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [8]), .QN(n837) );
  FD2 \blk1/count_reg[9]  ( .D(\blk1/N74 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [9]), .QN(n815) );
  FD2 \blk1/count_reg[10]  ( .D(\blk1/N75 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [10]) );
  FD2 \blk1/count_reg[11]  ( .D(\blk1/N76 ), .CP(pclk), .CD(preset_n), .Q(
        \blk1/count [11]) );
  FD2 \blk1/miso_receive_sclk0_o_reg  ( .D(n370), .CP(pclk), .CD(preset_n), 
        .Q(miso_receive_sclk0) );
  FD2 \blk1/mosi_send_sclk0_o_reg  ( .D(n368), .CP(pclk), .CD(preset_n), .QN(
        n827) );
  FD2 \blk1/miso_receive_sclk_o_reg  ( .D(n369), .CP(pclk), .CD(preset_n), .Q(
        miso_receive_sclk) );
  FD2 \blk1/mosi_send_sclk_o_reg  ( .D(n367), .CP(pclk), .CD(preset_n), .Q(
        mosi_send_sclk) );
  FD2 \blk2/count_reg[0]  ( .D(n356), .CP(pclk), .CD(preset_n), .Q(
        \blk2/count [0]), .QN(n840) );
  FD2 \blk2/count_reg[1]  ( .D(n355), .CP(pclk), .CD(preset_n), .Q(
        \blk2/count [1]), .QN(n831) );
  FD2 \blk2/count_reg[2]  ( .D(n360), .CP(pclk), .CD(preset_n), .Q(
        \blk2/count [2]), .QN(n824) );
  FD2 \blk2/count2_reg[0]  ( .D(n359), .CP(pclk), .CD(preset_n), .Q(
        \blk2/count2 [0]), .QN(n822) );
  FD2 \blk2/count2_reg[1]  ( .D(n358), .CP(pclk), .CD(preset_n), .Q(
        \blk2/count2 [1]), .QN(n803) );
  FD2 \blk2/count2_reg[2]  ( .D(n357), .CP(pclk), .CD(preset_n), .Q(
        \blk2/count2 [2]), .QN(n838) );
  FD2 \blk2/temp_reg_reg[0]  ( .D(n354), .CP(pclk), .CD(preset_n), .Q(
        \blk2/temp_reg [0]) );
  FD2 \blk2/temp_reg_reg[7]  ( .D(n353), .CP(pclk), .CD(preset_n), .Q(
        \blk2/temp_reg [7]), .QN(n807) );
  FD2 \blk2/temp_reg_reg[6]  ( .D(n352), .CP(pclk), .CD(n375), .Q(
        \blk2/temp_reg [6]), .QN(n828) );
  FD2 \blk2/temp_reg_reg[5]  ( .D(n351), .CP(pclk), .CD(n375), .Q(
        \blk2/temp_reg [5]), .QN(n808) );
  FD2 \blk2/temp_reg_reg[4]  ( .D(n350), .CP(pclk), .CD(n375), .Q(
        \blk2/temp_reg [4]), .QN(n809) );
  FD2 \blk2/temp_reg_reg[3]  ( .D(n349), .CP(pclk), .CD(n375), .Q(
        \blk2/temp_reg [3]), .QN(n829) );
  FD2 \blk2/temp_reg_reg[2]  ( .D(n348), .CP(pclk), .CD(n375), .Q(
        \blk2/temp_reg [2]), .QN(n830) );
  FD2 \blk2/temp_reg_reg[1]  ( .D(n347), .CP(pclk), .CD(n375), .Q(
        \blk2/temp_reg [1]) );
  FD2 \blk3/rcv_reg  ( .D(\blk3/N82 ), .CP(pclk), .CD(n375), .Q(\blk3/rcv ) );
  FD2 \blk3/receive_data_reg  ( .D(\blk3/rcv ), .CP(pclk), .CD(n375), .Q(
        rcv_data), .QN(n836) );
  FD2 \blk4/spi_dr_reg[0]  ( .D(\blk4/N109 ), .CP(pclk), .CD(n375), .Q(
        \blk4/spi_dr [0]), .QN(n805) );
  FD2 \blk4/spi_dr_reg[1]  ( .D(\blk4/N110 ), .CP(pclk), .CD(n375), .Q(
        \blk4/spi_dr [1]), .QN(n799) );
  FD2 \blk4/spi_dr_reg[2]  ( .D(\blk4/N111 ), .CP(pclk), .CD(n375), .Q(
        \blk4/spi_dr [2]), .QN(n804) );
  FD2 \blk4/spi_dr_reg[3]  ( .D(\blk4/N112 ), .CP(pclk), .CD(n375), .Q(
        \blk4/spi_dr [3]), .QN(n795) );
  FD2 \blk4/spi_dr_reg[4]  ( .D(\blk4/N113 ), .CP(pclk), .CD(n375), .Q(
        \blk4/spi_dr [4]), .QN(n801) );
  FD2 \blk4/spi_dr_reg[5]  ( .D(\blk4/N114 ), .CP(pclk), .CD(n375), .Q(
        \blk4/spi_dr [5]), .QN(n798) );
  FD2 \blk4/spi_dr_reg[6]  ( .D(\blk4/N115 ), .CP(pclk), .CD(n375), .Q(
        \blk4/spi_dr [6]), .QN(n794) );
  FD2 \blk4/mosi_data_o_reg[6]  ( .D(n346), .CP(pclk), .CD(n375), .QN(n844) );
  FD2 \blk4/mosi_data_o_reg[5]  ( .D(n345), .CP(pclk), .CD(n375), .QN(n845) );
  FD2 \blk4/mosi_data_o_reg[4]  ( .D(n344), .CP(pclk), .CD(n375), .QN(n846) );
  FD2 \blk4/mosi_data_o_reg[3]  ( .D(n343), .CP(pclk), .CD(n375), .QN(n847) );
  FD2 \blk4/mosi_data_o_reg[2]  ( .D(n342), .CP(pclk), .CD(n375), .QN(n848) );
  FD2 \blk4/mosi_data_o_reg[1]  ( .D(n341), .CP(pclk), .CD(n375), .QN(n849) );
  FD2 \blk4/mosi_data_o_reg[0]  ( .D(n340), .CP(pclk), .CD(n375), .QN(n850) );
  FD2 \blk4/mosi_data_o_reg[7]  ( .D(n339), .CP(pclk), .CD(n375), .QN(n851) );
  FD2 \blk2/mosi_o_reg  ( .D(n338), .CP(pclk), .CD(preset_n), .Q(mosi), .QN(
        n854) );
  FD2 \blk4/spi_br_reg[1]  ( .D(n334), .CP(pclk), .CD(preset_n), .Q(spr[1]), 
        .QN(n802) );
  FD2 \blk4/spi_br_reg[2]  ( .D(n333), .CP(pclk), .CD(preset_n), .Q(spr[2]), 
        .QN(n817) );
  FD2 \blk4/spi_br_reg[4]  ( .D(n332), .CP(pclk), .CD(preset_n), .Q(sppr[0]), 
        .QN(n818) );
  FD2 \blk4/spi_br_reg[5]  ( .D(n331), .CP(pclk), .CD(preset_n), .Q(sppr[1])
         );
  FD2 \blk4/spi_br_reg[6]  ( .D(n330), .CP(pclk), .CD(preset_n), .Q(sppr[2]), 
        .QN(n833) );
  FD2 \blk4/spi_br_reg[0]  ( .D(n329), .CP(pclk), .CD(preset_n), .Q(spr[0]), 
        .QN(n834) );
  FD2 \blk4/spi_cr2_reg[1]  ( .D(n328), .CP(pclk), .CD(preset_n), .Q(spiswai)
         );
  FD2 \blk4/spi_cr2_reg[3]  ( .D(n327), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_cr2 [3]) );
  FD2 \blk4/spi_cr2_reg[4]  ( .D(n326), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_cr2 [4]) );
  FD2 \blk4/spi_cr2_reg[0]  ( .D(n325), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_cr2_0 ) );
  FD2 \blk4/spi_cr1_reg[1]  ( .D(n324), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_cr1_1 ), .QN(n842) );
  FD2 \blk4/spi_cr1_reg[3]  ( .D(n323), .CP(pclk), .CD(preset_n), .Q(cpol), 
        .QN(n810) );
  FD2 \blk4/spi_cr1_reg[4]  ( .D(n322), .CP(pclk), .CD(preset_n), .Q(mstr) );
  FD2 \blk4/spi_cr1_reg[5]  ( .D(n321), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_cr1 [5]), .QN(n811) );
  FD2 \blk4/spi_cr1_reg[6]  ( .D(n320), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_cr1 [6]) );
  FD2 \blk4/spi_cr1_reg[7]  ( .D(n319), .CP(pclk), .CD(preset_n), .Q(
        \blk4/spi_cr1 [7]), .QN(n843) );
  FD2 \blk4/spi_cr1_reg[0]  ( .D(n318), .CP(pclk), .CD(preset_n), .Q(lsbfe), 
        .QN(n793) );
  FD2 \blk4/send_data_o_reg  ( .D(n317), .CP(pclk), .CD(preset_n), .Q(
        send_data), .QN(n812) );
  FD2 \blk2/shift_register_reg[6]  ( .D(n316), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [6]) );
  FD2 \blk2/shift_register_reg[5]  ( .D(n315), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [5]) );
  FD2 \blk2/shift_register_reg[4]  ( .D(n314), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [4]) );
  FD2 \blk2/shift_register_reg[3]  ( .D(n313), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [3]) );
  FD2 \blk2/shift_register_reg[2]  ( .D(n312), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [2]) );
  FD2 \blk2/shift_register_reg[1]  ( .D(n311), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [1]) );
  FD2 \blk2/shift_register_reg[0]  ( .D(n310), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [0]) );
  FD2 \blk2/shift_register_reg[7]  ( .D(n309), .CP(pclk), .CD(preset_n), .Q(
        \blk2/shift_register [7]) );
  FD4 \blk4/spi_cr1_reg[2]  ( .D(n308), .CP(pclk), .SD(preset_n), .Q(cpha), 
        .QN(n852) );
  FD4 \blk3/ss_reg  ( .D(\blk3/N56 ), .CP(pclk), .SD(preset_n), .Q(ss), .QN(
        n800) );
  FD4 \blk2/count1_reg[0]  ( .D(n362), .CP(pclk), .SD(preset_n), .Q(
        \blk2/count1 [0]), .QN(n832) );
  FD4 \blk2/count1_reg[1]  ( .D(n361), .CP(pclk), .SD(preset_n), .Q(
        \blk2/count1 [1]), .QN(n841) );
  FD4 \blk2/count1_reg[2]  ( .D(n366), .CP(pclk), .SD(preset_n), .Q(
        \blk2/count1 [2]), .QN(n816) );
  FD4 \blk2/count3_reg[0]  ( .D(n365), .CP(pclk), .SD(preset_n), .Q(
        \blk2/count3 [0]), .QN(n823) );
  FD4 \blk2/count3_reg[1]  ( .D(n364), .CP(pclk), .SD(preset_n), .Q(
        \blk2/count3 [1]), .QN(n839) );
  FD4 \blk2/count3_reg[2]  ( .D(n363), .CP(pclk), .SD(preset_n), .Q(
        \blk2/count3 [2]), .QN(n806) );
  FD4 \blk3/count_reg[0]  ( .D(\blk3/N40 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [0]) );
  FD4 \blk3/count_reg[1]  ( .D(\blk3/N41 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [1]) );
  FD4 \blk3/count_reg[2]  ( .D(\blk3/N42 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [2]) );
  FD4 \blk3/count_reg[3]  ( .D(\blk3/N43 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [3]) );
  FD4 \blk3/count_reg[4]  ( .D(\blk3/N44 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [4]) );
  FD4 \blk3/count_reg[5]  ( .D(\blk3/N45 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [5]), .QN(n821) );
  FD4 \blk3/count_reg[6]  ( .D(\blk3/N46 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [6]) );
  FD4 \blk3/count_reg[7]  ( .D(\blk3/N47 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [7]) );
  FD4 \blk3/count_reg[8]  ( .D(\blk3/N48 ), .CP(pclk), .SD(preset_n), .QN(n813) );
  FD4 \blk3/count_reg[9]  ( .D(\blk3/N49 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [9]) );
  FD4 \blk3/count_reg[10]  ( .D(\blk3/N50 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [10]) );
  FD4 \blk3/count_reg[11]  ( .D(\blk3/N51 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [11]) );
  FD4 \blk3/count_reg[12]  ( .D(\blk3/N52 ), .CP(pclk), .SD(preset_n), .Q(
        \blk3/count [12]), .QN(n826) );
  FD4 \blk3/count_reg[13]  ( .D(\blk3/N53 ), .CP(pclk), .SD(n375), .Q(
        \blk3/count [13]) );
  FD4 \blk3/count_reg[14]  ( .D(1'b0), .CP(pclk), .SD(preset_n), .QN(n853) );
  FD3 \blk1/sclk_reg  ( .D(n371), .CP(pclk), .CD(n336), .SD(n337), .Q(sclk) );
  IVDA U432 ( .A(preset_n), .Y(n374), .Z(n375) );
  ND3 U433 ( .A(n670), .B(n669), .C(n671), .Z(n673) );
  NR2 U434 ( .A(\blk4/state [0]), .B(n835), .Z(pready) );
  ND2 U435 ( .A(sppr[1]), .B(sppr[0]), .Z(n377) );
  NR2 U436 ( .A(n833), .B(n377), .Z(n395) );
  ND2 U437 ( .A(spr[2]), .B(spr[0]), .Z(n376) );
  NR2 U438 ( .A(spr[1]), .B(n376), .Z(n386) );
  NR2 U439 ( .A(spr[0]), .B(n802), .Z(n385) );
  ND2 U440 ( .A(spr[2]), .B(n385), .Z(n671) );
  AO6 U441 ( .A(n833), .B(n377), .C(n395), .Z(n401) );
  IVP U442 ( .A(n401), .Z(n430) );
  NR2 U443 ( .A(n834), .B(n802), .Z(n381) );
  ND2 U444 ( .A(spr[2]), .B(n381), .Z(n669) );
  AO7 U445 ( .A(sppr[1]), .B(sppr[0]), .C(n377), .Z(n399) );
  AO4 U446 ( .A(n671), .B(n430), .C(n669), .D(n399), .Z(n378) );
  AO6 U447 ( .A(n395), .B(n386), .C(n378), .Z(n668) );
  NR2 U448 ( .A(n671), .B(n399), .Z(n380) );
  ND2 U449 ( .A(n834), .B(n802), .Z(n394) );
  NR2 U450 ( .A(n817), .B(n394), .Z(n384) );
  IVP U451 ( .A(n384), .Z(n393) );
  IVP U452 ( .A(n395), .Z(n431) );
  AO4 U453 ( .A(sppr[0]), .B(n669), .C(n393), .D(n431), .Z(n379) );
  AO1P U454 ( .A(n386), .B(n401), .C(n380), .D(n379), .Z(n664) );
  ND2 U455 ( .A(n817), .B(n381), .Z(n389) );
  IVP U456 ( .A(n389), .Z(n396) );
  AO2 U457 ( .A(n395), .B(n396), .C(n401), .D(n384), .Z(n383) );
  IVP U458 ( .A(n399), .Z(n405) );
  ND2 U459 ( .A(n386), .B(n405), .Z(n382) );
  AO3 U460 ( .A(sppr[0]), .B(n671), .C(n383), .D(n382), .Z(n657) );
  ND2 U461 ( .A(n405), .B(n384), .Z(n388) );
  ND2 U462 ( .A(n385), .B(n817), .Z(n403) );
  IVP U463 ( .A(n403), .Z(n390) );
  AO2 U464 ( .A(n818), .B(n386), .C(n390), .D(n395), .Z(n387) );
  AO3 U465 ( .A(n389), .B(n430), .C(n388), .D(n387), .Z(n437) );
  IVP U466 ( .A(n437), .Z(n655) );
  AN3 U467 ( .A(n817), .B(n802), .C(spr[0]), .Z(n404) );
  AO2 U468 ( .A(n395), .B(n404), .C(n401), .D(n390), .Z(n392) );
  ND2 U469 ( .A(n405), .B(n396), .Z(n391) );
  AO3 U470 ( .A(sppr[0]), .B(n393), .C(n392), .D(n391), .Z(n643) );
  ND2 U471 ( .A(n401), .B(n404), .Z(n398) );
  NR2 U472 ( .A(n394), .B(spr[2]), .Z(n406) );
  AO2 U473 ( .A(n818), .B(n396), .C(n406), .D(n395), .Z(n397) );
  AO3 U474 ( .A(n403), .B(n399), .C(n398), .D(n397), .Z(n400) );
  IVP U475 ( .A(n400), .Z(n633) );
  AO2 U476 ( .A(n401), .B(n406), .C(n405), .D(n404), .Z(n402) );
  AO7 U477 ( .A(sppr[0]), .B(n403), .C(n402), .Z(n640) );
  AO2 U478 ( .A(n406), .B(n405), .C(n404), .D(n818), .Z(n650) );
  ND2 U479 ( .A(n406), .B(n818), .Z(n442) );
  ND2 U480 ( .A(n650), .B(n442), .Z(n412) );
  NR2 U481 ( .A(n640), .B(n412), .Z(n419) );
  ND2 U482 ( .A(n633), .B(n419), .Z(n418) );
  NR2 U483 ( .A(n643), .B(n418), .Z(n438) );
  ND2 U484 ( .A(n655), .B(n438), .Z(n425) );
  NR2 U485 ( .A(n657), .B(n425), .Z(n456) );
  ND2 U486 ( .A(n664), .B(n456), .Z(n429) );
  EN U487 ( .A(n668), .B(n429), .Z(n459) );
  ND2 U488 ( .A(n459), .B(\blk3/count [12]), .Z(n491) );
  EO U489 ( .A(n664), .B(n456), .Z(n407) );
  OR2P U490 ( .A(\blk3/count [11]), .B(n407), .Z(n498) );
  ND2 U491 ( .A(\blk3/count [11]), .B(n407), .Z(n510) );
  IVP U492 ( .A(n438), .Z(n409) );
  EN U493 ( .A(n655), .B(n409), .Z(n496) );
  ND2 U494 ( .A(\blk3/count [9]), .B(n496), .Z(n424) );
  ND2 U495 ( .A(n643), .B(n418), .Z(n408) );
  ND2 U496 ( .A(n409), .B(n408), .Z(n420) );
  ND2 U497 ( .A(n813), .B(n420), .Z(n497) );
  EO U498 ( .A(n640), .B(n412), .Z(n447) );
  AN2P U499 ( .A(n447), .B(\blk3/count [6]), .Z(n494) );
  NR2 U500 ( .A(n447), .B(\blk3/count [6]), .Z(n413) );
  IVP U501 ( .A(n442), .Z(n443) );
  NR2 U502 ( .A(n443), .B(\blk3/count [4]), .Z(n410) );
  NR2 U503 ( .A(n413), .B(n410), .Z(n501) );
  ND2 U504 ( .A(\blk3/count [0]), .B(\blk3/count [1]), .Z(n517) );
  IVP U505 ( .A(n517), .Z(n520) );
  ND2 U506 ( .A(n520), .B(\blk3/count [2]), .Z(n519) );
  IVP U507 ( .A(n519), .Z(n523) );
  ND2 U508 ( .A(n523), .B(\blk3/count [3]), .Z(n522) );
  ND2 U509 ( .A(n443), .B(\blk3/count [4]), .Z(n504) );
  ND2 U510 ( .A(n522), .B(n504), .Z(n415) );
  IVP U511 ( .A(n650), .Z(n641) );
  ND2 U512 ( .A(n443), .B(n641), .Z(n411) );
  ND2 U513 ( .A(n412), .B(n411), .Z(n444) );
  NR2 U514 ( .A(n444), .B(n821), .Z(n509) );
  IVP U515 ( .A(n413), .Z(n414) );
  AO2 U516 ( .A(n501), .B(n415), .C(n509), .D(n414), .Z(n416) );
  IVP U517 ( .A(n444), .Z(n445) );
  NR2 U518 ( .A(n445), .B(\blk3/count [5]), .Z(n493) );
  NR2 U519 ( .A(n416), .B(n493), .Z(n417) );
  NR2 U520 ( .A(n494), .B(n417), .Z(n421) );
  IVP U521 ( .A(n418), .Z(n441) );
  NR2 U522 ( .A(n633), .B(n419), .Z(n635) );
  NR2 U523 ( .A(n441), .B(n635), .Z(n453) );
  NR2 U524 ( .A(n453), .B(\blk3/count [7]), .Z(n490) );
  OR2P U525 ( .A(n813), .B(n420), .Z(n505) );
  ND2 U526 ( .A(n453), .B(\blk3/count [7]), .Z(n488) );
  AO3 U527 ( .A(n421), .B(n490), .C(n505), .D(n488), .Z(n422) );
  AO3 U528 ( .A(\blk3/count [9]), .B(n496), .C(n497), .D(n422), .Z(n423) );
  ND2 U529 ( .A(n424), .B(n423), .Z(n426) );
  EO U530 ( .A(n657), .B(n425), .Z(n512) );
  AO5 U531 ( .A(\blk3/count [10]), .B(n426), .C(n512), .Z(n427) );
  ND2 U532 ( .A(n510), .B(n427), .Z(n428) );
  ND2 U533 ( .A(n498), .B(n428), .Z(n433) );
  NR2 U534 ( .A(n459), .B(\blk3/count [12]), .Z(n495) );
  IVP U535 ( .A(n668), .Z(n666) );
  NR2 U536 ( .A(n666), .B(n429), .Z(n432) );
  AO4 U537 ( .A(n671), .B(n431), .C(n430), .D(n669), .Z(n665) );
  EN U538 ( .A(n432), .B(n665), .Z(n464) );
  NR2 U539 ( .A(n464), .B(\blk3/count [13]), .Z(n508) );
  AO1P U540 ( .A(n491), .B(n433), .C(n495), .D(n508), .Z(n435) );
  ND2 U541 ( .A(\blk3/count [13]), .B(n464), .Z(n434) );
  ND2 U542 ( .A(n853), .B(n434), .Z(n516) );
  NR2 U543 ( .A(n435), .B(n516), .Z(n546) );
  ND2 U544 ( .A(spiswai), .B(\blk4/SPI_state[0] ), .Z(n502) );
  AO3 U545 ( .A(send_data), .B(n546), .C(mstr), .D(n502), .Z(\blk3/N56 ) );
  NR2 U546 ( .A(n819), .B(n796), .Z(n473) );
  ND2 U547 ( .A(\blk1/count [2]), .B(n473), .Z(n475) );
  NR2 U548 ( .A(n814), .B(n475), .Z(n474) );
  ND2 U549 ( .A(\blk1/count [4]), .B(n474), .Z(n476) );
  ND2 U550 ( .A(n502), .B(n800), .Z(n629) );
  EO1 U551 ( .A(n664), .B(\blk1/count [7]), .C(\blk1/count [7]), .D(n664), .Z(
        n662) );
  IVP U552 ( .A(n643), .Z(n436) );
  EO1 U553 ( .A(n436), .B(\blk1/count [4]), .C(\blk1/count [4]), .D(n436), .Z(
        n639) );
  AO2 U554 ( .A(n655), .B(\blk1/count [5]), .C(n820), .D(n437), .Z(n647) );
  EO U555 ( .A(n438), .B(n647), .Z(n440) );
  ND2 U556 ( .A(n441), .B(n639), .Z(n439) );
  AO3 U557 ( .A(n441), .B(n639), .C(n440), .D(n439), .Z(n450) );
  AO2 U558 ( .A(n443), .B(n819), .C(\blk1/count [0]), .D(n442), .Z(n644) );
  AO2 U559 ( .A(n445), .B(n796), .C(\blk1/count [1]), .D(n444), .Z(n449) );
  NR2 U560 ( .A(\blk1/count [11]), .B(\blk1/count [10]), .Z(n645) );
  ND2 U561 ( .A(n447), .B(\blk1/count [2]), .Z(n446) );
  AO3 U562 ( .A(n447), .B(\blk1/count [2]), .C(n645), .D(n446), .Z(n448) );
  NR4 U563 ( .A(n450), .B(n644), .C(n449), .D(n448), .Z(n452) );
  ND2 U564 ( .A(n453), .B(\blk1/count [3]), .Z(n451) );
  AO3 U565 ( .A(n453), .B(\blk1/count [3]), .C(n452), .D(n451), .Z(n455) );
  NR2 U566 ( .A(n456), .B(n662), .Z(n454) );
  AO1P U567 ( .A(n456), .B(n662), .C(n455), .D(n454), .Z(n458) );
  ND2 U568 ( .A(n459), .B(\blk1/count [8]), .Z(n457) );
  AO3 U569 ( .A(n459), .B(\blk1/count [8]), .C(n458), .D(n457), .Z(n461) );
  NR2 U570 ( .A(n512), .B(\blk1/count [6]), .Z(n460) );
  AO1P U571 ( .A(n512), .B(\blk1/count [6]), .C(n461), .D(n460), .Z(n463) );
  ND2 U572 ( .A(n464), .B(\blk1/count [9]), .Z(n462) );
  AO3 U573 ( .A(n464), .B(\blk1/count [9]), .C(n463), .D(n462), .Z(n631) );
  IVP U574 ( .A(n631), .Z(n465) );
  NR2 U575 ( .A(n629), .B(n465), .Z(n471) );
  AO3 U576 ( .A(\blk1/count [4]), .B(n474), .C(n476), .D(n471), .Z(n466) );
  IVP U577 ( .A(n466), .Z(\blk1/N69 ) );
  ND4 U578 ( .A(mstr), .B(\blk4/spi_cr2 [4]), .C(n842), .D(n800), .Z(n568) );
  IVP U579 ( .A(n568), .Z(n469) );
  NR4 U580 ( .A(\blk4/spi_dr [0]), .B(\blk4/spi_dr [1]), .C(\blk4/spi_dr [2]), 
        .D(\blk4/spi_dr [7]), .Z(n468) );
  NR4 U581 ( .A(\blk4/spi_dr [3]), .B(\blk4/spi_dr [5]), .C(\blk4/spi_dr [6]), 
        .D(\blk4/spi_dr [4]), .Z(n467) );
  ND2 U582 ( .A(n468), .B(n467), .Z(n590) );
  NR2 U583 ( .A(n469), .B(n590), .Z(n470) );
  AO4 U584 ( .A(n843), .B(n470), .C(n811), .D(n590), .Z(spi_interrupt_req) );
  AN4P U585 ( .A(\blk4/state [0]), .B(penable), .C(psel), .D(n835), .Z(
        \blk4/ns1[1] ) );
  IVP U586 ( .A(n471), .Z(n486) );
  NR2 U587 ( .A(\blk1/count [0]), .B(n486), .Z(\blk1/N65 ) );
  AO1P U588 ( .A(n819), .B(n796), .C(n473), .D(n486), .Z(\blk1/N66 ) );
  NR2 U589 ( .A(\blk1/count [2]), .B(n473), .Z(n472) );
  AO1P U590 ( .A(\blk1/count [2]), .B(n473), .C(n486), .D(n472), .Z(\blk1/N67 ) );
  AO1P U591 ( .A(n814), .B(n475), .C(n474), .D(n486), .Z(\blk1/N68 ) );
  NR2 U592 ( .A(n820), .B(n476), .Z(n478) );
  AO1P U593 ( .A(n820), .B(n476), .C(n478), .D(n486), .Z(\blk1/N70 ) );
  NR2 U594 ( .A(\blk1/count [6]), .B(n478), .Z(n477) );
  AO1P U595 ( .A(\blk1/count [6]), .B(n478), .C(n486), .D(n477), .Z(\blk1/N71 ) );
  ND2 U596 ( .A(\blk1/count [6]), .B(n478), .Z(n479) );
  NR2 U597 ( .A(n825), .B(n479), .Z(n481) );
  AO1P U598 ( .A(n825), .B(n479), .C(n481), .D(n486), .Z(\blk1/N72 ) );
  NR2 U599 ( .A(\blk1/count [8]), .B(n481), .Z(n480) );
  AO1P U600 ( .A(\blk1/count [8]), .B(n481), .C(n486), .D(n480), .Z(\blk1/N73 ) );
  ND2 U601 ( .A(\blk1/count [8]), .B(n481), .Z(n482) );
  NR2 U602 ( .A(n815), .B(n482), .Z(n484) );
  AO1P U603 ( .A(n815), .B(n482), .C(n484), .D(n486), .Z(\blk1/N74 ) );
  NR2 U604 ( .A(\blk1/count [10]), .B(n484), .Z(n483) );
  AO1P U605 ( .A(\blk1/count [10]), .B(n484), .C(n486), .D(n483), .Z(
        \blk1/N75 ) );
  AN2P U606 ( .A(\blk1/count [10]), .B(n484), .Z(n487) );
  NR2 U607 ( .A(\blk1/count [11]), .B(n487), .Z(n485) );
  AO1P U608 ( .A(\blk1/count [11]), .B(n487), .C(n486), .D(n485), .Z(
        \blk1/N76 ) );
  IVP U609 ( .A(n488), .Z(n489) );
  AO1P U610 ( .A(\blk3/count [10]), .B(n512), .C(n490), .D(n489), .Z(n492) );
  AO3 U611 ( .A(\blk3/count [9]), .B(n496), .C(n492), .D(n491), .Z(n515) );
  NR2 U612 ( .A(n494), .B(n493), .Z(n500) );
  AO6 U613 ( .A(n496), .B(\blk3/count [9]), .C(n495), .Z(n499) );
  ND4 U614 ( .A(n500), .B(n499), .C(n498), .D(n497), .Z(n514) );
  IVP U615 ( .A(n501), .Z(n507) );
  IVP U616 ( .A(n522), .Z(n525) );
  ND2 U617 ( .A(mstr), .B(n502), .Z(n503) );
  NR2 U618 ( .A(send_data), .B(n503), .Z(n545) );
  ND4 U619 ( .A(n525), .B(n545), .C(n505), .D(n504), .Z(n506) );
  NR4 U620 ( .A(n509), .B(n508), .C(n507), .D(n506), .Z(n511) );
  AO3 U621 ( .A(n512), .B(\blk3/count [10]), .C(n511), .D(n510), .Z(n513) );
  NR4 U622 ( .A(n516), .B(n515), .C(n514), .D(n513), .Z(\blk3/N82 ) );
  IVP U623 ( .A(\blk3/N56 ), .Z(n544) );
  AO7 U624 ( .A(send_data), .B(\blk3/count [0]), .C(n544), .Z(\blk3/N40 ) );
  AO3 U625 ( .A(\blk3/count [0]), .B(\blk3/count [1]), .C(n812), .D(n517), .Z(
        n518) );
  ND2 U626 ( .A(n544), .B(n518), .Z(\blk3/N41 ) );
  AO3 U627 ( .A(n520), .B(\blk3/count [2]), .C(n812), .D(n519), .Z(n521) );
  ND2 U628 ( .A(n544), .B(n521), .Z(\blk3/N42 ) );
  AO3 U629 ( .A(n523), .B(\blk3/count [3]), .C(n812), .D(n522), .Z(n524) );
  ND2 U630 ( .A(n544), .B(n524), .Z(\blk3/N43 ) );
  ND2 U631 ( .A(n525), .B(\blk3/count [4]), .Z(n527) );
  AO3 U632 ( .A(n525), .B(\blk3/count [4]), .C(n812), .D(n527), .Z(n526) );
  ND2 U633 ( .A(n544), .B(n526), .Z(\blk3/N44 ) );
  NR2 U634 ( .A(n821), .B(n527), .Z(n529) );
  AO1P U635 ( .A(n821), .B(n527), .C(send_data), .D(n529), .Z(n528) );
  OR2P U636 ( .A(\blk3/N56 ), .B(n528), .Z(\blk3/N45 ) );
  ND2 U637 ( .A(\blk3/count [6]), .B(n529), .Z(n531) );
  AO3 U638 ( .A(\blk3/count [6]), .B(n529), .C(n812), .D(n531), .Z(n530) );
  ND2 U639 ( .A(n544), .B(n530), .Z(\blk3/N46 ) );
  IVP U640 ( .A(n531), .Z(n532) );
  ND2 U641 ( .A(\blk3/count [7]), .B(n532), .Z(n534) );
  AO3 U642 ( .A(\blk3/count [7]), .B(n532), .C(n812), .D(n534), .Z(n533) );
  ND2 U643 ( .A(n544), .B(n533), .Z(\blk3/N47 ) );
  NR2 U644 ( .A(n813), .B(n534), .Z(n536) );
  AO1P U645 ( .A(n813), .B(n534), .C(send_data), .D(n536), .Z(n535) );
  OR2P U646 ( .A(\blk3/N56 ), .B(n535), .Z(\blk3/N48 ) );
  ND2 U647 ( .A(\blk3/count [9]), .B(n536), .Z(n538) );
  AO3 U648 ( .A(\blk3/count [9]), .B(n536), .C(n812), .D(n538), .Z(n537) );
  ND2 U649 ( .A(n544), .B(n537), .Z(\blk3/N49 ) );
  IVP U650 ( .A(n538), .Z(n539) );
  ND2 U651 ( .A(\blk3/count [10]), .B(n539), .Z(n541) );
  AO3 U652 ( .A(\blk3/count [10]), .B(n539), .C(n812), .D(n541), .Z(n540) );
  ND2 U653 ( .A(n544), .B(n540), .Z(\blk3/N50 ) );
  IVP U654 ( .A(n541), .Z(n542) );
  ND2 U655 ( .A(\blk3/count [11]), .B(n542), .Z(n547) );
  AO3 U656 ( .A(\blk3/count [11]), .B(n542), .C(n812), .D(n547), .Z(n543) );
  ND2 U657 ( .A(n544), .B(n543), .Z(\blk3/N51 ) );
  NR2 U658 ( .A(n826), .B(n547), .Z(n548) );
  ND2 U659 ( .A(n546), .B(n545), .Z(n550) );
  AO1P U660 ( .A(n826), .B(n547), .C(n548), .D(n550), .Z(\blk3/N52 ) );
  NR2 U661 ( .A(\blk3/count [13]), .B(n548), .Z(n549) );
  NR2 U662 ( .A(n550), .B(n549), .Z(\blk3/N53 ) );
  IVP U664 ( .A(paddr[1]), .Z(n552) );
  IVP U665 ( .A(paddr[2]), .Z(n564) );
  IVP U666 ( .A(paddr[0]), .Z(n566) );
  ND2 U667 ( .A(n564), .B(n566), .Z(n551) );
  NR2 U668 ( .A(n552), .B(n551), .Z(n774) );
  NR2 U669 ( .A(n551), .B(paddr[1]), .Z(n779) );
  AO2 U670 ( .A(spr[0]), .B(n774), .C(lsbfe), .D(n779), .Z(n556) );
  ND2 U671 ( .A(n552), .B(paddr[0]), .Z(n553) );
  NR2 U672 ( .A(n564), .B(n553), .Z(n605) );
  NR2 U673 ( .A(paddr[2]), .B(n553), .Z(n777) );
  AO2 U674 ( .A(\blk4/spi_dr [0]), .B(n605), .C(n777), .D(\blk4/spi_cr2_0 ), 
        .Z(n555) );
  IVP U675 ( .A(pwrite), .Z(n554) );
  ND2 U676 ( .A(pready), .B(n554), .Z(n581) );
  AO6 U677 ( .A(n556), .B(n555), .C(n581), .Z(pr_data[0]) );
  AO2 U678 ( .A(spr[1]), .B(n774), .C(\blk4/spi_cr1_1 ), .D(n779), .Z(n558) );
  AO2 U679 ( .A(spiswai), .B(n777), .C(\blk4/spi_dr [1]), .D(n605), .Z(n557)
         );
  AO6 U680 ( .A(n558), .B(n557), .C(n581), .Z(pr_data[1]) );
  AO2 U681 ( .A(cpha), .B(n779), .C(\blk4/spi_dr [2]), .D(n605), .Z(n560) );
  ND2 U682 ( .A(n774), .B(spr[2]), .Z(n559) );
  AO6 U683 ( .A(n560), .B(n559), .C(n581), .Z(pr_data[2]) );
  AO2 U684 ( .A(\blk4/spi_dr [3]), .B(n605), .C(n777), .D(\blk4/spi_cr2 [3]), 
        .Z(n562) );
  ND2 U685 ( .A(n779), .B(cpol), .Z(n561) );
  AO6 U686 ( .A(n562), .B(n561), .C(n581), .Z(pr_data[3]) );
  AO2 U687 ( .A(mstr), .B(n779), .C(sppr[0]), .D(n774), .Z(n563) );
  IVP U688 ( .A(n563), .Z(n570) );
  IVP U689 ( .A(n605), .Z(n604) );
  ND2 U690 ( .A(paddr[1]), .B(n564), .Z(n565) );
  NR2 U691 ( .A(n566), .B(n565), .Z(n576) );
  ND2 U692 ( .A(preset_n), .B(n576), .Z(n567) );
  AO4 U693 ( .A(n801), .B(n604), .C(n568), .D(n567), .Z(n569) );
  AO1P U694 ( .A(\blk4/spi_cr2 [4]), .B(n777), .C(n570), .D(n569), .Z(n571) );
  NR2 U695 ( .A(n571), .B(n581), .Z(pr_data[4]) );
  ND2 U696 ( .A(preset_n), .B(n590), .Z(n577) );
  AO2 U697 ( .A(\blk4/spi_dr [5]), .B(n605), .C(n576), .D(n577), .Z(n573) );
  AO2 U698 ( .A(sppr[1]), .B(n774), .C(n779), .D(\blk4/spi_cr1 [5]), .Z(n572)
         );
  AO6 U699 ( .A(n573), .B(n572), .C(n581), .Z(pr_data[5]) );
  AO2 U700 ( .A(\blk4/spi_dr [6]), .B(n605), .C(n779), .D(\blk4/spi_cr1 [6]), 
        .Z(n575) );
  ND2 U701 ( .A(n774), .B(sppr[2]), .Z(n574) );
  AO6 U702 ( .A(n575), .B(n574), .C(n581), .Z(pr_data[6]) );
  IVP U703 ( .A(n576), .Z(n578) );
  AO4 U704 ( .A(n797), .B(n604), .C(n578), .D(n577), .Z(n579) );
  AO6 U705 ( .A(\blk4/spi_cr1 [7]), .B(n779), .C(n579), .Z(n580) );
  NR2 U706 ( .A(n581), .B(n580), .Z(pr_data[7]) );
  ND2 U707 ( .A(pready), .B(pwrite), .Z(n787) );
  IVP U708 ( .A(pwdata[5]), .Z(n783) );
  AO2 U709 ( .A(\blk4/spi_dr [5]), .B(pwdata[5]), .C(n783), .D(n798), .Z(n585)
         );
  IVP U710 ( .A(pwdata[3]), .Z(n781) );
  AO2 U711 ( .A(\blk4/spi_dr [3]), .B(pwdata[3]), .C(n781), .D(n795), .Z(n584)
         );
  IVP U712 ( .A(pwdata[6]), .Z(n784) );
  AO2 U713 ( .A(\blk4/spi_dr [6]), .B(pwdata[6]), .C(n784), .D(n794), .Z(n583)
         );
  IVP U714 ( .A(pwdata[4]), .Z(n782) );
  AO2 U715 ( .A(\blk4/spi_dr [4]), .B(pwdata[4]), .C(n782), .D(n801), .Z(n582)
         );
  NR4 U716 ( .A(n585), .B(n584), .C(n583), .D(n582), .Z(n603) );
  AO2 U717 ( .A(\blk2/temp_reg [1]), .B(n799), .C(\blk2/temp_reg [0]), .D(n805), .Z(n589) );
  AO2 U718 ( .A(\blk2/temp_reg [3]), .B(n795), .C(\blk2/temp_reg [2]), .D(n804), .Z(n588) );
  AO2 U719 ( .A(\blk2/temp_reg [6]), .B(n794), .C(\blk2/temp_reg [5]), .D(n798), .Z(n587) );
  AO2 U720 ( .A(\blk2/temp_reg [4]), .B(n801), .C(\blk2/temp_reg [7]), .D(n797), .Z(n586) );
  ND4 U721 ( .A(n589), .B(n588), .C(n587), .D(n586), .Z(n591) );
  AO2 U722 ( .A(rcv_data), .B(n591), .C(n590), .D(n836), .Z(n599) );
  AO4 U723 ( .A(\blk2/temp_reg [1]), .B(n799), .C(\blk2/temp_reg [3]), .D(n795), .Z(n595) );
  AO4 U724 ( .A(\blk2/temp_reg [0]), .B(n805), .C(\blk2/temp_reg [6]), .D(n794), .Z(n594) );
  AO4 U725 ( .A(\blk2/temp_reg [7]), .B(n797), .C(\blk2/temp_reg [4]), .D(n801), .Z(n593) );
  AO4 U726 ( .A(\blk2/temp_reg [2]), .B(n804), .C(\blk2/temp_reg [5]), .D(n798), .Z(n592) );
  NR4 U727 ( .A(n595), .B(n594), .C(n593), .D(n592), .Z(n598) );
  IVP U728 ( .A(pwdata[1]), .Z(n780) );
  AO2 U729 ( .A(\blk4/spi_dr [1]), .B(pwdata[1]), .C(n780), .D(n799), .Z(n597)
         );
  IVP U730 ( .A(pwdata[7]), .Z(n785) );
  AO2 U731 ( .A(\blk4/spi_dr [7]), .B(pwdata[7]), .C(n785), .D(n797), .Z(n596)
         );
  AO1P U732 ( .A(n599), .B(n598), .C(n597), .D(n596), .Z(n602) );
  IVP U733 ( .A(pwdata[2]), .Z(n791) );
  AO2 U734 ( .A(\blk4/spi_dr [2]), .B(n791), .C(pwdata[2]), .D(n804), .Z(n601)
         );
  IVP U735 ( .A(pwdata[0]), .Z(n786) );
  AO2 U736 ( .A(\blk4/spi_dr [0]), .B(n786), .C(pwdata[0]), .D(n805), .Z(n600)
         );
  ND4 U737 ( .A(n603), .B(n602), .C(n601), .D(n600), .Z(n788) );
  ND2 U738 ( .A(n787), .B(n788), .Z(n606) );
  NR2 U739 ( .A(n836), .B(n606), .Z(n622) );
  NR2 U740 ( .A(n787), .B(n604), .Z(n621) );
  AO2 U741 ( .A(\blk2/temp_reg [0]), .B(n622), .C(pwdata[0]), .D(n621), .Z(
        n608) );
  AO4 U742 ( .A(rcv_data), .B(n606), .C(n605), .D(n787), .Z(n623) );
  ND2 U743 ( .A(\blk4/spi_dr [0]), .B(n623), .Z(n607) );
  ND2 U744 ( .A(n608), .B(n607), .Z(\blk4/N109 ) );
  AO2 U745 ( .A(\blk2/temp_reg [1]), .B(n622), .C(pwdata[1]), .D(n621), .Z(
        n610) );
  ND2 U746 ( .A(\blk4/spi_dr [1]), .B(n623), .Z(n609) );
  ND2 U747 ( .A(n610), .B(n609), .Z(\blk4/N110 ) );
  AO2 U748 ( .A(\blk2/temp_reg [2]), .B(n622), .C(pwdata[2]), .D(n621), .Z(
        n612) );
  ND2 U749 ( .A(\blk4/spi_dr [2]), .B(n623), .Z(n611) );
  ND2 U750 ( .A(n612), .B(n611), .Z(\blk4/N111 ) );
  AO2 U751 ( .A(\blk2/temp_reg [3]), .B(n622), .C(pwdata[3]), .D(n621), .Z(
        n614) );
  ND2 U752 ( .A(\blk4/spi_dr [3]), .B(n623), .Z(n613) );
  ND2 U753 ( .A(n614), .B(n613), .Z(\blk4/N112 ) );
  AO2 U754 ( .A(\blk2/temp_reg [4]), .B(n622), .C(pwdata[4]), .D(n621), .Z(
        n616) );
  ND2 U755 ( .A(\blk4/spi_dr [4]), .B(n623), .Z(n615) );
  ND2 U756 ( .A(n616), .B(n615), .Z(\blk4/N113 ) );
  AO2 U757 ( .A(\blk2/temp_reg [5]), .B(n622), .C(pwdata[5]), .D(n621), .Z(
        n618) );
  ND2 U758 ( .A(\blk4/spi_dr [5]), .B(n623), .Z(n617) );
  ND2 U759 ( .A(n618), .B(n617), .Z(\blk4/N114 ) );
  AO2 U760 ( .A(\blk2/temp_reg [6]), .B(n622), .C(pwdata[6]), .D(n621), .Z(
        n620) );
  ND2 U761 ( .A(\blk4/spi_dr [6]), .B(n623), .Z(n619) );
  ND2 U762 ( .A(n620), .B(n619), .Z(\blk4/N115 ) );
  AO2 U763 ( .A(\blk2/temp_reg [7]), .B(n622), .C(pwdata[7]), .D(n621), .Z(
        n625) );
  ND2 U764 ( .A(\blk4/spi_dr [7]), .B(n623), .Z(n624) );
  ND2 U765 ( .A(n625), .B(n624), .Z(\blk4/N116 ) );
  AN2P U766 ( .A(ss), .B(pready), .Z(pslverr) );
  ND2 U767 ( .A(cpol), .B(n374), .Z(n337) );
  ND2 U768 ( .A(n810), .B(n374), .Z(n336) );
  IVP U769 ( .A(psel), .Z(n628) );
  NR2 U770 ( .A(penable), .B(\blk4/state [1]), .Z(n626) );
  NR2 U771 ( .A(pready), .B(n626), .Z(n627) );
  NR2 U772 ( .A(n628), .B(n627), .Z(n372) );
  NR2 U773 ( .A(n631), .B(n629), .Z(n630) );
  EO U774 ( .A(n630), .B(sclk), .Z(n371) );
  AO2 U775 ( .A(cpha), .B(cpol), .C(n810), .D(n852), .Z(n689) );
  ND2 U776 ( .A(sclk), .B(n689), .Z(n683) );
  IVP U777 ( .A(n689), .Z(n688) );
  EON1 U778 ( .A(n631), .B(n683), .C(n688), .D(miso_receive_sclk0), .Z(n370)
         );
  OR2P U779 ( .A(sclk), .B(n689), .Z(n685) );
  EON1 U780 ( .A(n631), .B(n685), .C(n689), .D(miso_receive_sclk), .Z(n369) );
  NR2 U781 ( .A(n640), .B(n641), .Z(n632) );
  ND2 U782 ( .A(n633), .B(n632), .Z(n642) );
  IVP U783 ( .A(n642), .Z(n637) );
  ND2 U784 ( .A(\blk1/count [3]), .B(n637), .Z(n638) );
  ND2 U785 ( .A(n635), .B(n814), .Z(n634) );
  AO3 U786 ( .A(n635), .B(n814), .C(n639), .D(n634), .Z(n636) );
  AO4 U787 ( .A(n639), .B(n638), .C(n637), .D(n636), .Z(n682) );
  EO1 U788 ( .A(n641), .B(n640), .C(n640), .D(n641), .Z(n653) );
  NR2 U789 ( .A(n643), .B(n642), .Z(n654) );
  AO3 U790 ( .A(n654), .B(n647), .C(n645), .D(n644), .Z(n646) );
  AO6 U791 ( .A(n654), .B(n647), .C(n646), .Z(n649) );
  ND2 U792 ( .A(n650), .B(n796), .Z(n648) );
  AO3 U793 ( .A(n650), .B(n796), .C(n649), .D(n648), .Z(n652) );
  NR2 U794 ( .A(\blk1/count [2]), .B(n653), .Z(n651) );
  AO1P U795 ( .A(\blk1/count [2]), .B(n653), .C(n652), .D(n651), .Z(n681) );
  ND2 U796 ( .A(n655), .B(n654), .Z(n656) );
  NR2 U797 ( .A(n657), .B(n656), .Z(n663) );
  ND2 U798 ( .A(\blk1/count [6]), .B(n663), .Z(n661) );
  ND2 U799 ( .A(n657), .B(n656), .Z(n659) );
  ND2 U800 ( .A(\blk1/count [6]), .B(n659), .Z(n658) );
  AO3 U801 ( .A(\blk1/count [6]), .B(n659), .C(n662), .D(n658), .Z(n660) );
  AO4 U802 ( .A(n662), .B(n661), .C(n663), .D(n660), .Z(n680) );
  ND2 U803 ( .A(n664), .B(n663), .Z(n667) );
  NR2 U804 ( .A(n666), .B(n667), .Z(n678) );
  EO1 U805 ( .A(n815), .B(n665), .C(n665), .D(n815), .Z(n677) );
  IVP U806 ( .A(n667), .Z(n670) );
  AO2 U807 ( .A(n668), .B(n670), .C(n667), .D(n666), .Z(n674) );
  NR2 U808 ( .A(n837), .B(n674), .Z(n672) );
  AO2 U809 ( .A(n837), .B(n674), .C(n673), .D(n672), .Z(n676) );
  NR2 U810 ( .A(n678), .B(n677), .Z(n675) );
  AO1P U811 ( .A(n678), .B(n677), .C(n676), .D(n675), .Z(n679) );
  ND4 U812 ( .A(n682), .B(n681), .C(n680), .D(n679), .Z(n684) );
  AO4 U813 ( .A(n689), .B(n827), .C(n684), .D(n683), .Z(n368) );
  EON1 U814 ( .A(n685), .B(n684), .C(n689), .D(mosi_send_sclk), .Z(n367) );
  NR2 U815 ( .A(mosi_send_sclk), .B(n689), .Z(n686) );
  AO1P U816 ( .A(n689), .B(n827), .C(ss), .D(n686), .Z(n773) );
  IVP U817 ( .A(n773), .Z(n699) );
  NR2 U818 ( .A(lsbfe), .B(n699), .Z(n695) );
  ND2 U819 ( .A(n695), .B(n832), .Z(n696) );
  NR2 U820 ( .A(\blk2/count1 [1]), .B(n696), .Z(n687) );
  IVP U821 ( .A(n687), .Z(n698) );
  AO2 U822 ( .A(\blk2/count1 [2]), .B(n687), .C(n698), .D(n816), .Z(n366) );
  AO2 U823 ( .A(n689), .B(miso_receive_sclk0), .C(miso_receive_sclk), .D(n688), 
        .Z(n725) );
  NR2 U824 ( .A(ss), .B(n725), .Z(n723) );
  AN2P U825 ( .A(n793), .B(n723), .Z(n690) );
  ND2 U826 ( .A(n690), .B(n823), .Z(n691) );
  AO7 U827 ( .A(n690), .B(n823), .C(n691), .Z(n365) );
  NR2 U828 ( .A(\blk2/count3 [1]), .B(n691), .Z(n694) );
  IVP U829 ( .A(n694), .Z(n693) );
  ND2 U830 ( .A(\blk2/count3 [1]), .B(n691), .Z(n692) );
  ND2 U831 ( .A(n693), .B(n692), .Z(n364) );
  AO2 U832 ( .A(\blk2/count3 [2]), .B(n694), .C(n693), .D(n806), .Z(n363) );
  AO7 U833 ( .A(n695), .B(n832), .C(n696), .Z(n362) );
  ND2 U834 ( .A(\blk2/count1 [1]), .B(n696), .Z(n697) );
  ND2 U835 ( .A(n698), .B(n697), .Z(n361) );
  NR2 U836 ( .A(n793), .B(n699), .Z(n703) );
  ND2 U837 ( .A(\blk2/count [0]), .B(n703), .Z(n707) );
  NR2 U838 ( .A(n831), .B(n707), .Z(n706) );
  EO1 U839 ( .A(\blk2/count [2]), .B(n706), .C(n706), .D(\blk2/count [2]), .Z(
        n360) );
  NR2 U840 ( .A(n793), .B(n822), .Z(n728) );
  ND2 U841 ( .A(lsbfe), .B(n723), .Z(n700) );
  AO2 U842 ( .A(n728), .B(n723), .C(n822), .D(n700), .Z(n359) );
  ND2 U843 ( .A(n723), .B(n728), .Z(n701) );
  NR2 U844 ( .A(n803), .B(n701), .Z(n702) );
  AO6 U845 ( .A(n803), .B(n701), .C(n702), .Z(n358) );
  EO1 U846 ( .A(\blk2/count2 [2]), .B(n702), .C(n702), .D(\blk2/count2 [2]), 
        .Z(n357) );
  IVP U847 ( .A(n707), .Z(n705) );
  NR2 U848 ( .A(\blk2/count [0]), .B(n703), .Z(n704) );
  NR2 U849 ( .A(n705), .B(n704), .Z(n356) );
  AO6 U850 ( .A(n831), .B(n707), .C(n706), .Z(n355) );
  NR2 U851 ( .A(\blk2/count2 [2]), .B(\blk2/count2 [1]), .Z(n752) );
  ND2 U852 ( .A(lsbfe), .B(n800), .Z(n708) );
  NR2 U853 ( .A(\blk2/count2 [0]), .B(n708), .Z(n746) );
  ND2 U854 ( .A(n806), .B(n839), .Z(n716) );
  IVP U855 ( .A(n716), .Z(n750) );
  ND2 U856 ( .A(n800), .B(n793), .Z(n730) );
  NR2 U857 ( .A(\blk2/count3 [0]), .B(n730), .Z(n744) );
  AO2 U858 ( .A(n752), .B(n746), .C(n750), .D(n744), .Z(n727) );
  NR2 U859 ( .A(n838), .B(n803), .Z(n733) );
  ND2 U860 ( .A(\blk2/count2 [1]), .B(n838), .Z(n741) );
  ND2 U861 ( .A(\blk2/count2 [2]), .B(n803), .Z(n735) );
  AO4 U862 ( .A(n829), .B(n741), .C(n808), .D(n735), .Z(n709) );
  AO1P U863 ( .A(\blk2/temp_reg [1]), .B(n752), .C(n822), .D(n709), .Z(n712)
         );
  AO4 U864 ( .A(n830), .B(n741), .C(n809), .D(n735), .Z(n710) );
  AO1P U865 ( .A(n752), .B(\blk2/temp_reg [0]), .C(\blk2/count2 [0]), .D(n710), 
        .Z(n711) );
  AO4 U866 ( .A(n712), .B(n828), .C(n711), .D(n807), .Z(n713) );
  EO1 U867 ( .A(n733), .B(n713), .C(n712), .D(n711), .Z(n722) );
  ND2 U868 ( .A(\blk2/count3 [1]), .B(n806), .Z(n742) );
  AO4 U869 ( .A(\blk2/temp_reg [3]), .B(n742), .C(\blk2/temp_reg [1]), .D(n716), .Z(n715) );
  ND2 U870 ( .A(\blk2/count3 [2]), .B(\blk2/count3 [1]), .Z(n729) );
  ND2 U871 ( .A(\blk2/count3 [2]), .B(n839), .Z(n736) );
  AO4 U872 ( .A(\blk2/temp_reg [7]), .B(n729), .C(\blk2/temp_reg [5]), .D(n736), .Z(n714) );
  NR2 U873 ( .A(n715), .B(n714), .Z(n720) );
  AO4 U874 ( .A(\blk2/temp_reg [4]), .B(n736), .C(\blk2/temp_reg [0]), .D(n716), .Z(n718) );
  AO4 U875 ( .A(\blk2/temp_reg [6]), .B(n729), .C(\blk2/temp_reg [2]), .D(n742), .Z(n717) );
  NR2 U876 ( .A(n718), .B(n717), .Z(n719) );
  AO2 U877 ( .A(\blk2/count3 [0]), .B(n720), .C(n719), .D(n823), .Z(n721) );
  AO2 U878 ( .A(lsbfe), .B(n722), .C(n721), .D(n793), .Z(n724) );
  AO2 U879 ( .A(n725), .B(n724), .C(n723), .D(miso), .Z(n754) );
  ND2 U880 ( .A(\blk2/temp_reg [0]), .B(n727), .Z(n726) );
  AO7 U881 ( .A(n727), .B(n754), .C(n726), .Z(n354) );
  AN2P U882 ( .A(n800), .B(n728), .Z(n751) );
  IVP U883 ( .A(n729), .Z(n732) );
  NR2 U884 ( .A(n823), .B(n730), .Z(n749) );
  AO2 U885 ( .A(n733), .B(n751), .C(n732), .D(n749), .Z(n731) );
  MUX21L U886 ( .A(n754), .B(n807), .S(n731), .Z(n353) );
  AO2 U887 ( .A(n733), .B(n746), .C(n732), .D(n744), .Z(n734) );
  MUX21L U888 ( .A(n754), .B(n828), .S(n734), .Z(n352) );
  IVP U889 ( .A(n735), .Z(n739) );
  IVP U890 ( .A(n736), .Z(n738) );
  AO2 U891 ( .A(n739), .B(n751), .C(n738), .D(n749), .Z(n737) );
  MUX21L U892 ( .A(n754), .B(n808), .S(n737), .Z(n351) );
  AO2 U893 ( .A(n739), .B(n746), .C(n738), .D(n744), .Z(n740) );
  MUX21L U894 ( .A(n754), .B(n809), .S(n740), .Z(n350) );
  IVP U895 ( .A(n741), .Z(n747) );
  IVP U896 ( .A(n742), .Z(n745) );
  AO2 U897 ( .A(n747), .B(n751), .C(n745), .D(n749), .Z(n743) );
  MUX21L U898 ( .A(n754), .B(n829), .S(n743), .Z(n349) );
  AO2 U899 ( .A(n747), .B(n746), .C(n745), .D(n744), .Z(n748) );
  MUX21L U900 ( .A(n754), .B(n830), .S(n748), .Z(n348) );
  AO2 U901 ( .A(n752), .B(n751), .C(n750), .D(n749), .Z(n755) );
  ND2 U902 ( .A(\blk2/temp_reg [1]), .B(n755), .Z(n753) );
  AO7 U903 ( .A(n755), .B(n754), .C(n753), .Z(n347) );
  IVP U904 ( .A(n788), .Z(n756) );
  AO2 U905 ( .A(n756), .B(n794), .C(n844), .D(n788), .Z(n346) );
  AO2 U906 ( .A(n756), .B(n798), .C(n845), .D(n788), .Z(n345) );
  AO2 U907 ( .A(n756), .B(n801), .C(n846), .D(n788), .Z(n344) );
  AO2 U908 ( .A(n756), .B(n795), .C(n847), .D(n788), .Z(n343) );
  AO2 U909 ( .A(n756), .B(n804), .C(n848), .D(n788), .Z(n342) );
  AO2 U910 ( .A(n756), .B(n799), .C(n849), .D(n788), .Z(n341) );
  AO2 U911 ( .A(n756), .B(n805), .C(n850), .D(n788), .Z(n340) );
  AO2 U912 ( .A(n756), .B(n797), .C(n851), .D(n788), .Z(n339) );
  AO2 U913 ( .A(\blk2/count [2]), .B(\blk2/shift_register [7]), .C(
        \blk2/shift_register [3]), .D(n824), .Z(n758) );
  AO2 U914 ( .A(\blk2/count [2]), .B(\blk2/shift_register [6]), .C(
        \blk2/shift_register [2]), .D(n824), .Z(n757) );
  AO2 U915 ( .A(\blk2/count [0]), .B(n758), .C(n757), .D(n840), .Z(n762) );
  AO2 U916 ( .A(\blk2/count [2]), .B(\blk2/shift_register [5]), .C(
        \blk2/shift_register [1]), .D(n824), .Z(n760) );
  AO2 U917 ( .A(\blk2/count [2]), .B(\blk2/shift_register [4]), .C(
        \blk2/shift_register [0]), .D(n824), .Z(n759) );
  AO2 U918 ( .A(\blk2/count [0]), .B(n760), .C(n759), .D(n840), .Z(n761) );
  AO2 U919 ( .A(\blk2/count [1]), .B(n762), .C(n761), .D(n831), .Z(n770) );
  AO2 U920 ( .A(\blk2/count1 [2]), .B(\blk2/shift_register [7]), .C(
        \blk2/shift_register [3]), .D(n816), .Z(n764) );
  AO2 U921 ( .A(\blk2/count1 [2]), .B(\blk2/shift_register [5]), .C(
        \blk2/shift_register [1]), .D(n816), .Z(n763) );
  AO2 U922 ( .A(\blk2/count1 [1]), .B(n764), .C(n763), .D(n841), .Z(n768) );
  AO2 U923 ( .A(\blk2/count1 [2]), .B(\blk2/shift_register [6]), .C(
        \blk2/shift_register [2]), .D(n816), .Z(n766) );
  AO2 U924 ( .A(\blk2/count1 [2]), .B(\blk2/shift_register [4]), .C(
        \blk2/shift_register [0]), .D(n816), .Z(n765) );
  AO2 U925 ( .A(\blk2/count1 [1]), .B(n766), .C(n765), .D(n841), .Z(n767) );
  AO2 U926 ( .A(\blk2/count1 [0]), .B(n768), .C(n767), .D(n832), .Z(n769) );
  AO2 U927 ( .A(lsbfe), .B(n770), .C(n769), .D(n793), .Z(n771) );
  ND2 U928 ( .A(n771), .B(n773), .Z(n772) );
  AO7 U929 ( .A(n773), .B(n854), .C(n772), .Z(n338) );
  IVP U931 ( .A(n787), .Z(n789) );
  ND2 U932 ( .A(n789), .B(n774), .Z(n775) );
  IVP U933 ( .A(n775), .Z(n776) );
  AO2 U934 ( .A(n776), .B(n780), .C(n802), .D(n775), .Z(n334) );
  AO2 U935 ( .A(n776), .B(n791), .C(n817), .D(n775), .Z(n333) );
  AO2 U936 ( .A(n776), .B(n782), .C(n818), .D(n775), .Z(n332) );
  EO1 U937 ( .A(n776), .B(n783), .C(sppr[1]), .D(n776), .Z(n331) );
  AO2 U938 ( .A(n776), .B(n784), .C(n833), .D(n775), .Z(n330) );
  AO2 U939 ( .A(n776), .B(n786), .C(n834), .D(n775), .Z(n329) );
  AN2P U940 ( .A(n789), .B(n777), .Z(n778) );
  EO1 U941 ( .A(n778), .B(n780), .C(spiswai), .D(n778), .Z(n328) );
  EO1 U942 ( .A(n778), .B(n781), .C(\blk4/spi_cr2 [3]), .D(n778), .Z(n327) );
  EO1 U943 ( .A(n778), .B(n782), .C(\blk4/spi_cr2 [4]), .D(n778), .Z(n326) );
  EO1 U944 ( .A(n778), .B(n786), .C(\blk4/spi_cr2_0 ), .D(n778), .Z(n325) );
  ND2 U945 ( .A(n789), .B(n779), .Z(n790) );
  IVP U946 ( .A(n790), .Z(n792) );
  AO2 U947 ( .A(n792), .B(n780), .C(n842), .D(n790), .Z(n324) );
  AO2 U948 ( .A(n792), .B(n781), .C(n810), .D(n790), .Z(n323) );
  EO1 U949 ( .A(n792), .B(n782), .C(mstr), .D(n792), .Z(n322) );
  AO2 U950 ( .A(n792), .B(n783), .C(n811), .D(n790), .Z(n321) );
  EO1 U951 ( .A(n792), .B(n784), .C(\blk4/spi_cr1 [6]), .D(n792), .Z(n320) );
  AO2 U952 ( .A(n792), .B(n785), .C(n843), .D(n790), .Z(n319) );
  AO2 U953 ( .A(n792), .B(n786), .C(n793), .D(n790), .Z(n318) );
  AO2 U954 ( .A(n789), .B(n812), .C(n788), .D(n787), .Z(n317) );
  EO1 U955 ( .A(send_data), .B(n844), .C(\blk2/shift_register [6]), .D(
        send_data), .Z(n316) );
  EO1 U956 ( .A(send_data), .B(n845), .C(\blk2/shift_register [5]), .D(
        send_data), .Z(n315) );
  EO1 U957 ( .A(send_data), .B(n846), .C(\blk2/shift_register [4]), .D(
        send_data), .Z(n314) );
  EO1 U958 ( .A(send_data), .B(n847), .C(\blk2/shift_register [3]), .D(
        send_data), .Z(n313) );
  EO1 U959 ( .A(send_data), .B(n848), .C(\blk2/shift_register [2]), .D(
        send_data), .Z(n312) );
  EO1 U960 ( .A(send_data), .B(n849), .C(\blk2/shift_register [1]), .D(
        send_data), .Z(n311) );
  EO1 U961 ( .A(send_data), .B(n850), .C(\blk2/shift_register [0]), .D(
        send_data), .Z(n310) );
  EO1 U962 ( .A(send_data), .B(n851), .C(\blk2/shift_register [7]), .D(
        send_data), .Z(n309) );
  AO2 U963 ( .A(n792), .B(n791), .C(n852), .D(n790), .Z(n308) );
endmodule

