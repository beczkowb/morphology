function [ opened_image ] = close_reconstruction( image, se )

dilated_image = dilate(image, se);

opened_image = erosion_recontruction(dilated_image, image, se, 3);

end