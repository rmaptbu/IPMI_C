
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


% figure1 = figure;
%
% sb1=subplot(2,3,1,'Parent',figure1,'XGrid','on');
% box(sb1,'on');
% hold(sb1,'on');
% plot(t0(1:9),'.-'); hold on; 
% plot(t0(28:36),'.-'); 
% plot(t0(55:63),'.-'); 
% plot(t0(82:90),'.-'); hold off
% xlim(sb1,[1 9]);
% ylim(sb1,[50 300]);
% ax = gca;
% ax.XTick = 1:9;
% 
% sb2=subplot(2,3,2,'Parent',figure1,'XGrid','on');
% box(sb2,'on');
% hold(sb2,'on');
% plot(t0(10:18),'.-'); hold on; 
% plot(t0(37:45),'.-'); 
% plot(t0(64:72),'.-'); 
% plot(t0(91:99),'.-'); hold off
% xlim(sb2,[1 9]);
% ylim(sb2,[50 300]);
% ax = gca;
% ax.XTick = 1:9;
% 
% sb3=subplot(2,3,3,'Parent',figure1,'XGrid','on');
% box(sb3,'on');
% hold(sb3,'on');
% plot(t0(19:27),'.-'); hold on; 
% plot(t0(46:54),'.-'); 
% plot(t0(73:81),'.-'); 
% plot(t0(100:108),'.-'); hold off
% xlim(sb3,[1 9]);
% ylim(sb3,[50 300]);
% ax = gca;
% ax.XTick = 1:9;

% for j=1:10
%     data=[dice_raw(j,1:j-1),dice_raw(j,j+1:end)];
%     dice_raw_mean(j)=mean(data);
%     dice_raw_std(j)=std(data);
% end

% Create figure
figure(1);
axes1 = axes('Parent',figure(1),'XGrid','on','FontName','Times New Roman');
xlim(axes1,[1 10]);
box(axes1,'on');
hold(axes1,'on');
errorbar(dice_raw_mean,dice_raw_std,'DisplayName','No Fusion','Marker','.');
% Create multiple lines using matrix input to plot
plot1 = plot(dice_5,'Marker','.');
plot2 = plot(dice_6,'Marker','.');
set(plot1,'DisplayName','50% Majority');
set(plot2,'DisplayName','60% Majority');
% Create xlabel
xlabel({'Template Image Number'},'FontSize',11);
% Create ylabel
ylabel({'Dice Score'},'FontSize',11);
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.14 0.186 0.21 0.14]);
hold off

[I1,I2,I3] = CreateDifferenceImages('template_0_brain.nii', 'ref_te_0_flo_templ1_brain_it300_ln3_lp3_option4.nii');
figure(2);
axes2 = axes('Parent',figure(2),'YTickLabel',{'','','','',''},...
    'XTickLabel',{'','','','','',''},...
    'Layer','top',...
    'YDir','reverse',...
    'FontName','Times New Roman');
hold(axes2,'on');box(axes2,'on');
axis image

colormap Gray;
imagesc(I1(40:end-40,:))

[I1,I2,I3] = CreateDifferenceImages('template_0_brain.nii',squeeze(label_fusions_6(:,:,:,10)));
figure(3);
axes3 = axes('Parent',figure(3),'YTickLabel',{'','','','',''},...
    'XTickLabel',{'','','','','',''},...
    'Layer','top',...
    'YDir','reverse',...
    'FontName','Times New Roman');
hold(axes3,'on');box(axes3,'on');
axis image
title('fusion')
colormap Gray;
imagesc(I1(40:end-40,:))

[I1,I2,I3] = CreateDifferenceImages('template_9_brain.nii',squeeze(label_fusion));
figure(4);
axes4 = axes('Parent',figure(4),'YTickLabel',{'','','','',''},...
    'XTickLabel',{'','','','','',''},...
    'Layer','top',...
    'YDir','reverse',...
    'FontName','Times New Roman');
hold(axes4,'on');box(axes4,'on');
axis image
title('fusion')
colormap Gray;
imagesc(I1(40:end-40,:))



    