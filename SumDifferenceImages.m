baseimage=nifti('AD_0_baseline.nii');
baseimage=numeric(baseimage.dat);
a=[];
b=[];
c=[];
d=[];
for it=100:100:500
    filename=strcat('ref_AD_0__flo_temp0_nrr__it',num2str(it),'_ln2_lp2_option1.nii');
    image=nifti(filename);
    image=numeric(image.dat);    
    diff=abs(baseimage-image);
    diff_sum=sum(sum(sum(diff)));
    a=cat(1,a,[it, diff_sum]);
end
for it=100:100:500
    filename=strcat('ref_AD_0__flo_temp0_nrr__it',num2str(it),'_ln4_lp4_option1.nii');
    image=nifti(filename);
    image=numeric(image.dat);    
    diff=abs(baseimage-image);
    diff_sum=sum(sum(sum(diff)));
    b=cat(1,b,[it, diff_sum]);
end
for it=100:100:500
    filename=strcat('ref_AD_0__flo_temp0_nrr__it',num2str(it),'_ln2_lp2_option4.nii');
    image=nifti(filename);
    image=numeric(image.dat);    
    diff=abs(baseimage-image);
    diff_sum=sum(sum(sum(diff)));
    c=cat(1,c,[it, diff_sum]);
end
for it=100:100:500
    filename=strcat('ref_AD_0__flo_temp0_nrr__it',num2str(it),'_ln4_lp4_option4.nii');
    image=nifti(filename);
    image=numeric(image.dat);    
    diff=abs(baseimage-image);
    diff_sum=sum(sum(sum(diff)));
    d=cat(1,d,[it, diff_sum]);
end

figure1=figure;
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on');
box(axes1,'on');
hold(axes1,'on');
plot(a(:,1),a(:,2),'.-','DisplayName','-ln2 -lp2 -nopy');
plot(b(:,1),b(:,2),'.-','DisplayName','-ln4 -lp4 -nopy');
plot(c(:,1),c(:,2),'.-','DisplayName','-ln2 -lp2');
plot(d(:,1),d(:,2),'.-','DisplayName','-ln4 -lp4');
xlabel({'Number of Iterations'});
ylabel({'Total Sum of Differences'});
legend(axes1,'show');
