function [ eroded_image ] = erode( image, se, include_center )
%Przykładowa postać se: 
%  jeśli chcemy uzyskać element strukturalny jak pokazano poniżej:
%                       1
%                      111
%                       1
%  argument se powinien przyjąć postać:
%                      [1 0; -1 0; 0 1; 0 -1]
%  domyślnie brany jest pod uwagę także element (0, 0), a jeśli
%  chcemy, aby element strukturalny miał postać:
%                       1
%                      1 11
%                       1
%  należy ustawić parametr include_center na false, a parametr 
%  se ustawić na [1 0; -1 0; 0 1; 0 -1; 0 2]
%
%Funkcja przetwarza zarówno obrazy rgb jak i hsv


if nargin == 2
    include_center = true;
end

%mixed_image będzie używane do porządkowania
mixed_image = mix_image(image);
eroded_image = image(:, :, :);
siz = size(image);
rows = siz(1);
cols = siz(2);

row = 0;
col = 0;

for i=1:rows
    for j=1:cols
        [~ , row, col] = min_mixed_value(mixed_image, se, i, j, include_center);
        eroded_image(i, j, :) = image(row, col, :);
    end
end

end

