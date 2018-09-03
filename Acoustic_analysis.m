clear all
pathname = '';

filename_1 = 'ADC_1724_front.sdt';       %sample 1
filename_2 = 'ADC_1732_front.sdt';
filename_3 = 'ADC_1713_front.sdt';
filename_4 = 'ADC_1741_front.sdt';
filename_5 = 'ADC_1745_front.sdt';
filename_6 = 'ADC_1749_front.sdt';
filename_7 = 'ADC_1758_front.sdt';
filename_8 = 'ADC_1765_front.sdt';
filename_9 = 'ADC_1765_front.sdt';

%{
filename_1 = 'ADC_1603_front.sdt';       %sample 2
filename_2 = 'ADC_1567_front.sdt';
filename_3 = 'ADC_1163_front.sdt';
filename_4 = 'ADC_0991_front.sdt';
filename_5 = 'ADC_0789_front.sdt';
filename_6 = 'ADC_566_front.sdt';
filename_7 = 'ADC_426_front.sdt';
filename_8 = 'ADC_252_front.sdt';
filename_9 = 'ADC_090_front.sdt';
%}

%{
filename_1 = 'ADC_1592_front.sdt';        %sample 3
filename_2 = 'ADC_1383_front.sdt';
filename_3 = 'ADC_1172_front.sdt';
filename_4 = 'ADC_0921_front.sdt';
filename_5 = 'ADC_0636_front.sdt';
filename_6 = 'ADC_0517_front.sdt';
filename_7 = 'ADC_0305_front.sdt';
filename_8 = 'ADC_0257_front.sdt';
filename_9 = 'ADC_117_front.sdt';
%}




Data_1 = ReadSDTFileIW(fullfile(pathname,filename_1));
Data_2 = ReadSDTFileIW(fullfile(pathname,filename_2));
Data_3 = ReadSDTFileIW(fullfile(pathname,filename_3));
Data_4 = ReadSDTFileIW(fullfile(pathname,filename_4));
Data_5 = ReadSDTFileIW(fullfile(pathname,filename_5));
Data_6 = ReadSDTFileIW(fullfile(pathname,filename_6));
Data_7 = ReadSDTFileIW(fullfile(pathname,filename_7));
Data_8 = ReadSDTFileIW(fullfile(pathname,filename_8));
Data_9 = ReadSDTFileIW(fullfile(pathname,filename_9));
datachannel=2;
%x_coords=Data_1(datachannel).axes.range{1,1};
%y_coords=Data_2(datachannel).axes.range{1,2};

datachannel=2;

