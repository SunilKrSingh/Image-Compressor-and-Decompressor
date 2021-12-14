Guide to run the code:

1. Run main_gray.m
   Enter Filename:- mandi.tif (color image will also be accepted but grayscale will be considered)
   Get desired output

2. Run main_colors.m
   Enter Filename:- peppers.png (grayscale image will not be accepted)
   Get desired output

(both are demo inbuilt images in MATLAB so it should work without downloading or uploading them to the workspace)
(Also other image testing works well, algorithm has no restriction like size should be of power 2, etc which is )

Help files/functions created:-

> main_gray.m
	Prompts filename from user (Please enter the path w.r.t main_gray.m file destination or keep the test image in the same folder.)
	Reads image.
	Convert to gray scale if not.
	Calculate size of input image.
	Calls the function lossy_haar(img).
	Calls the function show_plots(img, uncomp_img, name)
	Calls the function compare_haar()
	Calls the function lossless_haar(img)
	Calls show_plots() followed by compare_haar()
	Calls the function compare_diff_methods(img)
	  (All these functions are described below)

> lossy_haar(img)
	Takes the image as input
	Returns compressed and decompressed image along with the file size of final image.
	(Uses algorithm for lossy compression)

> show_plots(img_, uncomp_img_, name)
	Takes image and uncompressed image along with type of compression lossy/lossless applied.
	Outputs the original and decompressed plots.

> compare_haar(img, comp_img, uncomp_img)
	Takes image, compressed image and uncompressed image as input.
	Outputs the number of non zeros in original and compressed images, compression ratio and psnr values. For lossless psnr should be inf.

> lossless_haar(img)
	Takes the image as input
	Returns compressed and decompressed image along with the file size of final image.
	(Uses algorithm for lossless compression)

> compare_diff_methods(img)
	Takes image as input.
	Outputs the psnr values of MATLAB inbuilt function wcompress, so as to compare results with the main_gray outputs.

> main_colors.m
	Prompts filename from user (Please enter the path w.r.t main_colors.m file destination or keep the test image in the same folder.)
	Reads image.
	Check if it is color image or not
	Calculate size of input image.
	Calls the function color_lossy(img).
	Calls the function color_lossless(img).

> color_lossy(img)
	Takes image as input.
	Calls the lossy_haar(img) for different color channels and store the output in respective image channels.
	Outputs the compressed and decompressed images, size of decompressed images, and shows the plots.

> color_lossless(img)
	Takes image as input.
	Calls the lossless_haar(img) for different color channels and store the output in respective image channels.
	Outputs the compressed and decompressed images, size of decompressed images, and shows the plots.

- The other images added in this zip file are outputs for grayscale and color images for lossy and lossless compression.
- Thank you!