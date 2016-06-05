function [ opened_image ] = open_reconstruction( image, se )

% najpierw wykonujemy erozję
eroded_image = erode(image, se);

% wykonujemy rekonstrukcję przez dylację w celu jak najlepszego odtworzenia
% zniekształconych przez erozję elementów
opened_image = dilation_reconstruction(eroded_image, image, se, 2);

end
