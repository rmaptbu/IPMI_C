label_fusions=[];
for i=10:14
    for groupi=[0,1]
        for scantimei=[0,1]
            if groupi
                group='AD';
            else
                group='CTL';
            end
            if scantimei
                scantime='baseline';
            else
                scantime='followup';
            end
            for j=0:9
                options=['-maxit',' ','300',' -ln',' ','3', ' -lp',' ','3'];
                appendix=['_it','300','_ln',num2str(3),'_lp',num2str(3)];
                
                %register and resample floating segmentation
                refimage=strcat(group,'_',num2str(i),'_',scantime,'.nii');
                floatimage=strcat('template_',num2str(j),'.nii');
                floatsegment=strcat('template_',num2str(j),'_brain.nii');
                RegisterImage(refimage,floatimage,floatsegment,options,appendix);
            end
            label_fusion=LabelFusion(refimage,appendix);
            label_fusions=cat(4,label_fusions,label_fusion); %store data
        end
    end
end

