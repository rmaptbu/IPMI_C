% [I1,I2,I3] = CreateDifferenceImages('AD_0_baseline.nii', 'ref_AD_0__flo_temp0_nrr_2pass100it_noConj.nii');
% figure(1);
% axis square;
% title('2 pass')
% subplot(1,3,1);
% colormap Gray;
% imagesc(I1)
% subplot(1,3,2);
% imagesc(I2)
% subplot(1,3,3);
% imagesc(I3)
% colorbar
% 
% [I1,I2,I3] = CreateDifferenceImages('AD_0_baseline.nii', 'ref_AD_0__flo_temp0_nrr_2pass100it.nii');
% figure(2);
% axis square;
% title('3 pass')
% subplot(1,3,1);
% colormap Gray;
% imagesc(I1)
% subplot(1,3,2);
% imagesc(I2)
% subplot(1,3,3);
% imagesc(I3)
% colorbar


figure1 = figure;
sb1=subplot(2,1,1,'Parent',figure1,'XGrid','on','XTick',[0 9 18 27 36 45 54]);
box(sb1,'on');
hold(sb1,'on');
plot(t(1:54),'.-'); hold on; 
plot(t(55:108),'.-'); 
plot(t(109:162),'.-'); 
plot(t(163:216),'.-'); hold off
xlim(sb1,[1 54]);

sb2=subplot(2,1,2,'XGrid','on','XTick',[0 9 18 27 36 45 54]);
box(sb2,'on');
hold(sb2,'on');
plot(dice(1:54),'.-'); hold on; 
plot(dice(55:108),'.-');
plot(dice(109:162),'.-'); 
plot(dice(163:216),'.-'); hold off;
xlim(sb2,[1 54]);
 