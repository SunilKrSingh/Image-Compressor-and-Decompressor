function [] = show_plots(img_, uncomp_img_, name)
    img = uint8(img_);
    uncomp_img = uint8(uncomp_img_);
    
    % Plotting the input and final compressed image
    figure;
    imshow(img,[]);
    title("Original Image");
    
    figure;
    imshow(uncomp_img,[]);
    title("Compressed Image " + name);

    %% Save images locally
    imwrite(img,'orginal.jpg')
    imwrite(uncomp_img,'compressed.jpg');

end