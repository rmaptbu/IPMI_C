counter=0;
for j=0:9
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
                options=['-maxit',' ',num2str(it),' -ln',' ',num2str(ln), ' -lp',' ',num2str(lp),str];
                appendix=['_it',num2str(it),'_ln',num2str(ln),'_lp',num2str(lp),'_option',num2str(option)];
                
                refimage=strcat(group,'_',num2str(i),'_',scantime,'.nii');
                floatimage=strcat('template_',num2str(j),'.nii');
                floatsegment=strcat('template_',num2str(j),'_brain.nii');
                RegisterImage(refimage,floatimage,floatsegment,options,appendix);
                counter=counter+1;
            end
        end
    end
end

