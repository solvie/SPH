%Generate codebook
codebook = linearblockcodebook844();

%compute euclidian distance
inputvector = [ 0.0098  ,  1.0041 ,  0.9266 ,  -0.0031 ,   0.0232  ,  1.0426  ,  0.9627 ,  -0.0236];
inputmatrix = repmat(inputvector, 16,1);
resultmatrix = (codebook-inputmatrix).^2;
resultvector = sum(resultmatrix,2);

%find minval and its index
[m,i] = min(resultvector);

%get that codeword
codeword=codebook(i,:);