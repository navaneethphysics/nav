% This is a basic imaging script that will allow for changing the time
% window over which images are taken. I've done my best to document the
% code, so please let me know if there are any issues or questions via
% email.
% You will need the ReadSDTFileIW in the directory in which you are working
% (Matlab directory, use 'dir' to see it) or add the path to this file so
% Matlab can see it.
% Use F9 to run highlighted script only, use F5 to run the whole script
%ReadSDTFileIW scripts directory path
% addpath('C:\Your Directory\')
clear all
addpath('')
% Enter the path to the *.sdt files
pathname=''; %include the \ at the end
% Enter the filename to be read in
filename='Full Scan 15Mhz 2inch foc 13p8dB 5800panametrics back
side.sdt';%needs the sdt extension
          

UTdata=ReadSDTFileIW(fullfile(pathname,filename));
datachannel=2;
% The data is stored in a 'struct' data type. So, lets say you want a
% waveform from a 100 by 50 scan. You want the 20'th row, and 30'th column, in the first gate.
% The data can be retrived by UTdata(1).rawdata(20,30,:).
% There are multile gates saved in the file. Gate 1, for this testing,
% includes all of the data, while Gates 2-4 are subsets of the data. You
% may use what you like.

% Plot a waveform from the dataset

% Find the FW for the example waveform, (20,20) in this case. Change if it
% is not representative of all waveforms (ie, over a hole, or off the
% board)
FW_ind_examp=find(squeeze(UTdata(datachannel).rawdata(20,20,:))>=0.2,1,'first');


figure(1) %open a figure
clf, subplot(2,1,1), hold on
plot(UTdata(datachannel).timebase-UTdata(datachannel).timebase(FW_ind_examp),squeeze(UTdata(datachannel).rawdata(20,20,:))) %plot a waveform, squeeze() makes it 1D data)
xlabel('Time (\mus)')
ylabel('Volts (V)')
title('Example Waveform for Gate Selection')

% % % % % % % % % % % % Change these values % %  % % % % %  % % % % %

gate_width=0.2; %end of the gate in microseconds as seen in figure 1
gate_start=0:gate_width:3; %start of the gate in microseconds as seen in figure 1
[~,start_ind_examp]=min(abs(gate_start(1)-(UTdata(datachannel).timebase-UTdata(datachannel).timebase(FW_ind_examp))));
[~,end_ind_examp]=min(abs(gate_start(1)+gate_width-(UTdata(datachannel).timebase-UTdata(datachannel).timebase(FW_ind_examp))));

x_coords=UTdata(datachannel).axes.range{1,1};
y_coords=UTdata(datachannel).axes.range{1,2};

plot([UTdata(datachannel).timebase(start_ind_examp) UTdata(datachannel).timebase(end_ind_examp)]-UTdata(datachannel).timebase(FW_ind_examp), [0.2, 0.2],'-or')
subplot(2,1,2)
plot(UTdata(datachannel).timebase(start_ind_examp:end_ind_examp)-UTdata(datachannel).timebase(FW_ind_examp),squeeze(UTdata(datachannel).rawdata(20,20,start_ind_examp:end_ind_examp))) %plot a waveform, squeeze() makes it 1D data)
xlabel('Time (\mus)')
ylabel('Volts (V)')
title('Zoom of Gated Region')
image_data=zeros([length(gate_start),length(x_coords),length(y_coords)]);
FW_ind=image_data;
start_ind=zeros(size(gate_start));
end_ind=start_ind;
for iz=1:1:length(gate_start)
    disp(strcat([num2str(iz) ' of ' num2str(length(gate_start))]))
    for ii=1:1:length(x_coords)
        for ij=1:1:length(y_coords)
            if isempty(find(squeeze(UTdata(datachannel).rawdata(ii,ij,:))>=0.2,1,'first'))
                continue %image_data(iz,ii,ij)=0; %No frontwall, likely off sample
            else
                FW_ind(iz,ii,ij)=find(squeeze(UTdata(datachannel).rawdata(ii,ij,:))>=0.2,1,'first'); %Find the FW and reference gates to it if possible
                % Find the corresponding indices closest to the specified gate times
                [~,start_ind(iz)]=min(abs(gate_start(iz)-(UTdata(datachannel).timebase-UTdata(datachannel).timebase(FW_ind(iz,ii,ij)))));
                [~,end_ind(iz)]=min(abs(gate_start(iz)+gate_width-(UTdata(datachannel).timebase-UTdata(datachannel).timebase(FW_ind(iz,ii,ij)))));
                
                % loop through data to extract wanted metric
                
                
                
                %this is extracting the absolute maximum amplitude in the gate via
                %(max(abs **)) you can change this to be what you want (eg,
                %max, min, std, rms)
                image_data(iz,ii,ij)=max(abs(UTdata(datachannel).rawdata(ii,ij,start_ind(iz):end_ind(iz))));
            end
        end
    end
    
    
    % Display the data
