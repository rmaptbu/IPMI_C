function [I1,I2,I3] = CreateDifferenceImages(Im1, Im2)
%Convert Nifti file into array
if isa(Im1,'char')
Im1=nifti(Im1);
Im1=numeric(Im1.dat);
end
if isa(Im2,'char')
Im2=nifti(Im2);
Im2=numeric(Im2.dat);
end

Im_diff=Im2-Im1;
I1=imrotate(fliplr(squeeze(Im_diff(120,:,:))),-90);
I2=imrotate(fliplr(squeeze(Im_diff(:,60,:))),-90);
I3=imrotate(fliplr(squeeze(Im_diff(:,:,155))),-90);