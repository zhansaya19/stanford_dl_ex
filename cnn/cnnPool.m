function pooledFeatures = cnnPool(poolDim, convolvedFeatures)
%cnnPool Pools the given convolved features
%
% Parameters:
%  poolDim - dimension of pooling region
%  convolvedFeatures - convolved features to pool (as given by cnnConvolve)
%                      convolvedFeatures(imageRow, imageCol, featureNum, imageNum)
%
% Returns:
%  pooledFeatures - matrix of pooled features in the form
%                   pooledFeatures(poolRow, poolCol, featureNum, imageNum)
%     


disp(convolvedFeatures);

numImages = size(convolvedFeatures, 4);
numFilters = size(convolvedFeatures, 3);
convolvedDim = size(convolvedFeatures, 1);

disp('numImages: ');
disp(numImages);

disp('numFilters: ');
disp(numFilters);

disp('convolvedDim: ');
disp(convolvedDim);

pooledFeatures = zeros(convolvedDim / poolDim, ...
        convolvedDim / poolDim, numFilters, numImages);

% Instructions:
%   Now pool the convolved features in regions of poolDim x poolDim,
%   to obtain the 
%   (convolvedDim/poolDim) x (convolvedDim/poolDim) x numFeatures x numImages 
%   matrix pooledFeatures, such that
%   pooledFeatures(poolRow, poolCol, featureNum, imageNum) is the 
%   value of the featureNum feature for the imageNum image pooled over the
%   corresponding (poolRow, poolCol) pooling region. 
%   
%   Use mean pooling here.

% You should implement mean pooling (i.e., averaging over feature responses) for this part.
% This can be done efficiently using the conv2 function as well. 
% The inputs are the responses of each image with each filter computed in the previous step. 
% Convolve each of these with a matrix of ones followed by a subsampling and averaging. 
% Make sure to use the “valid” border handling convolution.

%%% YOUR CODE HERE %%%
poolFilter = ones(poolDim) * 1/poolDim/poolDim;
disp('poolFilter');
disp(poolFilter);
for imageNum = 1:numImages
    for filterNum = 1:numFilters
		features = convolvedFeatures(:, :, filterNum, imageNum);

		

		poolConvolvedFeatures = conv2(features, poolFilter, 'valid');
		disp('poolConvolvedFeatures');
		disp(poolConvolvedFeatures);
		pooledFeatures(:, :, filterNum, imageNum) = poolConvolvedFeatures(1:poolDim:end, 1:poolDim:end);
    end
end

end

