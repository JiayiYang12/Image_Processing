function  [eigvector, eigvalue, meandata,new_dim] = pca2drow(X,PC_Num)
% PCA2dd  2D row  Principal Component Analysis.
%
% Synopsis:
%  model = pca2dd(X)
%  model = pca2dd(X,new_dim)
%  model = pca2dd(X,var)
%
% Description:
%  It computes 2D row Principal Component Analysis
%
%  model = pca2dd(X,new_dim) use to specify explicitely output
%   dimension where new_dim >= 1.
%
%  model = pca2dd(X,var) use to specify a portion of discarded
%   variance in data where 0 <= var < 1. The new_dim is 
%   selected be as small as possbile and to satisfy 
%     var >= MsErr(new_dim)/MaxMsErr 
%   
%   where MaxMsErr = sum(sum(X.^2)). 
%
% Input:
%  X[xa,xa,numtr] training data ,xa--row,xa--rank,numtr--train num
%
%  new_dim [1x1] Output dimension; new_dim > 1 (default new_dim = dim);
%  var [1x1] Portion of discarded variance in data.
%
% Ouputs:
%  model [struct] Linear projection:
%   .W [dim x new_dim] Projection matrix.
%   .b [new_dim x 1] Bias.
%  
%   .eigval [dim x 1] eigenvalues.
%   .mse [real] Mean square representation error.
%   .MsErr [dim x 1] Mean-square errors with respect to number 
%     of basis vectors; mse=MsErr(new_dim).
%   .mean_X [dim x 1] mean of training data.
%
%%

% get dimensions
[~,xa,numtr]=size(X);

% process input arguments
if nargin < 2
    PC_Num = 0.99;
end

% centering data
meandata = mean(X,3);
X=X-repmat(meandata,[1 1 numtr]);

% covariance
Gt = zeros(xa,xa);
for j=1:numtr
    Gt = Gt + X(:, :, j)'*X(:, :, j)/numtr;
end

% eigenvalue decomposition
[V,D]=eig(Gt);
[eigvalue,indexv]=sort(-diag(D));
sortV= V(:,indexv);

% decide about the new_dimension
if PC_Num > 1
  new_dim = PC_Num;   % new_dim enterd explicitly
else
 new_dim=PC_Num*numtr;
end

% take new_dim most important eigenvectors
eigvector=sortV(:,1:new_dim);

