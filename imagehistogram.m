%% Histogram 
% Editor: Bipul Mohanto
% email: bipul.mohanto@yahoo.com
% Date: 27/10/2017
function output = imagehistogram(input)
if size(input,3) == 3;
    input = rgb2gray(input);
else 
    input = input;
end
if ~ismatrix(input)
    error('Input is not a 2D Matrix')
end

[M,N] = size(input);
count = 0;
for z = 1:(max(input(:))+1)
    for i = 1:M
        for j=1:N
            if input(i,j) == z-1
                count = count+1;
            end
        end
    end
    input_matrix(z) = count;
    count = 0;
end

input_matrix = input_matrix';
[m n]= size(input_matrix);
pixel_value = [1,1:m-1];

output = stem(pixel_value,input_matrix,'fill','-');
grid off;
ylabel('Number of Pixels');
xlabel('Pixel Values');
title('Histogram of Input Image (one channel)');
end