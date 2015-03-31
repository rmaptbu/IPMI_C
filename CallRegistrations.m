t=[];
for it=200:100:500
    for ln=1:2:5
        for lp=ln
            for option=[2,4]
                if option==1
                    str=' -nopy';
                elseif option==2
                    str=' -noConj';
                elseif option==3
                    str=' -noConj -nopy';
                else
                    str=[];
                end
                options=['-maxit',' ',num2str(it),' -ln',' ',num2str(ln), ' -lp',' ',num2str(lp),str];
                appendix=['_it',num2str(it),'_ln',num2str(ln),'_lp',num2str(lp),'_option',num2str(option)];
                counter=0;
                for j=1:9                    
                    refimage=strcat('template_0.nii');
                    floatimage=strcat('template_',num2str(j),' .nii');
                    floatsegment=strcat('template_',num2str(j),'_brain.nii');
                    tic
                    RegisterImage(refimage,floatimage,floatsegment,options,appendix);
                    d=toc;
                    t=cat(1,t,d);
                    counter=counter+1; 
                    counter/216
                end 
            end
        end
    end
end

