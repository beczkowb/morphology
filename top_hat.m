function [ processed_image ] = top_hat( image, se )

opened_image =  openn(image, se);
processed_image = image - opened_image;

end

