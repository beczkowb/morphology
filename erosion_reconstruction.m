% mask to obrazek oryginalny
% image to obraz-marker (obraz ze znacznikami) 
function [ rec_image ] = erosion_reconstruction( image, mask, se, loops )

rec_image = image;

% wielokrotnie powtarzamy operację erozji geodezyjnej, aż wyniki przestaną
% się zmieniać
for i=1: loops
    rec_image = geo_erosion(rec_image, mask, se);
end

end