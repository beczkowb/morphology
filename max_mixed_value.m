function [ max_value, max_row, max_col ] = max_mixed_value( mixed_image, se, row, col, include_center)
%Funkcja zwraca wartość oraz indeksy maksimum spośród otoczenia piksela o
%indeksach (row, cols), otoczenie jest określone przez argument se.

if nargin == 4
    include_center = true;
end

siz = size(mixed_image);

rows = siz(1);
cols = siz(2);

if include_center == true
    max_value = mixed_image(row, col);
    max_row = row;
    max_col = col;
else
    max_value = -1;
    max_row = -1;
    max_col = -1;
end

%Funkcja iteruje po całym otoczeniu piksela, aby znaleźć maksimum
for i=1:size(se, 1)
    se_i = row + se(i, 1);
    se_j = col + se(i, 2);
    %Sprawdzanie czy dany punkt otoczenia jest w granicach obrazu
    if (se_i >= 1 && se_i <= rows) && (se_j >= 1 && se_j <= cols) && (mixed_image(se_i, se_j) > max_value)
        max_value = mixed_image(se_i, se_j);
        max_row = se_i;
        max_col = se_j;
    end
end


if max_value == -1
    max_value = mixed_image(row, col);
    max_row = row;
    max_col = col;
end

end
