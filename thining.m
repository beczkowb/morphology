function [ thined_image ] = thining( image, se1, se2 )

hmt_image = hit_or_miss(image, se1, se2);
thined_image = image - hmt_image;


end

