function HDCDecompression(h1,h2,h3,h4,h5)
%[fileName,filePath]=uigetfile('.txt');
%dir=[filePath,fileName];
dir='compText.txt';
fileID = fopen(dir,'rt');%Open for read.
sourceData = textscan(fileID,'%s *[^\n]');
str=cell2mat(sourceData{1,1});
str
index=1;
num=0;
output='';
strr='';
while index<length(str)
    if(str(index)=='r')
        if str(index+2)~='r' & str(index+2)~='n'
            charr=str(index+2);
            num=str2double(str(index+1));
            for k=1:num
                output=strcat(output,str(index+2));
                strr=strcat(strr,str(index+2));
            end
            set(h1,'String',['r' num2str(length(strr)) charr]);
            pause(2);
            set(h2,'String',strr);
            pause(2);
            index=index+3;
            strr='';
            set(h4,'String',output);
            pause(2);
        elseif str(index+2)=='r' | str(index+2)=='n'
            charr=' ';
            num=str2double(str(index+1));
            for k=1:num
                output=strcat(output,'#');
                strr=strcat(strr,'#');
            end
            set(h1,'String',['r' num2str(length(strr)) charr]);
            pause(2);
            set(h2,'String',strr);
            pause(2);
            index=index+2;
            strr='';
            set(h4,'String',output);
            pause(2);
        end
    elseif (str(index)=='n')
        if str(index+2)=='r' | str(index+2)=='n'
            num=str2double(str(index+1));
            for k=1:num
                output=strcat(output,'#');
                strr=strcat(strr,'#');
            end
            set(h1,'String',['n' num2str(length(strr))]);
            pause(2);
            set(h2,'String',strr);
            pause(2);
            index=index+2;
            strr='';
            set(h4,'String',output);
            pause(2);
        else
            %charr=str(index+2);
            num=str2double(str(index+1));
            strr=strcat(strr,str(index+2:index+2+num-1));
            output=strcat(output,str(index+2:index+2+num-1));
            set(h1,'String',['n' num2str(length(strr)) strr]);
            pause(2);
            set(h2,'String',strr);
            pause(2);
            index=index+2+num;
            strr='';
            set(h4,'String',output);
            pause(2);
        end
    elseif str(index)~='r'&str(index)~='n'
        output=strcat(output,str(index:index+1));
        index=index+2;
    end
end
% output
% commandwindow

