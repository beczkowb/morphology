function [ hmt_image ] = hit_or_miss( image, se1, se2, include_center )

eroded_image = erode(image, se1, include_center);
dilated_image = dilate(image, se2, include_center);
hmt_image = eroded_image - dilated_image;

end