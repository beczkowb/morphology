function [mixed_bits] = bitmixer(r, g, b)
%Z trzech wektorów, z których każdy ma długość 8, tworzy jeden wektor
%o długości 24 przy użyciu techniki mieszania bitów.

r_binary = de2bi(r, 8);
g_binary = de2bi(g, 8);
b_binary = de2bi(b, 8);
mixed_bits = zeros(1, 24);

for i=1:8
    mixed_bits(i*3 - 2) = r_binary(i);
    mixed_bits(i*3 - 1) = g_binary(i);
    mixed_bits(i*3) = b_binary(i);
end

end