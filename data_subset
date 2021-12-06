%This code can be used to look at the different portion of the same data
%set, both the 2-D and also the correlation plot. This is a nice way  to
%check correlation between different chips ( calculate systematics )
% we need to find the right (x,y ) cordinate to align the data before we
% compute the cross correlation, the circle on the front surface can be
% used as reference to align the data
% created on 12/05/2021 Navaneeth Poonthottathil
close all
clear all
pathname = '';


start_time_index=200; %190
end_time_index=350;%210

%start_time_index=start_time_index_LN+56; % shifting the waveform for aligment as data were taken different time
%end_time_index=end_time_index_LN+56; % shifting the waveform for aligment  as data were taken different time


XLabels = 1:121;
CustomXLabels = string(XLabels);
CustomXLabels(mod(XLabels,5) ~= 0) = " ";


t_1 = '100_FERT0_fixture/FE_20_28_RT0.sdt'; 

t_Data_1 = ReadSDTFileIW(fullfile(pathname,t_1));

datachannel =2;

       s1 = squeeze(t_Data_1(datachannel).rawdata(28:148,30:150,start_time_index:end_time_index));
       s2 = squeeze(t_Data_1(datachannel).rawdata(240:360,30:150,start_time_index:end_time_index));
       s3 = squeeze(t_Data_1(datachannel).rawdata(454:574,30:150,start_time_index:end_time_index));

for iz=1:1:1;
   for ii=1:1:121;
       for ij=1:1:121;
           % input the vectors (s1,s2 ..) to compute the correlation      
        cross_corr_1(iz,ii,ij) =  xcorr(squeeze(s1(ii,ij,:)),squeeze(s2(ii,ij,:)),0,'coef');
        cross_corr_2(iz,ii,ij) =  xcorr(squeeze(s1(ii,ij,:)),squeeze(s3(ii,ij,:)),0,'coef');
  
       end
   end
end
%now plot the correlation plot

f2=figure('Name','correaltion_with in the sample','NumberTitle','off')
h1=heatmap(squeeze(cross_corr_1(iz,:,:)))
colormap(gca,'jet')
h1.XDisplayLabels = CustomXLabels;
h1.YDisplayLabels = CustomXLabels;
 

f3=figure('Name','correaltion_with in the sample_2','NumberTitle','off')
h2=heatmap(squeeze(cross_corr_2(iz,:,:)))
colormap(gca,'jet')
h2.XDisplayLabels = CustomXLabels;
h2.YDisplayLabels = CustomXLabels;
