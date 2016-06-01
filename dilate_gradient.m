function [ gradient ] = dilate_gradient( image, se )

dilated_image = dilate(image, se);
gradient = dilated_image - image;

end

