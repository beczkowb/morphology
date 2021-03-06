function [ mixed_image ] = mix_image( image )
%Zmienia zdjęcie tak że każdy piksel przechodzi z postaci wektorowej w 
%skalarną przy użyciu techniki mieszania bitów.

if isfloat(image) == true
    image = im2uint8(image);
end

siz = size(image);
rows = siz(1);
cols = siz(2);
mixed_image = zeros(rows, cols);

for i=1:rows
    for j=1:cols
        r = image(i, j, 1);
        g = image(i, j, 2);
        b = image(i, j, 3);
        mixed_image(i, j) = bi2de(bitmixer(r, g, b));
    end
end
end