FW_ind_examp_1=find(squeeze(Data_1(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_2=find(squeeze(Data_2(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_3=find(squeeze(Data_3(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_4=find(squeeze(Data_4(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_5=find(squeeze(Data_5(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_6=find(squeeze(Data_6(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_7=find(squeeze(Data_7(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_8=find(squeeze(Data_8(datachannel).rawdata(100,100,:))>=0.2,1,'first');
FW_ind_examp_9=find(squeeze(Data_9(datachannel).rawdata(100,100,:))>=0.2,1,'first');



%[~,start_ind_examp_1]=min(abs(gate_start(1)-(Data(datachannel).timebase-Data(datachannel).timebase(FW_ind_examp))));
%[~,end_ind_examp_1]=min(abs(gate_start(1)+gate_width-(Data(datachannel).timebase-Data(datachannel).timebase(FW_ind_examp))));



data_1=(Data_1(datachannel).timebase-Data_1(datachannel).timebase(FW_ind_examp_1))
data_2=(Data_2(datachannel).timebase-Data_2(datachannel).timebase(FW_ind_examp_2))
data_3=(Data_3(datachannel).timebase-Data_3(datachannel).timebase(FW_ind_examp_3))
data_4=(Data_4(datachannel).timebase-Data_4(datachannel).timebase(FW_ind_examp_4))
data_5=(Data_5(datachannel).timebase-Data_5(datachannel).timebase(FW_ind_examp_5))
data_6=(Data_6(datachannel).timebase-Data_6(datachannel).timebase(FW_ind_examp_6))
data_7=(Data_7(datachannel).timebase-Data_7(datachannel).timebase(FW_ind_examp_7))
data_8=(Data_8(datachannel).timebase-Data_8(datachannel).timebase(FW_ind_examp_8))
data_9=(Data_9(datachannel).timebase-Data_9(datachannel).timebase(FW_ind_examp_9))



A_1= data_1>0 & data_1<3
A_2= data_2>0 & data_2<3
A_3= data_3>0 & data_3<3
A_4= data_4>0 & data_4<3
A_5= data_5>0 & data_5<3
A_6= data_6>0 & data_6<3
A_7= data_7>0 & data_7<3
A_8= data_8>0 & data_8<3
A_9= data_9>0 & data_9<3


B_1= squeeze(Data_1(datachannel).rawdata(75,75,1:749))
B_2= squeeze(Data_2(datachannel).rawdata(75,75,1:749))
B_3= squeeze(Data_3(datachannel).rawdata(75,75,1:749))
B_4= squeeze(Data_4(datachannel).rawdata(75,75,1:749))
B_5= squeeze(Data_5(datachannel).rawdata(75,75,1:749))
B_6= squeeze(Data_6(datachannel).rawdata(75,75,1:749))
B_7= squeeze(Data_7(datachannel).rawdata(75,75,1:749))
B_8= squeeze(Data_8(datachannel).rawdata(75,75,1:749))
B_9= squeeze(Data_9(datachannel).rawdata(75,75,1:749))

X_1 = Data_1(datachannel).timebase(1:749);
X_2 = Data_2(datachannel).timebase(1:749);
X_3 = Data_3(datachannel).timebase(1:749);
X_4 = Data_4(datachannel).timebase(1:749);
X_5 = Data_5(datachannel).timebase(1:749);
X_6 = Data_5(datachannel).timebase(1:749);
X_7 = Data_5(datachannel).timebase(1:749);
X_8 = Data_5(datachannel).timebase(1:749);

%{
%length(A(B))
%length(squeeze(Data(datachannel).rawdata(74,70,1:749)))
figure=plot(X_1,B_1,X_2,B_2,X_3,B_3,X_4,B_4,X_6,B_6,X_7,B_7,X_8,B_8,'LineWidth',2);
%y = 0.085;
%line([0,3],[y,y],'LineWidth',2,'LineStyle','--','Color','red');
%y=-0.085;
%line([0,3],[y,y],'LineWidth',2,'LineStyle','--','Color','red');
legend('ADC 117','ADC 1603','ADC 1724','ADC 1732','ADC 1741','ADC 1749','ADC 1765');
xlabel('Time (\mu s)');
ylabel('Voltage (V)');
figure = getframe(gcf);
imwrite(figure.cdata, 'sample.png');
    %}
%cross corealtin at everypoint between two data set
    
%modifid to see the effect of FFT- need to rewrite this one chaneg to
%"squeeze(Data_1(datachannel).rawdata(ii,ij,200:600))"


disp('calculating the cross correlation and displaying the value');
for iz=1:1:1
   for ii=1:1:150;
       for ij=1:1:150;
%{
       s1 = squeeze(Data_1(datachannel).rawdata(ii,ij,200:600));
       s2 = squeeze(Data_2(datachannel).rawdata(ii,ij,200:600));
       s3 = squeeze(Data_3(datachannel).rawdata(ii,ij,200:600));
       s4 = squeeze(Data_4(datachannel).rawdata(ii,ij,200:600));
       s5 = squeeze(Data_5(datachannel).rawdata(ii,ij,200:600));
       s6 = squeeze(Data_6(datachannel).rawdata(ii,ij,200:600));
       s7 = squeeze(Data_7(datachannel).rawdata(ii,ij,200:600));
       s8 = squeeze(Data_8(datachannel).rawdata(ii,ij,200:600));
       s9 = squeeze(Data_9(datachannel).rawdata(ii,ij,200:600));
       %coherence_ms=mscohere(B_1,B_2);
%}

      s1 = real(fft(squeeze(Data_1(datachannel).rawdata(ii,ij,200:600))));
      s2 = real(fft(squeeze(Data_2(datachannel).rawdata(ii,ij,200:600))));
      s3 = real(fft(squeeze(Data_3(datachannel).rawdata(ii,ij,200:600))));
      s4 = real(fft(squeeze(Data_4(datachannel).rawdata(ii,ij,200:600))));
      s5 = real(fft(squeeze(Data_5(datachannel).rawdata(ii,ij,200:600))));
      s6 = real(fft(squeeze(Data_6(datachannel).rawdata(ii,ij,200:600))));
      s7 = real(fft(squeeze(Data_7(datachannel).rawdata(ii,ij,200:600))));
      s8 = real(fft(squeeze(Data_8(datachannel).rawdata(ii,ij,200:600))));
      s9 = real(fft(squeeze(Data_9(datachannel).rawdata(ii,ij,200:600))));



       cross_corr_1(iz,ii,ij) = xcorr(s1,s2,0,'coef');
       cross_corr_2(iz,ii,ij) = xcorr(s1,s3,0,'coef');
       cross_corr_3(iz,ii,ij) = xcorr(s1,s4,0,'coef');
       cross_corr_4(iz,ii,ij) = xcorr(s1,s5,0,'coef');
       cross_corr_5(iz,ii,ij) = xcorr(s1,s6,0,'coef');
       cross_corr_6(iz,ii,ij) = xcorr(s1,s7,0,'coef');
       cross_corr_7(iz,ii,ij) = xcorr(s1,s8,0,'coef');
       cross_corr_8(iz,ii,ij) = xcorr(s1,s9,0,'coef');

       cross_corr_9(iz,ii,ij) =  xcorr(s2,s3,0,'coef');
       cross_corr_10(iz,ii,ij) = xcorr(s2,s4,0,'coef');
       cross_corr_11(iz,ii,ij) = xcorr(s2,s5,0,'coef');
       cross_corr_12(iz,ii,ij) = xcorr(s2,s6,0,'coef');
       cross_corr_13(iz,ii,ij) = xcorr(s2,s7,0,'coef');
       cross_corr_14(iz,ii,ij) = xcorr(s2,s8,0,'coef');
       cross_corr_15(iz,ii,ij) = xcorr(s2,s9,0,'coef');
       
       cross_corr_16(iz,ii,ij) = xcorr(s3,s4,0,'coef');
       cross_corr_17(iz,ii,ij) = xcorr(s3,s5,0,'coef');
       cross_corr_18(iz,ii,ij) = xcorr(s3,s6,0,'coef');
       cross_corr_19(iz,ii,ij) = xcorr(s3,s7,0,'coef');
       cross_corr_20(iz,ii,ij) = xcorr(s3,s8,0,'coef');
       cross_corr_21(iz,ii,ij) = xcorr(s3,s9,0,'coef');
       
       cross_corr_22(iz,ii,ij) = xcorr(s4,s5,0,'coef');
       cross_corr_23(iz,ii,ij) = xcorr(s4,s6,0,'coef');
       cross_corr_24(iz,ii,ij) = xcorr(s4,s7,0,'coef');
       cross_corr_25(iz,ii,ij) = xcorr(s4,s8,0,'coef');
       cross_corr_26(iz,ii,ij) = xcorr(s4,s9,0,'coef');
       
       cross_corr_27(iz,ii,ij) = xcorr(s5,s6,0,'coef');
       cross_corr_28(iz,ii,ij) = xcorr(s5,s7,0,'coef');
       cross_corr_29(iz,ii,ij) = xcorr(s5,s8,0,'coef');
       cross_corr_30(iz,ii,ij) = xcorr(s5,s9,0,'coef');
       
       
       cross_corr_31(iz,ii,ij) = xcorr(s6,s7,0,'coef');
       cross_corr_32(iz,ii,ij) = xcorr(s6,s8,0,'coef');
       cross_corr_33(iz,ii,ij) = xcorr(s6,s9,0,'coef');
       cross_corr_34(iz,ii,ij) = xcorr(s7,s8,0,'coef');
       cross_corr_35(iz,ii,ij) = xcorr(s7,s9,0,'coef');
       cross_corr_36(iz,ii,ij) = xcorr(s8,s9,0,'coef');


      % Avg_corr(iz,ii,ij)=(cross_corr_1(iz,ii,ij)+cross_corr_2(iz,ii,ij)+cross_corr_3(iz,ii,ij)+cross_corr_4(iz,ii,ij)+cross_corr_5(iz,ii,ij)+cross_corr_6(iz,ii,ij)+cross_corr_7(iz,ii,ij))/7.0;

      %image_data(iz,ii,ij)=max(abs(Data_2(datachannel).rawdata(ii,ij,1:749)));
       %hist=1-coherence_ms;
       %disp(cross_corr_1);
       %disp(coherence_ms)
       %disp(sum(coherence_ms)/length(coherence_ms))
       %disp(cross_corr_2);
       %disp(Avg_corr);
       %plot(cross_corr_1);
       %plot(hist);
       %I=trapz(hist);
       %saveas(h,sprintf('correlation_%d_%d.png',ii,ij));
        end
    end
end



%{
f1=figure(1)
imagesc(150,150,squeeze(cross_corr_1(iz,:,:))') %make an image of the data
colorbar
saveas(f1,'Xcorr_1.png');
f2=figure(2)
imagesc(150,150,squeeze(cross_corr_2(iz,:,:))') %make an image of the data
colorbar
saveas(f2,'Xcorr_2.png');
f3=figure(3)
imagesc(150,150,squeeze(cross_corr_3(iz,:,:))') %make an image of the data
colorbar
saveas(f3,'Xcorr_3.png');
f4=figure(4)
imagesc(150,150,squeeze(cross_corr_4(iz,:,:))') %make an image of the data
colorbar
saveas(f4,'Xcorr_4.png');
f5=figure(5)
imagesc(150,150,squeeze(cross_corr_5(iz,:,:))') %make an image of the data
colorbar
saveas(f5,'Xcorr_5.png');
f6=figure(6)
imagesc(150,150,squeeze(cross_corr_6(iz,:,:))') %make an image of the data
colorbar
saveas(f6,'Xcorr_6.png');
f7=figure(7)
imagesc(150,150,squeeze(cross_corr_7(iz,:,:))') %make an image of the data
colorbar
saveas(f7,'Xcorr_7.png');
f8=figure(8)
imagesc(150,150,squeeze(cross_corr_8(iz,:,:))') %make an image of the data
colorbar
saveas(f8,'Xcorr_8.png');
f9=figure(9)
imagesc(150,150,squeeze(Avg_corr(iz,:,:))') %make an image of the data
colorbar
saveas(f9,'Xcorr_average.png');
f10=figure(10)
imagesc(150,150,squeeze(cross_corr_23(iz,:,:))') %make an image of the data
colorbar
saveas(f10,'Xcorr_10.png');
  %}      
        
       
        
for k=1:36
    newfig=figure(k);
    tempvar= eval(strcat(['cross_corr_',num2str(k),'(iz,:,:)']));
    y=squeeze(tempvar);
    imagesc(150,150,squeeze(tempvar)') %make 2-D image of the data    
    colorbar
    saveas(newfig,sprintf('/Users/pnav/Desktop/For_ME/DUNE_CNDE/FullBoardScans/UTData/correlation_studies/Plots/SAMPLE3/all_ref_td__%d.png',k))
end
            
 wave_form=figure()     
 X1 = Data_1(datachannel).timebase(1:749);
 Y1 = squeeze(Data_1(datachannel).rawdata(100,100,1:749))
 plot(X1,Y1,'LineWidth',2)
 hold on
 
 X2 = Data_1(datachannel).timebase(300:400);
 Y2 = squeeze(Data_1(datachannel).rawdata(100,100,300:400))
 plot(X2,Y2,'LineWidth',2)
 hold on
 
 X3 = Data_1(datachannel).timebase(400:500);
 Y3 = squeeze(Data_1(datachannel).rawdata(100,100,400:500))
 plot(X3,Y3,'LineWidth',2)
 hold on
 
 
 X4 = Data_1(datachannel).timebase(500:600);
 Y4 = squeeze(Data_1(datachannel).rawdata(100,100,500:600))
 plot(X4,Y4,'LineWidth',2)
 hold on
 
 X5 = Data_1(datachannel).timebase(600:700);
 Y5 = squeeze(Data_1(datachannel).rawdata(100,100,600:700))
 plot(X5,Y5,'LineWidth',2)
 
 X6 = Data_1(datachannel).timebase(200:300);
 Y6 = squeeze(Data_1(datachannel).rawdata(100,100,200:300))
 plot(X6,Y6,'LineWidth',2)
 
 X7 = Data_1(datachannel).timebase(100:200);
 Y7 = squeeze(Data_1(datachannel).rawdata(100,100,100:200))
 plot(X7,Y7,'LineWidth',2)
            
 legend('time','time 3','time 4','time 5','time 6','time 2','time 1')
 
 saveas(wave_form,sprintf('/Users/pnav/Desktop/For_ME/DUNE_CNDE/FullBoardScans/UTData/correlation_studies/Plots/Wave_FORM.png'));
            
           
            
        
%{
plot(cross_corr_1,'color','b','LineWidth',2)
hold on;
plot(cross_corr_2,'color','r','LineWidth',2)
hold on;
plot(cross_corr_3,'color','g','LineWidth',2)
hold on;
plot(cross_corr_4,'color','k','LineWidth',2)
hold on;
plot(Avg_corr,'color','m','LineWidth',2)
fft_1=abs(fft(B_1))
fft_2=abs(fft(B_2))
plot(fft_1,'LineWidth',2)
hold on
plot(fft_2,'LineWidth',2)
  %}      
        


% Quantify the correlation in each bin - made histogram of correlation values

figure_1=figure();
for m=1:7
   tempvar_1= eval(strcat(['cross_corr_',num2str(m)]));
   h = histogram(squeeze(tempvar_1),'DisplayStyle','stairs','LineWidth',2);
   hold on;
   h.BinLimits=[-1.00 1.00];
   h.BinWidth = .02;
   integral_1=sum(h.Values(80:100));
   integral_2=sum(h.Values(95:100));
   percentage_(m)=((integral_2)/(integral_1))*100
end

set(figure_1,'defaultLegendAutoUpdate','off')
legend('94% --ADC 1732','93% --ADC 1713','92% --ADC 1741','82% --ADC 1745 (Delaminted)','92% --ADC 1749','82% --ADC 1758','90% --ADC 1765','Location','northwest');
%legend('91% --ADC 1567','93% --ADC 1163','91% --ADC 0991','90% --ADC 789','90% --ADC 566','91% --ADC 426','91% --ADC 252','91% --ADC 090','Location','northwest');
%legend('91% --ADC 1383','90% --ADC 1172','92% --ADC 0921','80% --ADC 636','88% --ADC 517','89% --ADC 305','94% --ADC 257','90% --ADC 117','Location','northwest');
xlabel('Normalised Cross Correlation Value');
ylabel('Count');
%yL = get(gca,'YLim');
%line([0.8 0.8],yL,'Color','r');
axis([-1 1 0 10500]);
ax=gca;
ax.YScale ='log';
annotation(figure_1,'line',[0.827473733730594 0.827473733730594],...
    [0.920428571428571 0.111904761904762],'Color',[1 0 0],'LineWidth',2,...
    'LineStyle','--');
%line([0.8, 0.8], ylim, 'LineWidth', 2, 'Color', 'b','LineStyle','--');
saveas(figure_1,sprintf('/Users/pnav/Desktop/For_ME/DUNE_CNDE/FullBoardScans/UTData/correlation_studies/Plots/Correlation_hist_sample1_FD.png'));

%These comparision will be more accurate if we could do a  comparison with the good ICs'








