letters=input('Insert Letters : ','s');
letters=upper(letters);
countLetters=zeros(1,26);
for k=1:length(letters)
    countLetters(char(letters(k))-64)=countLetters(char(letters(k))-64)+1;
end
count=0;
xat=[];
for k=1:26
    count=countLetters(k);
    for kk=1:count
        xat=strcat(xat,'x');
    end
    if count > 0
    fprintf('\n%s : %s\n',char(k+64),xat);
    xat=[];
    count=0;
    end
end