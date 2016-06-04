function [ rec_image ] = erosion_recontruction( image, mask, se, loops )

rec_image = image;

for i=1: loops
    rec_image = geo_erosion(rec_image, mask, se);
end

end

