function [ opened_image ] = openn( image, se )

EI = erode(image, se);
DI = dilate(EI, se);
opened_image = DI;

end

