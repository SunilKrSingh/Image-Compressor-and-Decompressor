function [] = compare_haar(img, comp_img, uncomp_img)  
    
    cnt_org = nnz(img); % counting no. of non-zeros in original image
    fprintf('No. of non-zeroes entries in Original Image: %d\n', cnt_org);

    cnt = nnz(comp_img); % counting no. of non-zeros in compressed image
    fprintf('No. of non-zeroes entries in Compressed Image: %d\n', cnt);

    cnt2 = nnz(uncomp_img); % counting no. of non-zeros in compressed image
    fprintf('No. of non-zeroes entries in Decompressed Image: %d\n', cnt2);

    ratio = cnt_org/cnt;
    fprintf('Compression Ratio: %d\n', ratio);

    psnrval=psnr(img,uncomp_img);
    fprintf('PSNR Value: %d\n\n', psnrval);

end
