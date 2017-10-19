function [cipher,RailFence] = encryptRailFence(text,key,replace_space)
    
    %simple to use function
    %[cipher,RailFence] = encryptRailFence('how areU',4,'*')
    %cipher ='he*orU*wa****' % more detail in RailFence variable
    
    text = replace(text,' ',replace_space);
    Railkey = key+1;
    nextText = 1;
    Textlength = length(text);
    
    for i=1:Textlength/key
        if mod(Railkey,key) == 1
            
            for Railkey = 1:key
                if nextText <= Textlength
                    RailFence{Railkey,nextText} = text(nextText);
                else
                    RailFence{Railkey,nextText} = replace_space;
                end
                nextText = nextText+1;
            end
        end
        if mod(Railkey,key) == 0
            for Railkey = key-1:-1:2
                if nextText <= Textlength
                    RailFence{Railkey,nextText} = text(nextText);
                else
                    RailFence{Railkey,nextText} = replace_space;
                end
                Railkey = Railkey-1;
                nextText = nextText+1;
            end
        end
    end
    RailFence{1,size(RailFence,2)+1} = replace_space; 
    cipher = '';
    xsize1 = size(RailFence,1);
    xsize2 = size(RailFence,2);
    for j=1:xsize1
        for i=1:xsize2
           if ~isempty(RailFence{j,i})
               cipher = [cipher RailFence{j,i}];
           end
        end
    end
end