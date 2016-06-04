function [ closed_image ] = closee( image, se )

DI = dilate(image, se);
EI = erode(DI, se);
closed_image = EI;

end

