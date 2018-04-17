function [quantized] = quantize(image,levels)
    threshRGB = multithresh(image,levels);
    value = [0 threshRGB(2:end) 255]; 
    quantized = imquantize(image, threshRGB, value);
end

