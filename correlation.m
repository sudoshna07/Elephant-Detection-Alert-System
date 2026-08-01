function result = correlation()

% ============================================
% Elephant vs Non-Elephant Image Correlation
% Frequency Domain Analysis
% ============================================

clc

%% STEP 1: Read Images
RGB  = imread('C:\Users\KIIT0001\OneDrive\Desktop\Matlab_drive\MINOR\data\eleimg.jpeg');
RGB2 = imread('C:\Users\KIIT0001\OneDrive\Desktop\Matlab_drive\MINOR\data\noneleimg.jpeg');

%% STEP 2: Convert to Grayscale
I1 = rgb2gray(RGB);
I2 = rgb2gray(RGB2);

I1 = double(I1);
I2 = double(I2);

%% STEP 3: FFT - Convert to Frequency Domain

% Elephant FFT
F1 = fft2(I1);
S1 = fftshift(F1);
S1 = log(1 + abs(S1));

% Non-Elephant FFT
F2 = fft2(I2);
S2 = fftshift(F2);
S2 = log(1 + abs(S2));

%% STEP 4: Make vectors
vec1 = S1(:);
vec2 = S2(:);

% Make equal size
n = min(length(vec1), length(vec2));
vec1 = vec1(1:n);
vec2 = vec2(1:n);

%% STEP 5: Pearson Correlation
numerator   = sum((vec1 - mean(vec1)) .* (vec2 - mean(vec2)));
denominator = sqrt(sum((vec1 - mean(vec1)).^2) * sum((vec2 - mean(vec2)).^2));

correlation_value = numerator / denominator;

%% STEP 6: Decision Logic
if abs(correlation_value) > 0.8
    result = 1;
else
    result = 0;
end

%% STEP 7: Display Result
fprintf('\nCorrelation Value = %.4f\n', correlation_value);

if result == 1
    fprintf('Images are Correlated\n');
else
    fprintf('Images are Not Correlated\n');
end

end
