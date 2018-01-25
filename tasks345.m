sizeBeforCompresstion=input('Size before compression : ','s');
sizeBeforCompresstion=str2double(sizeBeforCompresstion);
sizeAfterCompression=input('Size after compression : ','s');
sizeAfterCompression=str2double(sizeAfterCompression);
if (sizeBeforCompresstion>sizeAfterCompression & sizeAfterCompression>0 & sizeBeforCompresstion>0)
compressionRatio=sizeAfterCompression/sizeBeforCompresstion;
compressionFactor=1/compressionRatio;
savingPercentage=((sizeBeforCompresstion-sizeAfterCompression)/sizeBeforCompresstion)*100;
fprintf('\nCompression ratio : %f\nCompression factor : %f\nSaving Percentage : %f%%\n',compressionRatio,compressionFactor,savingPercentage);
else
    disp('Input Error...Try again');
    tasks345
end
