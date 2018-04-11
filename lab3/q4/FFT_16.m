function [ output_vec ] = FFT_16( vec_16 )
    % Stage 1 - 2-input butterflies
    stage1_1 = butterfly_n(2, [vec_16(1),vec_16(9)]);
    stage1_2 = butterfly_n(2, [vec_16(5),vec_16(13)]);

    stage1_3 = butterfly_n(2, [vec_16(3),vec_16(11)]);
    stage1_4 = butterfly_n(2, [vec_16(7),vec_16(15)]);

    stage1_5 = butterfly_n(2, [vec_16(2),vec_16(10)]);
    stage1_6 = butterfly_n(2, [vec_16(6),vec_16(14)]);
    
    stage1_7 = butterfly_n(2, [vec_16(4),vec_16(12)]);
    stage1_8 = butterfly_n(2, [vec_16(8),vec_16(16)]);
    
    % Stage 2 - 4-input butterflies
    stage2_1 = butterfly_n(4, [stage1_1, stage1_2]);
    stage2_2 = butterfly_n(4, [stage1_3, stage1_4]);
    
    stage2_3 = butterfly_n(4, [stage1_5, stage1_6]);
    stage2_4 = butterfly_n(4, [stage1_7, stage1_8]);
    
    % Stage 3 - 8-input butterflies
    stage3_1 = butterfly_n(8, [stage2_1, stage2_2]);
    
    stage3_2 = butterfly_n(8, [stage2_3, stage2_4]);
    
    % Stage 4 - 16-input butterfly
    output_vec=butterfly_n(16, [stage3_1,stage3_2]);

end

