t=[];
counter=0;
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
                options=['-maxit',' ',num2str(it),' -ln',' ',num2str(ln), ' -lp',' ',num2str(lp),str];
                appendix=['_it',num2str(it),'_ln',num2str(ln),'_lp',num2str(lp),'_option',num2str(option)];
                
                for j=1:9                    
                    refimage=strcat('template_',num2str(j),'.nii');
                    for i=0:9
                        counter=counter+1;
                        if i~=j
                            floatimage=strcat('template_',num2str(i),'.nii');
                            floatsegment=strcat('template_',num2str(i),'_brain.nii');
                            tic
                            RegisterImage(refimage,floatimage,floatsegment,options,appendix);
                            d=toc;
                            t=cat(1,t,d);
                            
                            counter/72
                        end
                    end
                end 
            end
        end
    end
end

