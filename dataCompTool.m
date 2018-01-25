function varargout = dataCompTool(varargin)
% DATACOMPTOOL MATLAB code for dataCompTool.fig
%      DATACOMPTOOL, by itself, creates a new DATACOMPTOOL or raises the existing
%      singleton*.
%
%      H = DATACOMPTOOL returns the handle to a new DATACOMPTOOL or the handle to
%      the existing singleton*.
%
%      DATACOMPTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATACOMPTOOL.M with the given input arguments.
%
%      DATACOMPTOOL('Property','Value',...) creates a new DATACOMPTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dataCompTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dataCompTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dataCompTool

% Last Modified by GUIDE v2.5 14-May-2014 06:24:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @dataCompTool_OpeningFcn, ...
    'gui_OutputFcn',  @dataCompTool_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before dataCompTool is made visible.
function dataCompTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dataCompTool (see VARARGIN)

% Choose default command line output for dataCompTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dataCompTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dataCompTool_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
task2


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
task1

% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tasks345


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
selectedIndex=get(handles.popupmenu1,'Value');
set(handles.popupmenu1,'Visible','off');
set(handles.text7,'Visible','off');

set(handles.text5,'Visible','on');
%pause
waitforbuttonpress
set(handles.text2,'Visible','on');
set(handles.text3,'Visible','on');
set(handles.text4,'Visible','on');
set(handles.text1,'Visible','on');
switch selectedIndex
    %%
    case 1
        [fileName,filePath]=uigetfile('.txt');
        dir=[filePath,fileName];
        
        %%
        fileID = fopen(dir,'rt');%Open for read.
        sourceData = textscan(fileID,'%s *[^\n]');
        codedMessage = sourceData{1,1}{1};
        set(handles.text5,'String',codedMessage);
        pause(2);
        code = cell(1,size(codedMessage,2));
        %% Testing each read character and obtain its coressponding code.
        strr='';
        for index=1:size(codedMessage,2)%length(codedMessage)==size(codedMessage,2)
            set(handles.text1,'String',codedMessage(index));
            pause(2);
            switch codedMessage(index)
                case {'a','A'}
                    code(1,index)={'000'};%Equivelant to  code(1,1)=mat2cell('000');
                case {'b','B'}
                    code(1,index)={'001'};
                case {'c','C'}
                    code(1,index)={'101'};
                case {'d','D'}
                    code(1,index)={'110'};
                case {'e','E'}
                    code(1,index)={'111'};
            end
            set(handles.text2,'String',code(1,index));
            pause(2);
            strr=strcat(strr,code(1,index));
            set(handles.text4,'String',strr);
            pause(2);
        end
        finalCode=[];
        for k=1:length(code)
            if k<length(code)
                code{1,k}=[code{1,k}];
            end
            finalCode=strcat(finalCode,code(k));
        end
        fclose(fileID);
        
        %% Now, after computing the code of the data, I`ll write the code to another file.
        fileID = fopen('codedMessage.txt','wt');%Open for write.
        fprintf(fileID,'%s',finalCode{1,1});
        fclose(fileID);
        
        %% Read the code written, and restore the original data.
        set(handles.text5,'String','Click = Decode');
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        waitforbuttonpress
        fileID = fopen('codedMessage.txt','rt');
        fd = textscan(fileID,'%s');
        restoredData=cell(1,size(fd{1,1}{1},2)/3);
        %Now, intialize 2 variables to be able to split the code read into portions ,3 numbers each.
        beginIndex=-2;
        endIndex=0;
        set(handles.text5,'String',fd{1,1}{1});
        pause(2);
        codeWidth=size(fd{1,1}{1},2);
        CW=codeWidth;
        for k=1:codeWidth/3
            beginIndex=beginIndex+3;
            endIndex=endIndex+3;
            restoredData{k}=fd{1,1}{1}(beginIndex:endIndex);
        end
        codess=restoredData;
        fdd=fd;
        for k=1:8
            if mod(CW,8)~=0%CW=codeWidth
                CW=CW+1;
                fdd{1,1}{1}(CW:CW)=num2str(0);
            else
                break;
            end
        end
        
        %Now, intialize 2 variables to be able to split the code read into bytes.
        beginIndex=-7;
        endIndex=0;
        dataBytes=[];
        for k=1:CW/8
            beginIndex=beginIndex+8;
            endIndex=endIndex+8;
            dataBytes{1,k}=fdd{1,1}{1}(beginIndex:endIndex);
        end
        
        dataBytesArray=[];
        for k=1:size(dataBytes,2)
            dataBytesArray=strcat(dataBytesArray,[dataBytes{1,k},',']);
        end
        
        restoredDataArray=[];
        for k=1:codeWidth/3
            restoredDataArray=strcat(restoredDataArray,[restoredData{k},',']);
        end
        strr='';
        for index=1:codeWidth/3%length(codedMessage)==size(codedMessage,2)
            set(handles.text1,'String',codess{index});
            pause(2);
            switch restoredData{index}
                case {'000'}
                    restoredData{index}='a';%Equivelant to  code(1,1)=mat2cell('000');
                case {'001'}
                    restoredData{index}='b';
                case {'101'}
                    restoredData{index}='c';
                case {'110'}
                    restoredData{index}='d';
                case {'111'}
                    restoredData{index}='e';
            end
            set(handles.text2,'String',restoredData{index});
            pause(2);
            strr=strcat(strr,restoredData{index});
            set(handles.text4,'String',strr);
            pause(2);
        end
        fclose(fileID);
        
        %%
        fileID = fopen('codedMessage.txt','at');
        fprintf(fileID,'\n\nCode can be represented simply in this form ==> "%s"\n',restoredDataArray);
        
        restoredCharsDataArray=[];
        for k=1:size(restoredData,2)
            restoredCharsDataArray=strcat(restoredCharsDataArray,[restoredData{k},',']);
        end
        fprintf(fileID,'\nRestored characters are as folows ==> "%s"\n',restoredCharsDataArray);
        
        fprintf(fileID,'\nBytes found in the code ==> "%s"\n',dataBytesArray);
        fclose(fileID);
        
        uiopen('codedMessage.txt', true);
        
        set(handles.text5,'String','Click To Continue');
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        waitforbuttonpress
        set(handles.text1,'Visible','off');
        set(handles.text2,'Visible','off');
        set(handles.text3,'Visible','off');
        set(handles.text4,'Visible','off');
        set(handles.text5,'Visible','off');
        set(handles.popupmenu1,'Visible','On');
        set(handles.text7,'Visible','On');
        
    case 2
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        set(handles.text5,'String','Click = Encode');
        RLETest(handles.text1,handles.text2,handles.text3,handles.text4,handles.text5);
        set(handles.text5,'String','Click = Decode');
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        waitforbuttonpress
        RLEDecompression(handles.text1,handles.text2,handles.text3,handles.text4,handles.text5);
        set(handles.text5,'String','Click To Continue');
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        waitforbuttonpress
        set(handles.text1,'Visible','off');
        set(handles.text2,'Visible','off');
        set(handles.text3,'Visible','off');
        set(handles.text4,'Visible','off');
        set(handles.text5,'Visible','off');
        set(handles.popupmenu1,'Visible','On');
        set(handles.text7,'Visible','On');
    case 3
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        set(handles.text5,'String','Click = Encode');
        HDC(handles.text1,handles.text2,handles.text3,handles.text4,handles.text5);
        set(handles.text5,'String','Click = Decode');
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        waitforbuttonpress
        HDCDecompression(handles.text1,handles.text2,handles.text3,handles.text4,handles.text5);
        set(handles.text5,'String','Click To Continue');
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        waitforbuttonpress
        set(handles.text1,'Visible','off');
        set(handles.text2,'Visible','off');
        set(handles.text3,'Visible','off');
        set(handles.text4,'Visible','off');
        set(handles.text5,'Visible','off');
        set(handles.popupmenu1,'Visible','On');
        set(handles.text7,'Visible','On');

    case 4
        
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        set(handles.text5,'String','Click = Encode');
        
        codedMessage='my name is ahmed and i am from egypt';
        set(handles.text5,'String',codedMessage);
        code = cell(1,size(codedMessage,2));
        %% Testing each read character and obtain its coressponding code.
        strr='';
        for index=1:size(codedMessage,2)%length(codedMessage)==size(codedMessage,2)
            set(handles.text1,'String',codedMessage(index));
            switch codedMessage(index)
                case {'a','A'}
                    code(1,index)={'001'};%Equivelant to  code(1,1)=mat2cell('000');
                case {'d','D'}
                    code(1,index)={'0100'};
                case {'e','E'}
                    code(1,index)={'1110'};
                case {'f','F'}
                    code(1,index)={'01100'};
                case {'g','G'}
                    code(1,index)={'01110'};
                case {'h','H'}
                    code(1,index)={'01111'};
                case {'i','I'}
                    code(1,index)={'0101'};
                case {'m','M'}
                    code(1,index)={'110'};
                case {'n','N'}
                    code(1,index)={'11110'};
                case {'o','O'}
                    code(1,index)={'01101'};
                case {'r','R'}
                    code(1,index)={'00000'};
                case {'p','P'}
                    code(1,index)={'00010'};
                case {'s','S'}
                    code(1,index)={'00011'};
                case {'t','T'}
                    code(1,index)={'00001'};
                case {'y','Y'}
                    code(1,index)={'11111'};
                case {' '}
                    code(1,index)={'10'};
            end
            set(handles.text2,'String',code(1,index));
            pause(.6);
            strr=strcat(strr,code(1,index));
            set(handles.text4,'String',strr);
            pause(.6);
        end
        finalCode=[];
        for k=1:length(code)
            if k<length(code)
                code{1,k}=[code{1,k}];
            end
            finalCode=strcat(finalCode,code(k));
        end
        %fclose(fileID);
        
        %% Now, after computing the code of the data, I`ll write the code to another file.
        fileID = fopen('codedMessage.txt','wt');%Open for write.
        fprintf(fileID,'%s',finalCode{1,1});
        fclose(fileID);
        
        %% Read the code written, and restore the original data.
        fileID = fopen('codedMessage.txt','rt');
        fd = textscan(fileID,'%s');
        %restoredData=cell(1,size(fd{1,1}{1},2)/3);
        restoredData={};
        %Now, intialize 2 variables to be able to split the code read into portions ,3 numbers each.
        beginIndex=1;
        endIndex=2;
        
        codeWidth=size(fd{1,1}{1},2);
        CW=codeWidth;
        k=1;
        codeFound=1;
        codeNum=1;
        while k<=codeWidth
            tempCode=fd{1,1}{1}(beginIndex:k);
            switch tempCode
                case {'001'}
                    restoredData{codeNum}=tempCode;%Equivelant to  code(1,1)=mat2cell('000');
                case {'0100'}
                    restoredData{codeNum}=tempCode;
                case {'1110'}
                    restoredData{codeNum}=tempCode;
                case {'01100'}
                    restoredData{codeNum}=tempCode;
                case {'01110'}
                    restoredData{codeNum}=tempCode;
                case {'01111'}
                    restoredData{codeNum}=tempCode;
                case {'0101'}
                    restoredData{codeNum}=tempCode;
                case {'110'}
                    restoredData{codeNum}=tempCode;
                case {'11110'}
                    restoredData{codeNum}=tempCode;
                case {'01101'}
                    restoredData{codeNum}=tempCode;
                case {'00000'}
                    restoredData{codeNum}=tempCode;
                case {'00010'}
                    restoredData{codeNum}=tempCode;
                case {'00011'}
                    restoredData{codeNum}=tempCode;
                case {'00001'}
                    restoredData{codeNum}=tempCode;
                case {'11111'}
                    restoredData{codeNum}=tempCode;
                case {'10'}
                    restoredData{codeNum}=tempCode;
                otherwise
                    codeFound=0;
            end
            if codeFound==1
                beginIndex=beginIndex+length(tempCode);
                codeNum=codeNum+1;
            end
            codeFound=1;
            k=k+1;
        end
        commandwindow
        numOfPadedZeros=0;%Holds number of bits added to form the last byte.
        fdd=fd;
        for k=1:7
            if mod(CW,8)~=0%CW=codeWidth
                numOfPadedZeros=numOfPadedZeros+1;
                CW=CW+1;
                fdd{1,1}{1}(CW:CW)=num2str(0);
            else
                break;
            end
        end
        %Now, intialize 2 variables to be able to split the code read into bytes.
        beginIndex=-7;
        endIndex=0;
        dataBytes=[];
        for k=1:CW/8
            beginIndex=beginIndex+8;
            endIndex=endIndex+8;
            dataBytes{1,k}=fdd{1,1}{1}(beginIndex:endIndex);
        end
        
        dataBytesArray=[];
        for k=1:size(dataBytes,2)
            dataBytesArray=strcat(dataBytesArray,[dataBytes{1,k},',']);
        end
        
        %Converting bytes into decimal numbers.
        decArray={};%Holds each decimal number in a cell.
        for k=1:length(dataBytes)
            binVector=zeros(1,8);
            for kk=1:8
                binVector(9-kk)=str2double(dataBytes{1,k}(kk));
            end
            decArray{k}=binvec2dec(binVector);
            %Storing each decimal number in 3 digits e.g. 4=>003, 75=>075
            if decArray{k}>=0 & decArray{k} <=9
                rslt=strcat('00',num2str(decArray{k}));
                decArray{k}=rslt;
            elseif decArray{k}>=10 & decArray{k} <=99
                rslt=strcat('0',num2str(decArray{k}));
                decArray{k}=rslt;
            else
                decArray{k}=num2str(decArray{k});
            end
        end
        
        dataDecimalsArray=[];%used to be more user comfortable.
        decimalsArray=[];%used to display the decimal data as a continuous series.
        decimalsArrayContaingNumOfPadedZeros=[];
        for k=1:length(decArray)
            dataDecimalsArray=strcat(dataDecimalsArray,[decArray{k},',']);
            decimalsArray=strcat(decimalsArray,[decArray{k}]);
        end
        
        decimalsArrayContaingNumOfPadedZeros=strcat(num2str(numOfPadedZeros),num2str(decimalsArray));
        restoredDataArray=[];
        for k=1:length(restoredData)
            restoredDataArray=strcat(restoredDataArray,[restoredData{k},',']);
        end
        
        for index=1:length(restoredData)%length(codedMessage)==size(codedMessage,2)
            switch restoredData{index}
                case {'001'}
                    restoredData{index}={'a'};%Equivelant to  code(1,1)=mat2cell('000');
                case {'0100'}
                    restoredData{index}={'d'};
                case {'1110'}
                    restoredData{index}={'e'};
                case {'01100'}
                    restoredData{index}={'f'};
                case {'01110'}
                    restoredData{index}={'g'};
                case {'01111'}
                    restoredData{index}={'h'};
                case {'0101'}
                    restoredData{index}={'i'};
                case {'110'}
                    restoredData{index}={'m'};
                case {'11110'}
                    restoredData{index}={'n'};
                case {'01101'}
                    restoredData{index}={'o'};
                case {'00000'}
                    restoredData{index}={'r'};
                case {'00010'}
                    restoredData{index}={'p'};
                case {'00011'}
                    restoredData{index}={'s'};
                case {'00001'}
                    restoredData{index}={'t'};
                case {'11111'}
                    restoredData{index}={'y'};
                case {'10'}
                    restoredData{index}={' '};
            end
        end
        fclose(fileID);
        
        %%
        fileID = fopen('codedMessage.txt','at');
        fprintf(fileID,'\n\nCode can be represented simply in this form ==> "%s"\n',restoredDataArray);
        restoredCharsDataArray=[];
        for k=1:size(restoredData,2)
            restoredCharsDataArray=strcat(restoredCharsDataArray,[restoredData{1,k}{1},',']);
        end
        fprintf(fileID,'\nRestored characters are as folows ==> "%s"\n',restoredCharsDataArray);
        
        fprintf(fileID,'\nBytes found in the code ==> "%s"\n',dataBytesArray);
        fprintf(fileID,'\nAfter Converting bytes to decimal numbers ==> "%s"\n',decimalsArrayContaingNumOfPadedZeros);
        fprintf(fileID,'\nDecimal numbers are as follows==> "%s" with %d binary digits added to last byte\n',dataDecimalsArray,numOfPadedZeros);
        fclose(fileID);
        
        uiopen('codedMessage.txt', true);
        %% Printing the decimal numbers into a file.
        %fileID = fopen('dataDecimals.txt','wt');
        %fprintf(fileID,'%s',decimalsArray);
        set(handles.text5,'String','Click To Continue');
        set(handles.text1,'String','');
        set(handles.text2,'String','');
        set(handles.text4,'String','');
        waitforbuttonpress
        set(handles.text1,'Visible','off');
        set(handles.text2,'Visible','off');
        set(handles.text3,'Visible','off');
        set(handles.text4,'Visible','off');
        set(handles.text5,'Visible','off');
        set(handles.popupmenu1,'Visible','On');
        set(handles.text7,'Visible','On');
    otherwise
        disp('Select correct choice');
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
dataCompTool
