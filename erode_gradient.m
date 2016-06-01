function [ gradient ] = erode_gradient( image, se )

eroded_image = erode(image, se);
gradient = image - eroded_image;

end

