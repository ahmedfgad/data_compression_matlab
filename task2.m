letters=input('Insert Letters : ','s');
letters=upper(letters);
countLetters=zeros(1,26);
for k=1:length(letters)
    countLetters(char(letters(k))-64)=countLetters(char(letters(k))-64)+1;
end

count=0;
str=[];
for k=1:26
    count=countLetters(k);
    if count > 0 
        str=strcat(str,[char(k+64),',']);
    count=0;
    end
end
fprintf('\n( %s )\n',str);