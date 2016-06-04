function [ eroded_image ] = erode( image, se, include_center )

if nargin == 2
    include_center = true;
end

mixed_image = mix_image(image);
eroded_image = image(:, :, :);
siz = size(image);
rows = siz(1);
cols = siz(2);

row = 0;
col = 0;

for i=1:rows
    for j=1:cols
        [~ , row, col] = min_mixed_value(mixed_image, se, i, j, include_center);
        eroded_image(i, j, :) = image(row, col, :);
    end
end

end

