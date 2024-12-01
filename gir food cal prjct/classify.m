function [circle] = classify(para)

c_no = 1;           
c_mount = 0;      

[height,length] = size(para);
is_read = length;  

circle = [];        
temp = [0;0;0];    
array_flag = zeros(1,length);   
start = 1;  


while(is_read > 0)
    for i=1:length
        if(array_flag(i) == 0 & start == 1)  
            circle = [circle para(:,i)];  
            array_flag(i) = 1;
            c_mount = 1;
            start = 0;
            is_read = is_read - 1;

        else
            if(array_flag(i) == 0)
                if(abs(para(1,i)-circle(1,c_no))<=10.0 & abs(para(2,i)-circle(2,c_no))<=10.0)
                    temp(:,1) = temp(:,1) + para(:,i);
                    c_mount = c_mount + 1;
                    is_read = is_read - 1;
                    array_flag(i) = 1;
                end
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(c_mount > 0)
        circle(:,c_no) = circle(:,c_no) + temp(:,1);
        circle(:,c_no) = circle(:,c_no) ./ c_mount;   
                                                     
        c_no = c_no + 1;
    end
      start = 1;
    c_mount = 0;
    temp = [0;0;0];
end































        
