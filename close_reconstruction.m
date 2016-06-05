function [ opened_image ] = close_reconstruction( image, se )

% najpierw wykonujemy dylację
dilated_image = dilate(image, se);

% następnie kilkakrotnie wykonujemy rekonstrukcję (kilkakrotnie i wystarczająco)
% aż do momentu gdy obrazek wyjściowy przestanie się zmieniać
opened_image = erosion_reconstruction(dilated_image, image, se, 2);

end