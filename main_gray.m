clear all;
close all;
clc;

%% Prompt user and read image file.
prompt = 'Enter file name with extension (Example: cameraman.tif) : ';
filename=input(prompt, 's');
img = imread(filename);
figure;
imshow(img, []);
title("Input Image")

if length(size(img)) == 3  %if color img then covnerting into grayscale
    img = rgb2gray(img);
end

%% Display file size of input image
imwrite(img,"input_img.jpg") % Saving image file locally
comp_name = "input_img.jpg";
comp_file=imfinfo(comp_name); % Getting file size of compressed image
comp_file_sz=comp_file.FileSize;
fprintf('File size of input image (in bytes): %f\n\n', comp_file_sz); 
img = double(img);

%% Use lossy
disp("Lossy Grayscale Image:")
[comp_img, uncomp_img] = lossy_haar(img);
show_plots(img, uncomp_img, 'lossy');
compare_haar(img, comp_img, uncomp_img);

%% Use lossless
disp("Lossless Grayscale Image:")
[comp_img_ll, uncomp_img_ll] = lossless_haar(img);
show_plots(img, uncomp_img_ll, "lossless");
compare_haar(img, comp_img_ll, uncomp_img_ll);

%%Comparing with other methods
compare_diff_methods(img);