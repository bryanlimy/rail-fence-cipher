function cipher = encryptRailFence(text,key,replace_space)
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
    EmptyCell = [];
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
