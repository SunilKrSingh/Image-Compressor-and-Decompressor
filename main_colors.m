clear all;
close all;
clc;

%% Prompt user and read image file.
prompt = 'Enter file name with extension: ';
filename=input(prompt, 's');
img = imread(filename);
figure;
imshow(img, []);
title("Input Image");

if length(size(img)) == 2
    disp("Invalid input, please enter color image filename")
end

%% Display file size of input image
imwrite(img,"input_img.jpg") % Saving image file locally
comp_name = "input_img.jpg";
comp_file=imfinfo(comp_name); % Getting file size of compressed image
comp_file_sz=comp_file.FileSize;
fprintf('File size of input image (in bytes): %f\n\n', comp_file_sz); 
img = double(img);

%% Use lossy
disp("Lossy Color Image:")
[comp_img, uncomp_img] = color_lossy(img);


%% Use lossless
disp("Lossless Color Image:")
[comp_img_ll, uncomp_img_ll] = color_lossless(img);