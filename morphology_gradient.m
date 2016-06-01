function [ gradient ] = morphology_gradient( image, se )

eroded_image = erode(image, se);
dilated_image = dilate(image, se);
gradient = dilated_image - eroded_image;

end

