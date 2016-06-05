function [ opened_image ] = open_reconstruction( image, se )

eroded_image = erode(image, se);

opened_image = dilation_recontruction(eroded_image, image, se, 2);

end
