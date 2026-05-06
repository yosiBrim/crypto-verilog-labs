// Lab 4: Inverse Initial Permutation (IIP / FP) Module
// Used as the final step in DES to reverse the initial permutation.

`default_nettype none

module Inverse_Permutation (
    input  wire [63:0] Data_In,
    output wire [63:0] Y
);

    // Inverse Permutation Mapping
    assign Y[0]  = Data_In[39]; assign Y[1]  = Data_In[7];  assign Y[2]  = Data_In[47]; assign Y[3]  = Data_In[15];
    assign Y[4]  = Data_In[55]; assign Y[5]  = Data_In[23]; assign Y[6]  = Data_In[63]; assign Y[7]  = Data_In[31];
    assign Y[8]  = Data_In[38]; assign Y[9]  = Data_In[6];  assign Y[10] = Data_In[46]; assign Y[11] = Data_In[14];
    assign Y[12] = Data_In[54]; assign Y[13] = Data_In[22]; assign Y[14] = Data_In[62]; assign Y[15] = Data_In[30];
    assign Y[16] = Data_In[37]; assign Y[17] = Data_In[5];  assign Y[18] = Data_In[45]; assign Y[19] = Data_In[13];
    assign Y[20] = Data_In[53]; assign Y[21] = Data_In[21]; assign Y[22] = Data_In[61]; assign Y[23] = Data_In[29];
    assign Y[24] = Data_In[36]; assign Y[25] = Data_In[4];  assign Y[26] = Data_In[44]; assign Y[27] = Data_In[12];
    assign Y[28] = Data_In[52]; assign Y[29] = Data_In[20]; assign Y[30] = Data_In[60]; assign Y[31] = Data_In[28];
    assign Y[32] = Data_In[35]; assign Y[33] = Data_In[3];  assign Y[34] = Data_In[43]; assign Y[35] = Data_In[11];
    assign Y[36] = Data_In[51]; assign Y[37] = Data_In[19]; assign Y[38] = Data_In[59]; assign Y[39] = Data_In[27];
    assign Y[40] = Data_In[34]; assign Y[41] = Data_In[2];  assign Y[42] = Data_In[42]; assign Y[43] = Data_In[10];
    assign Y[44] = Data_In[50]; assign Y[45] = Data_In[18]; assign Y[46] = Data_In[58]; assign Y[47] = Data_In[26];
    assign Y[48] = Data_In[33]; assign Y[49] = Data_In[1];  assign Y[50] = Data_In[41]; assign Y[51] = Data_In[9];
    assign Y[52] = Data_In[49]; assign Y[53] = Data_In[17]; assign Y[54] = Data_In[57]; assign Y[55] = Data_In[25];
    assign Y[56] = Data_In[32]; assign Y[57] = Data_In[0];  assign Y[58] = Data_In[40]; assign Y[59] = Data_In[8];
    assign Y[60] = Data_In[48]; assign Y[61] = Data_In[16]; assign Y[62] = Data_In[56]; assign Y[63] = Data_In[24];

endmodule
