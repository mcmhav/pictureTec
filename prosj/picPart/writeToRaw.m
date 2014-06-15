function [ ] = writeToRaw(data, filename)
%WRITETORAW Example: writeToRaw(matrix, 'test.raw');

    precision = 'uint8';
    f = fopen(filename, 'w');
    [M N O] = size(data);
    for z = 1:O
        fwrite(f, data(:,:,z), precision, 0, 'b'); % b for big endian writing
    end
    fclose(f);

end

