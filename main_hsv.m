primage = imread('images/kwiaty.png');
image = rgb2hsv(image);

%se:
%   1
%  111
%   1
se = [1 0; -1 0; 0 1; 0 -1];

%podstawowe operacje
eroded_image = erode(image, se);
dilated_image = dilate(image, se);
opened_image = openn(image, se);
closed_image = closee(image, se);

figure('Name', 'erozja');
eroded_image = hsv2rgb(eroded_image);
imshow(eroded_image);
imwrite(eroded_image, 'wynik_hsv_erozja.png');

figure('Name', 'dylacja');
dilated_image = hsv2rgb(dilated_image);
imshow(dilated_image);
imwrite(dilated_image, 'wynik_hsv_dylacja.png');

figure('Name', 'otwarcie');
opened_image = hsv2rgb(opened_image);
imshow(opened_image);
imwrite(opened_image, 'wynik_hsv_otwarcie.png');

figure('Name', 'zamknięcie');
closed_image = hsv2rgb(closed_image);
imshow(closed_image);
imwrite(closed_image, 'wynik_hsv_zamkniecie.png');

%gradienty
gradient_erode = erode_gradient(image, se);
gradient_dilate = dilate_gradient(image, se);
gradient_morphology = morphology_gradient(image, se);

figure('Name', 'gradient przez erozje');
gradient_erode = hsv2rgb(gradient_erode);
imshow(gradient_erode);
imwrite(gradient_erode, 'wynik_hsv_gradient_erozja.png');

figure('Name', 'gradient przez dylację');
gradient_dilate = hsv2rgb(gradient_dilate);
imshow(gradient_dilate);
imwrite(gradient_dilate, 'wynik_hsv_gradient_dylacja.png');

figure('Name', 'gradient morfologiczny');
gradient_morphology = hsv2rgb(gradient_morphology);
imshow(gradient_morphology);
imwrite(gradient_morphology, 'wynik_hsv_gradient_morfologiczny.png');

%top-hat
top_hat_image = top_hat(image, se);
bottom_hat_image = bottom_hat(image, se);

figure('Name', 'top hat');
top_hat_image = hsv2rgb(top_hat_image);
imshow(top_hat_image);
imwrite(top_hat_image, 'wynik_hsv_top_hat.png');

figure('Name', 'bottom hat');
bottom_hat_image = hsv2rgb(bottom_hat_image);
imshow(bottom_hat_image);
imwrite(bottom_hat_image, 'wynik_hsv_bottom_hat.png');


%rekonstrukcja przez dylację -- operacja trwa około 15 min !!!
mask = rgb2hsv(imread('images/paski.png'));
marker = rgb2hsv(imread('images/znacznik.png'));

reconstructed = hsv2rgb(im2double(dilation_recontruction(marker, mask, se, 30)));
imwrite(reconstructed, 'rekonstrukcja_dylacja_wynik_hsv.png');

%rekonstrukcja przez erozję -- operacja trwa około 40 min !!!
mask = rgb2hsv(imread('images/shapes.jpg'));
marker = rgb2hsv(imread('images/znacznik_shapes.png'));

reconstructed = erosion_reconstruction(marker, mask, se, 35);
imwrite(hsv2rgb(reconstructed), 'rekonstrukcja_erozja_wynik_hsv.png');

% otwarcie przez rekonstrukcję
opened_image = open_reconstruction(image, se);
imwrite(hsv2rgb(opened_image), 'otwarcie_rekonstrukcja_wynik_hsv.png');

% zamknięcie przez rekonstrukcję
closed_image = close_reconstruction(image, se);
imwrite(hsv2rgb(closed_image), 'zamkniecie_rekonstrukcja_wynik_hsv.png');
