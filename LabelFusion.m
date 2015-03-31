
ref='template_0_brain.nii';
ref=nifti(ref);
ref=numeric(ref.dat);
labels=[];

%load labels
for i=1:9
    label=strcat('template_',num2str(i),'_brain.nii');
    label=nifti(label);
    label=numeric(label.dat);
    labels=cat(4,label,labels);
end
%majority voting
sum_labels=sum(labels,4);
label_fusion=zeros(size(sum_labels));
label_fusion(sum_labels>4)=1; %5 or more voted for that voxel

%calculate dice score
common=sum(sum(sum(label_fusion & ref)));
dice=2*common/(sum(sum(sum(label_fusion)))+(sum(sum(sum(ref)))));