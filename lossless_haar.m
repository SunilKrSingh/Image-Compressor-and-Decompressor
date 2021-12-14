function [comp_img_ll, uncomp_img_ll] = lossless_haar(img_)
    img = img_;
    H = zeros(8,8);
    for i=1:8 % Preparing required H matrix. Derivation in the report
        H(i,1) = 1/8;
    end
    for i=1:4
        H(i,2) = 1/8;
        H(i+4,2) = -1/8;
    end
    for i=1:2
        H(i,3) = 1/4;
        H(i+2,3) = -1/4;
        H(i+4,4) = 1/4;
        H(i+6,4) = -1/4;
    end
    for i=1:1
        H(i,5) = 1/2;
        H(i+1,5) = -1/2;
        H(i+2,6) = 1/2;
        H(i+3,6) = -1/2;
        H(i+4,7) = 1/2;
        H(i+5,7) = -1/2;
        H(i+6,8) = 1/2;
        H(i+7,8) = -1/2;
    end
    HT = transpose(H);
    HT_inv = inv(HT);
    H_inv = inv(H);
    comp_img_ll = img;
    uncomp_img_ll = img;
    [a,b] = size(img);
    for r=1:b/8 % Dividing image matrix into blocks of 8x8 to perform compression
        for c=1:a/8
            A = zeros(8,8);
            for i=1:8 % Getting the required values in 8x8 matrix
                for j=1:8
                    A(i,j) = img(i+8*(c-1),j+8*(r-1));
                end
            end
            A = HT*A*H; % Compressing image matrix and updating compressed image matrix
            for i=1:8
                for j=1:8
                    comp_img_ll(i+8*(c-1),j+8*(r-1)) = A(i,j);
                end
            end
            A = HT_inv*A*H_inv;
            for i=1:8 % Decompressing and updating the compressed image martix
                for j=1:8
                    uncomp_img_ll(i+8*(c-1),j+8*(r-1)) = A(i,j);
                end
            end
        end
    end
    imwrite(uncomp_img_ll,"comp_img_lossless.jpg") % Saving image file locally
    comp_name = "comp_img_lossless.jpg";
    comp_file=imfinfo(comp_name); % Getting file size of compressed image
    comp_file_sz=comp_file.FileSize;
    fprintf('File size of decompressed image (in bytes): %f\n', comp_file_sz); 
    
end