function [ min_value, min_row, min_col ] = min_mixed_value( mixed_image, se, row, col)
siz = size(mixed_image);

rows = siz(1);
cols = siz(2);

min_value = mixed_image(row, col);
min_row = row;
min_col = col;

for i=1:size(se, 1)
    se_i = row + se(i, 1);
    se_j = col + se(i, 2);
    if (se_i >= 1 && se_i <= rows) && (se_j >= 1 && se_j <= cols) && (mixed_image(se_i, se_j) < min_value)
        min_value = mixed_image(se_i, se_j);
        min_row = se_i;
        min_col = se_j;
    end
end

end