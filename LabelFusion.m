
ref='template_0_brain.nii';
ref=nifti(ref);
ref=numeric(ref.dat);
refi='template_0.nii';
refi=nifti(refi);
refi=numeric(refi.dat);
u=0;
nmi0=[];
%load labels
labels_withoptions=[];
labels=[];
for it=300
    for ln=3
        for lp=ln
            for option=4
                if option==1
                    str=' -nopy';
                elseif option==2
                    str=' -noConj';
                elseif option==3
                    str=' -noConj -nopy';
                else
                    str=[];
                end
%                 labels=[];
                for j=1:9
                    appendix=['_it',num2str(it),'_ln',num2str(ln),'_lp',num2str(lp),'_option',num2str(option)];                    
                    floatimage=strcat('template_',num2str(j),'.nii');
%                     registered_segment=strcat('ref_',refimage(7:10),'_flo_',floatimage(1:5),floatimage(10),'_brain',appendix,'.nii');
                    label=nifti(floatimage);
                    label=numeric(label.dat);
%                     labels=cat(4,label,labels);
                    %calculate dice score
%                     common=sum(sum(sum(label & ref)));
                    u=u+1 
                    nmi0=cat(1,nmi0,jointEntropy(refi,label));
%                     dice(x)=2*common/(sum(sum(sum(label)))+(sum(sum(sum(ref)))));
                end
%                 labels_withoptions=cat(5,labels,labels_withoptions);
            end
        end
    end
end


% %majority voting
% sum_labels=sum(labels,4);
% label_fusion=zeros(size(sum_labels));
% label_fusion(sum_labels>4)=1; %5 or more voted for that voxel

%calculate dice score
% for i=1:216
%     common=sum(sum(sum(squeeze(labels(:,:,:,i)) & ref)));
%     dice(i)=2*common/(sum(sum(sum(squeeze(labels(:,:,:,i)))))+(sum(sum(sum(ref)))));
% end
