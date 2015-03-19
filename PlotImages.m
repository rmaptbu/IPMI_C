[I1,I2,I3] = CreateDifferenceImages('AD_0_baseline.nii', 'ref_AD_0__flo_temp0_nrr.nii');

figure(1);
axis square;
title('Difference Image')
subplot(1,3,1);
colormap Gray;
imagesc(I1)
subplot(1,3,2);
imagesc(I2)
subplot(1,3,3);
imagesc(I3)
