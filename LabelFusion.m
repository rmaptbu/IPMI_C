label_fusions=[];
for j=0:9
    j
    labels=[];    
    
    refstr=strcat('template_',num2str(j),'_brain.nii');
    refI=strcat('template_',num2str(j),'.nii');
    ref=nifti(refstr);
    ref=numeric(ref.dat);
    refI=nifti(refI);
    refI=numeric(refI.dat);
    for i=0:9 %for each template
        %load labels
        if i~=j
            %Load nifti files
            appendix=['_it',num2str(300),'_ln',num2str(3),'_lp',num2str(3),'_option',num2str(4)];
            floatimage=strcat('template_',num2str(i),'.nii');
            registered_segment=strcat('ref_',refstr(7:10),'_flo_',floatimage(1:5),floatimage(10),'_brain',appendix,'.nii');
            registered_image=strcat('ref_',refstr(7:10),'_flo_',floatimage(1:5),floatimage(10),'_nrr',appendix,'.nii');
            
            %Convert label to array
            label=nifti(registered_segment);
            label=numeric(label.dat);
            
            %find nmi
            registered_image=nifti(registered_image);
            registered_image=numeric(registered_image.dat);
            weight(j+1,i+1)=(entropy(refI)+entropy(registered_image))/JointEntropy(refI,registered_image);
            
            %Store labels (comment out one line to toggle weighting)
            labels=cat(4,label*(weight(j+1,i+1)),labels);            
%             labels=cat(4,labels,label);
            
            %dice score
            common=sum(sum(sum(label & ref)));
            dice_raw(j+1,i+1)=2*common/(sum(sum(sum(label)))+(sum(sum(sum(ref)))));
        end
    end 
    %majority voting
    sum_labels=sum(labels,4);
    max_consensus=max(max(max(sum_labels)));
    
    label_fusion=zeros(size(sum_labels));
    label_fusion(sum_labels>0.5*max_consensus)=1; % 50% or more voted for that voxel

    label_fusions=cat(4,label_fusions,label_fusion); %store data
    
    %calculate dice score
    common=sum(sum(sum(label_fusion & ref)));
    dice_f(j+1)=2*common/(sum(sum(sum(label_fusion)))+(sum(sum(sum(ref)))));
end


