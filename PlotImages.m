[I1,I2,I3] = CreateDifferenceImages('AD_0_baseline.nii', 'ref_AD_0__flo_temp0_nrr_2pass100it_noConj.nii');
figure(1);
axis square;
title('2 pass')
subplot(1,3,1);
colormap Gray;
imagesc(I1)
subplot(1,3,2);
imagesc(I2)
subplot(1,3,3);
imagesc(I3)
colorbar

[I1,I2,I3] = CreateDifferenceImages('AD_0_baseline.nii', 'ref_AD_0__flo_temp0_nrr_2pass100it.nii');
figure(2);
axis square;
title('3 pass')
subplot(1,3,1);
colormap Gray;
imagesc(I1)
subplot(1,3,2);
imagesc(I2)
subplot(1,3,3);
imagesc(I3)
colorbar
 