RGB = imread('eleimg.jpeg'); % read first image
figure
imshow(RGB)

RGB2 = imread('noneleimg.jpeg'); % read second image
figure
imshow(RGB2)

% Convert images to grayscale
I1 = rgb2gray(RGB);
figure
imshow(I1)

I2 = rgb2gray(RGB2);
figure
imshow(I2)

% Frequency domain of first image
figure
subplot(2,1,1)
F1 = fft2(I1);
S1 = fftshift(log(1 + abs(F1)));
imshow(S1,[])
title('Spectrum of Image 1')

% Frequency domain of second image
subplot(2,1,2)
F2 = fft2(I2);
S2 = fftshift(log(1 + abs(F2)));
imshow(S2,[])
title('Spectrum of Image 2')

% Resize images to same size
S2 = imresize(S2,size(S1));

% Convert matrices to vectors
v1 = S1(:);
v2 = S2(:);

% Cross correlation
[acorrX,lagX] = xcorr(v1,v2);
figure
plot(lagX,acorrX)
title('Correlation between two images')

% Auto correlation
[acorrX2,lagX2] = xcorr(v1,v1);
figure
plot(lagX2,acorrX2)
title('Auto-correlation of image 1')

% Difference
p = abs(acorrX - acorrX2);

% Normalized correlation coefficient
r = corrcoef(v1,v2);
corr_value = r(1,2);

% Convert to percentage
corr_percent = abs(corr_value) * 100;

% Display correlation value
fprintf('Correlation coefficient = %.4f\n', corr_value);
fprintf('Percentage similarity = %.2f %%\n', corr_percent);

% Decision condition
if abs(corr_value) > 0.8
    fprintf('Images are Correlated\n');
else
    fprintf('Images are Not Correlated\n');
end

