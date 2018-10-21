close all
clear all
pathname = '';

filename_1 = 'ADC_1732_front.sdt';   %1603   
filename_2 = 'ADC_1724_front.sdt';


filename_11 = 'ADC_3766.sdt';   %1603   
filename_12 = 'ADC_1724_front.sdt';

Data_1 = ReadSDTFileIW(fullfile(pathname,filename_1));
Data_2 = ReadSDTFileIW(fullfile(pathname,filename_2));


    for ii=1:3:150;
       for jj=1:3:150;
        Y(ii,jj,1:2088)=sum(sum(Data_1(2).rawdata((ii:ii+2),jj:jj+2,1:2088)))./9; 
        Y_2(ii,jj,1:2088)=sum(sum(Data_2(2).rawdata((ii:ii+2),jj:jj+2,1:2088)))./9;

       end
    end
    
 out = reshape(Y(bsxfun(@times,any(Y,2),ones(1,size(Y,2)))>0),[],size(Y,2),size(Y,3));

 B = permute(out,[2,1,3]);

 out1 = reshape(B(bsxfun(@times,any(B,2),ones(1,size(B,2)))>0),[],size(B,2),size(B,3));

 B = permute(out1,[2,1,3]);


 out3 = reshape(Y_2(bsxfun(@times,any(Y_2,2),ones(1,size(Y_2,2)))>0),[],size(Y_2,2),size(Y_2,3));

 B_1 = permute(out3,[2,1,3]);

 out4 = reshape(B_1(bsxfun(@times,any(B_1,2),ones(1,size(B_1,2)))>0),[],size(B_1,2),size(B_1,3));

 B_1 = permute(out4,[2,1,3]);
 

for iz=1:1:1
   for ii=1:1:50;
       for ij=1:1:50;
            
       s1 = squeeze(B(ii,ij,200:600)); %419-479 --last results 280:680 for new
       s2 = squeeze(B_1(ii,ij,200:600));
  
       %if (ii >= 47) && (ii <= 90) && (ij >= 58) && (ij <= 92)
       cross_corr_1(iz,ii,ij) = xcorr(s1,s2,0,'coef');

     
       end
       end
    end

imagesc(50,50,squeeze(cross_corr_1)');

colorbar
