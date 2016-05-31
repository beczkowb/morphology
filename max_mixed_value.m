function [ max_value, max_row, max_col ] = max_mixed_value( mixed_image, se, row, col)
siz = size(mixed_image);

rows = siz(1);
cols = siz(2);

max_value = mixed_image(row, col);
max_row = row;
max_col = col;

for i=1:size(se, 1)
    se_i = row + se(i, 1);
    se_j = col + se(i, 2);
    if (se_i >= 1 && se_i <= rows) && (se_j >= 1 && se_j <= cols) && (mixed_image(se_i, se_j) > max_value)
        max_value = mixed_image(se_i, se_j);
        max_row = se_i;
        max_col = se_j;
    end
end

end
