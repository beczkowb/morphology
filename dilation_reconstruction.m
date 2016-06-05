% mask to obrazek oryginalny
% image jest obrazem ze znacznikami
function [ rec_image ] = dilation_reconstruction( image, mask, se, loops )

rec_image = image;

% powtarzamy dylację geodezyjną wiele razy tak by wyniki przestasły się
% zmieniać
for i=1: loops
    rec_image = geo_dilation(rec_image, mask, se); 
end

end