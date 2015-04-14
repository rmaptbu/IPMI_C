i=0;
j=0;
for it=200:100:500
    for ln=1:2:5
        for option=[2,4]
            if option==2
                str=' -noConj';
                i=i+9;
            else
                for loop=1:9
                j=j+1;
                i=i+1;
                dice0(j)=dice(i);
                end
            end
        end
    end
end