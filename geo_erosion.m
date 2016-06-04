function [ geo_image ] = geo_erosion( image, mask, se )

rows = size(image, 1);
cols = size(image, 2);
geo_image = zeros(rows, cols, 3);

eroded_image = erode(image, se);

mixed_eroded_image = mix_image(eroded_image);
mixed_mask = mix_image(mask);

for i=1: rows
    for j=1: cols
        if mixed_eroded_image(i, j) > mixed_mask(i, j)
            geo_image(i, j, :) = eroded_image(i, j, :);
        else
            geo_image(i, j, :) = mask(i, j, :);
        end
    end
end

geo_image = uint8(geo_image);

end

