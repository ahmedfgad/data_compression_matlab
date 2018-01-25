function HDC(h1,h2,h3,h4,h5)
%[fileName,filePath]=uigetfile('.txt');
%dir=[filePath,fileName];
%dir='rle.txt';
%fileID = fopen(dir,'rt');%Open for read.
%sourceData = textscan(fileID,'%s *[^\n]');
%str=cell2mat(sourceData{1,1});
str='aaabbjkhhh';%If you want to add space, please write it as # or any special character.
str=upper(str);
set(h5,'String',str);
fprintf('%s\n',str);
index=1;
currChar=1;
rStart=1;%Start of the run.
rEnd=1;%End of the run.
output='';
%% In case that the string contains only one character.
if length(str)==1
    disp(['n1',str]);
    return;
end

%% In case that the string contains more than one character.
while index<length(str)
    %Run occurs in case of HDC if :
    %1)At lease 2 equal spaces detected.
    %2)At lease 3 equal characters (space or others) detected.
    if str(index)==str(index+1)%Run occurs.
        if ( (uint8(str(index))==32 ) | ( ( index+2<=length(str) ) & ( str(index+1)==str(index+2) ) ) )
            index = runSummaryHDC(str, rStart);%Example, if str=aaa then arg. rStart=1 and returned value index=3.
            disp(['r',num2str(index-rStart+1),str(rStart)]);
            tempOut=['r',num2str(index-rStart+1),str(rStart)];
            set(h1,'String',str(rStart:index));
            pause(2);
            set(h2,'String',['r',num2str(index-rStart+1),str(rStart)]);
            pause(2);         %waitforbuttonpress
            output=strcat([output,tempOut]);
            rStart=index+1;
        elseif ( ( index+1==length(str)  ) & ( str(index)==str(index+1) ) ) | ( ( ( index+1<length(str) | ( str(index+1)~=str(index+2) ) ) ) & ( str(index)==str(index+1) ) )
%             disp(str(index:index+1));
%             tempOut=str(index:index+1);
            disp(['n2',str(index:index+1)]);
            tempOut=['n2',str(index:index+1)];
            output=strcat([output,tempOut]);
            set(h1,'String',str(index:index+1));
            pause(2);
            set(h2,'String',['n2',str(index:index+1)]);
            pause(2);         %waitforbuttonpress
            index=index+1;
            rStart=index+1;
        end
        %     elseif ( length(str)==2 & str(index)~=str(index+1) )
        %         disp(['n2',str(index:index+1)]);
        %         tempOut=['n2',str(index:index+1)];
        %         output=strcat([output,tempOut]);
    elseif str(index)~=str(index+1)&str(index+1)~=str(index+2)%Non run occurs.
        index = nonRunSummaryHDC(str, rStart);%Example, if str=abc then arg. rStart=1 and returned value index=3.
        disp(['n',num2str(index-rStart+1),str(rStart:index)]);
        tempOut=['n',num2str(index-rStart+1),str(rStart:index)];
        output=strcat([output,tempOut]);
        set(h1,'String',str(rStart:index));
        pause(2);
        set(h2,'String',['n',num2str(index-rStart+1),str(rStart:index)]);
        pause(2);         %waitforbuttonpress
        rStart=index+1;
    elseif (str(index)~=str(index+1)&str(index+1)==str(index+2) )%Example, if str=abb,then only a will be regarded non run & display n1a.
        disp(['n1',str(index)]);
        tempOut=['n1',str(index)];
        output=strcat([output,tempOut]);
        set(h1,'String',str(index));
        pause(2);
        set(h2,'String',['n1',str(index)]);
        pause(2);         %waitforbuttonpress
        rStart=index+1;
    end
    if (index+1==length(str))
        disp(['n1',str(index+1)]);
        tempOut=['n1',str(index+1)];
        output=strcat([output,tempOut]);
        set(h1,'String',str(index+1));
        pause(2);
        set(h2,'String',['n1',str(index+1)]);
        pause(2);         %waitforbuttonpress
    end
    set(h4,'String',output);
    pause(2);
    index=index+1;
end
%fclose(fileID);
fileID = fopen('compText.txt','wt');
fprintf(fileID,'%s',output);
%uiopen('compText.txt', true);
fclose(fileID);
% output
% commandwindow