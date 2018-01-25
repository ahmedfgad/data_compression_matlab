clear all;clc
str='abcdefghijklmnopqrstuvwxyraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaeabcdefghijklkabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyhabcdefghijklmnopqrstuvwxyabcdefghnabcdefghijklmnopqrstuvwxyabcdefghijklkabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyhabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxymnopqrstuvwxyhabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxypijklmnopqrstuvwxymnopqrstuvwxyhabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxy';
str=upper(str);
fprintf('%s\n',str);

index=1;
currChar=1;
rStart=1;%Start of the run.
rEnd=1;%End of the run.

%% In case that the string contains only one character.
if length(str)==1
    disp(['n1',str]);
    return;
end

%% In case that the string contains more than one character.
while index<length(str)
    if str(index)==str(index+1)%Run occurs.
        index = runSummary(str, rStart);%Example, if str=aaa then arg. rStart=1 and returned value index=3.
        disp(['r',num2str(index-rStart+1),str(rStart)]);
        rStart=index+1;
    elseif str(index)~=str(index+1)&str(index+1)~=str(index+2)%Non run occurs.
        index = nonRunSummary(str, rStart);%Example, if str=abc then arg. rStart=1 and returned value index=3.
        disp(['n',num2str(index-rStart+1),str(rStart:index)]);
        rStart=index+1;
    elseif str(index)~=str(index+1)&str(index+1)==str(index+2)%Example, if str=abb,then only a will be regarded non run & display n1a.
        disp(['n1',str(index)]);
    end
    index=index+1;
end
