function [ processed_image ] = bottom_hat( image, se )

closed_image =  closee(image, se);
processed_image = closed_image - image;

end

