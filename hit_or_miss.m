function [ hmt_image ] = hit_or_miss( image, se1, se2 )

eroded_image = erode(image, se1, false);
dilated_image = dilate(image, se2, false);
hmt_image = eroded_image - dilated_image;

end