%     figure(2)
%     imagesc(x_coords,y_coords,squeeze(image_data(iz,:,:))') %make an image of the data
%     axis image %make the axes relative to one another
%     set(gca,'ydir','normal') %flip the vertical to be increasing moving in +y
%     %  there are lots of colormaps, use any you like. colormap(gray) is the one
%     %  closest to what I showed
%     xlabel('Y (mm)')
%     ylabel('X (mm)')
%     title('Image Result')
%     
%     images_path='H:\FullBoardScans\'; %where to save the images
%     image_name='test_image2.png'; %image name
%     
%     Data_range=UTdata(datachannel).max_amp{1}-UTdata(datachannel).min_amp{1};
%     image_data_scale=mat2gray(squeeze(image_data(iz,:,:))); %-UTdata(1).min_amp{1})/Data_range
%     figure(3)
%     imagesc(x_coords,y_coords,image_data_scale') %make an image of the data
%     axis image %make the axes relative to one another
%     set(gca,'ydir','normal') %flip the vertical to be increasing moving in +y
%     
%     %     colormap(gray) %there are lots of colormaps, use any you like.
%     imwrite(flipud(image_data_scale'),fullfile(images_path,image_name),'Compression','none')
%     figure(3)
%     clf
%     imshow(fullfile(images_path,image_name))
%     title('Resulting Saved Image')
end
filenamegif='CryoBoard0p1gatefront.gif';
for counter1=[1:length(gate_start) length(gate_start):-1:2];
    figure(2)
    subplot(2,1,1)
    imagesc(x_coords,y_coords,squeeze(image_data(counter1,:,:))',[0 2.5*mean(mean(squeeze(image_data(counter1,:,:))))])
    daspect([1 1 1]);
    colorbar
    % Here I am trying to substract two images.
   % if counter1<=10;
    %subplot(3,1,2)
    %imagesc(x_coords,y_coords,squeeze(image_data(counter1+1,:,:))',[0 2.5*mean(mean(squeeze(image_data(counter1+1,:,:))))])
    %imagesc(x_coords,y_coords,abs(squeeze(image_data(counter1,:,:)-image_data(counter1+1,:,:)))',[0 2.5*(abs(mean(mean(squeeze(image_data(counter1,:,:))))-mean(mean(squeeze(image_data(counter1+1,:,:))))))])
    %daspect([1 1 1]);
   % colorbar
    %subplot(3,1,2)
    %differenceImage = abs(double(th1) - double(th2))
    %imshow(differenceImage, []);
    axis image
    subplot(2,1,2),cla,hold on
    plot(UTdata(datachannel).timebase-UTdata(datachannel).timebase(FW_ind_examp),squeeze(UTdata(datachannel).rawdata(20,20,:))) %plot a waveform, squeeze() makes it 1D data)
    plot([UTdata(datachannel).timebase(start_ind(counter1)) UTdata(datachannel).timebase(end_ind(counter1))]-UTdata(datachannel).timebase(FW_ind(iz,20,20)), [0.2, 0.2],'-or')
    %daspect([1 1 1]);
    xlabel('Time (\mus)')
    ylabel('Volts (V)')

    
    pause(0.1)
    drawnow
    frame = getframe(2);
    im = frame2im(frame);
    [A,map] = rgb2ind(im,256); 
	if counter1 == 1;
		imwrite(A,map,fullfile(pathname,filenamegif),'gif','LoopCount',Inf,'DelayTime',1);
	else
		imwrite(A,map,fullfile(pathname,filenamegif),'gif','WriteMode','append','DelayTime',0.1);
	end
end
%end
