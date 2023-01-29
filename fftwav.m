%Fourier Transform of Sound File

%Load File

for samplenum = 1:20
file1=sprintf('C:\\Users\\Gumm\\Documents\\Audacity\\new_rec_10k_5_30ms\\sampoorna chapu_index\\%d.wav',samplenum);
samples = [1,2834];
[y,Fs] = audioread(file1,samples);

 index1(:,samplenum)= y(:,:);
 Nsamps1 = length(index1(:,samplenum));
 t = (1/Fs)*(1:Nsamps1);          %Prepare time data for plot

%Do Fourier Transform
y_fft1(:,samplenum) = abs(fft(index1(:,samplenum)));    %Retain Magnitude

f = Fs*(0:Nsamps1/2-1)/Nsamps1;   %Prepare freq data for plot
%f = Fs*(0:Nsamps-1)/Nsamps;
%Plot Sound File in Time Domain
% figure
% plot(t, index(:,samplenum))
% xlabel('Time (s)')
% ylabel('Amplitude')
% title('time domain response')

%Plot Sound File in Frequency Domain
% figure
% plot(f, y_fft(:,samplenum))
%xlim([0 1000])
% xlabel('Frequency (Hz)')
% ylabel('Amplitude')
% title('Frequency Response of sound')
 end
y_fft_total=0;
for i=1:samplenum
y_fft_total=y_fft_total+y_fft1(:,i);    
end

y_fft_mean=y_fft_total/samplenum;
y_fft_mean=y_fft_mean(1:Nsamps1/2,:);
y_fft_half1=y_fft1(1:Nsamps1/2,:);
%Plot mean of Sound File in Frequency Domain
% figure
% plot(f, y_fft_mean)
% xlabel('Frequency (Hz)')
% ylabel('Amplitude')
% title('Average Frequency Response of sound')


for filenum=3:3
file2=sprintf('C:\\Users\\Gumm\\Documents\\Audacity\\new_rec_10k_4_30ms\\ardha chapu\\%d.wav',filenum);
samples = [1,2834];
[y,Fs] = audioread(file2,samples);
index2 = y;
Nsamps2 = length(index2);
t =(1/Fs)*(1:Nsamps1)   ;       %Prepare time data for plot

%Do Fourier Transform
y_fft2 = abs(fft(index2));    %Retain Magnitude

f = Fs*(0:Nsamps2/2-1)/Nsamps2;   %Prepare freq data for plot
y_fft_half2=y_fft2(1:Nsamps2/2,:);
%Plot Sound File in Frequency Domain
% figure
% plot(f, y_fft_half2)
% xlabel('Frequency (Hz)')
% ylabel('Amplitude')
% title('Frequency Response of sound')
R = corrcoef(y_fft_mean,y_fft_half2);
pearsoncoeff(filenum) = R(1,2);
end