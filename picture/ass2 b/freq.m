function t = freq(A)
figure, imshow(A)
[M N] = size(A);
[f, rc] = tofloat(A);
F = fft2(f);
S = gscale(log(1 + abs(fftshift(F))));
figure, imshow(S)
%C1 = [122 186; 179 134];
C1 = [134 164; 132 155; 122 186; 179 134; 68 106; 39 59];
H1 = cnotch('gaussian', 'reject',M,N,C1,12);
P1 = gscale(fftshift(H1).*(tofloat(S)));
figure,imshow(P1);

g1 = dftfilt(f,H1);
g1 = rc(g1);
figure, imshow(g1)