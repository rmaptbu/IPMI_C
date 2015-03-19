function [I1,I2,I3] = CreateDifferenceImages(image1, image2)
%Convert Nifti file into array
Im1=nifti(image1);
Im2=nifti(image2);
Im1=numeric(Im1.dat);
Im2=numeric(Im2.dat);

Im_diff=Im2-Im1;
I1=imrotate(fliplr(squeeze(Im_diff(120,:,:))),-90);
I2=imrotate(fliplr(squeeze(Im_diff(:,60,:))),-90);
I3=imrotate(fliplr(squeeze(Im_diff(:,:,155))),-90);