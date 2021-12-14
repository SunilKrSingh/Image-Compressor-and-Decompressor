function [comp_img, uncomp_img] = color_lossy(img_)
    img = img_;
    
    % Apply lossy_haar to each channel
    disp("For red channel:")
    [comp_img_1, uncomp_img_1] = lossy_haar(img(:,:,1));
    disp("For green channel:")
    [comp_img_2, uncomp_img_2] = lossy_haar(img(:,:,2));
    disp("For blue channel:")
    [comp_img_3, uncomp_img_3] = lossy_haar(img(:,:,3));
    
    comp_img(:,:,1) = comp_img_1;
    comp_img(:,:,2) = comp_img_2;
    comp_img(:,:,3) = comp_img_3;
    
    uncomp_img(:,:,1) = uncomp_img_1;
    uncomp_img(:,:,2) = uncomp_img_2;
    uncomp_img(:,:,3) = uncomp_img_3;
    
    %% Display file size of lossy color image
    imwrite(uncomp_img,"lossy_color.jpg") % Saving image file locally
    comp_name = "lossy_color.jpg";
    comp_file=imfinfo(comp_name); % Getting file size of compressed image
    comp_file_sz=comp_file.FileSize;
    fprintf('File size of lossy color decompressed image (in bytes): %f\n\n', comp_file_sz); 

    show_plots(img, uncomp_img, 'lossy');
    compare_haar(img, comp_img, uncomp_img);
    
end