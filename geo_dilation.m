function [ geo_image ] = geo_dilation( image, mask, se )

rows = size(image, 1);
cols = size(image, 2);
geo_image = image;

dilated_image = dilate(image, se);

mixed_dilated_image = mix_image(dilated_image);
mixed_mask = mix_image(mask);

for i=1: rows
    for j=1: cols
        if mixed_dilated_image(i, j) < mixed_mask(i, j)
            geo_image(i, j, :) = dilated_image(i, j, :);
        else
            geo_image(i, j, :) = mask(i, j, :);
        end
    end
end

geo_image = uint8(geo_image);

end

