function  rEnd = runSummary(str, rStart)
index=rStart;
limit=1;%This variable is used to check whether the length of the run <=255.
while index<length(str)
    if str(index)==str(index+1)
        if index+1==length(str) | limit==254
            rEnd=index+1;
            return;
        else
            index=index+1;
        end
    else
        rEnd=index;
        return;
    end
    limit=limit+1;
end
rEnd=index+1;
end
