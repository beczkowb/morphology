image = imread('images/kwiaty.png');

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
imshow(eroded_image);
imwrite(eroded_image, 'wynik_erozja.png');

figure('Name', 'dylacja');
imshow(dilated_image);
imwrite(dilated_image, 'wynik_dylacja.png');

figure('Name', 'otwarcie');
imshow(opened_image);
imwrite(opened_image, 'wynik_otwarcie.png');

figure('Name', 'zamknięcie');
imshow(closed_image);
imwrite(closed_image, 'wynik_zamkniecie.png');

%gradienty
gradient_erode = erode_gradient(image, se);
gradient_dilate = dilate_gradient(image, se);
gradient_morphology = morphology_gradient(image, se);

figure('Name', 'gradient przez erozje');
imshow(gradient_erode);
imwrite(gradient_erode, 'wynik_gradient_erozja.png');

figure('Name', 'gradient przez dylację');
imshow(gradient_dilate);
imwrite(gradient_dilate, 'wynik_gradient_dylacja.png');

figure('Name', 'gradient morfologiczny');
imshow(gradient_morphology);
imwrite(gradient_morphology, 'wynik_gradient_morfologiczny.png');

%top-hat
top_hat_image = top_hat(image, se);
bottom_hat_image = bottom_hat(image, se);

figure('Name', 'top hat');
imshow(top_hat_image);
imwrite(top_hat_image, 'wynik_top_hat.png');

figure('Name', 'bottom hat');
imshow(bottom_hat_image);
imwrite(bottom_hat_image, 'wynik_bottom_hat.png');

%rekonstrukcja przez dylację -- operacja trwa około 15 min !!!
mask = imread('images/paski.png');
marker = imread('images/znacznik.png');

reconstructed = dilation_recontruction(marker, mask, se, 30);
figure('Name', 'dilation reconstruction');
imwrite(reconstructed, 'rekonstrukcja_dylacja_wynik.png');

%rekonstrukcja przez erozję -- operacja trwa około 40 min !!!
mask = imread('images/shapes.jpg');
marker = imread('images/znacznik_shapes.png');

reconstructed = erosion_reconstruction(marker, mask, se, 35);
figure('Name', 'erosion reconstruction');
imwrite(reconstructed, 'rekonstrukcja_erozja_wynik.png');

% otwarcie przez rekonstrukcję
opened_image = open_reconstruction(image, se);
figure('Name', 'open reconstruction');
imwrite(opened_image, 'otwarcie_rekonstrukcja_wynik.png');

% zamknięcie przez rekonstrukcję
closed_image = close_reconstruction(image, se);
figure('Name', 'close reconstruction');
imwrite(closed_image, 'zamkniecie_rekonstrukcja_wynik.png');


