function [] = compare_diff_methods(img_)

    img = img_;
    
    % spatial orientation tree wavelet ('stw') compression method 
    load mask; 
    [cr,bpp] = wcompress('c',img,'comp_arms.wtc','stw');
    img_spiht = wcompress('u','comp_arms.wtc');
    psnr_stw=psnr(img_spiht, img);
    fprintf('PSNR Value for STW: %d\n\n', psnr_stw);
    
    % set partitioning in hierarchical trees ('spiht') compression method
    load mask; 
    [cr,bpp] = wcompress('c',img,'mask.wtc','spiht','maxloop',12);
    img_spiht = wcompress('u','mask.wtc');
    psnr_spiht=psnr(img_spiht, X);
    fprintf('PSNR Value fof SPIHT: %d\n\n', psnr_spiht);
    % refer https://www.mathworks.com/help/wavelet/ref/wcompress.html
end