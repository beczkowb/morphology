function [ rec_image ] = dilation_recontruction( image, mask, se, loops )

rec_image = image;

for i=1: loops
    rec_image = geo_dilation(rec_image, mask, se); 
end

end