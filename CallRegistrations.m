t=[];
for it=100:100:500
    for ln=1:5
        for lp=1:ln
            for option=[1,2,3,4]
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
                tic
                RegisterImage('AD_0_baseline.nii','template_0.nii','template_0_brain.nii',options,appendix);
                d=toc;
                t=cat(1,t,d);
            end
        end
    end
end
                
                    