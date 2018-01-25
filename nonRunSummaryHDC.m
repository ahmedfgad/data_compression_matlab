function nr_end = nonRunSummary(str, nr_start)
index=nr_start;
limit=1;%This variable is used to check whether the length of the run <=255.
while index<length(str)-1
    if str(index)~=str(index+1)&str(index+1)~=str(index+2)
        if index+1==length(str) | limit==62
            nr_end=index+1;
            return;
        else
            index=index+1;
        end
    else
        nr_end=index;
        return;
    end
    limit=limit+1;
end
nr_end=index+1;
end

