%Generate codebook
codebook = linearblockcodebook844();

%compute euclidian distance
inputvector = [0.54, - 0.12, 1.32, 0.41, 0.63, 1.25, 0.37, -0.02];
inputmatrix = repmat(inputvector, 16,1);
resultmatrix = (codebook-inputmatrix).^2;
resultvector = sum(resultmatrix,2);

%find minval and its index
[m,i] = min(resultvector);

%get that codeword
codeword=codebook(i,:);