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

sb1=subplot(2,3,1,'Parent',figure1,'XGrid','on');
box(sb1,'on');
hold(sb1,'on');
plot(t0(1:9),'.-'); hold on; 
plot(t0(28:36),'.-'); 
plot(t0(55:63),'.-'); 
plot(t0(82:90),'.-'); hold off
xlim(sb1,[1 9]);
ylim(sb1,[50 300]);
ax = gca;
ax.XTick = 1:9;

sb2=subplot(2,3,2,'Parent',figure1,'XGrid','on');
box(sb2,'on');
hold(sb2,'on');
plot(t0(10:18),'.-'); hold on; 
plot(t0(37:45),'.-'); 
plot(t0(64:72),'.-'); 
plot(t0(91:99),'.-'); hold off
xlim(sb2,[1 9]);
ylim(sb2,[50 300]);
ax = gca;
ax.XTick = 1:9;

sb3=subplot(2,3,3,'Parent',figure1,'XGrid','on');
box(sb3,'on');
hold(sb3,'on');
plot(t0(19:27),'.-'); hold on; 
plot(t0(46:54),'.-'); 
plot(t0(73:81),'.-'); 
plot(t0(100:108),'.-'); hold off
xlim(sb3,[1 9]);
ylim(sb3,[50 300]);
ax = gca;
ax.XTick = 1:9;

sb4=subplot(2,3,4,'Parent',figure1,'XGrid','on');
box(sb4,'on');
hold(sb4,'on');
plot(dice0(1:9),'.-'); hold on; 
plot(dice0(28:36),'.-'); 
plot(dice0(55:63),'.-'); 
plot(dice0(82:90),'.-'); hold off
xlim(sb4,[1 9]);
ylim(sb4,[.895 .93]);
ax = gca;
ax.XTick = 1:9;

sb5=subplot(2,3,5,'Parent',figure1,'XGrid','on');
box(sb5,'on');
hold(sb5,'on');
plot(dice0(10:18),'.-'); hold on; 
plot(dice0(37:45),'.-'); 
plot(dice0(64:72),'.-'); 
plot(dice0(91:99),'.-'); hold off
xlim(sb5,[1 9]);
ylim(sb5,[.895 .93]);
ax = gca;
ax.XTick = 1:9;

sb6=subplot(2,3,6,'XGrid','on');
box(sb6,'on');
hold(sb6,'on');
plot(dice0(19:27),'.-'); hold on; 
plot(dice0(46:54),'.-');
plot(dice0(73:81),'.-'); 
plot(dice0(100:108),'.-'); hold off;
xlim(sb6,[1 9]);
ylim(sb6,[.895 .93]);
ax = gca;
ax.XTick = 1:9;

