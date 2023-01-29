%Fourier Transform of Sound File

%Load File

storedvar = load('C:\Users\Gumm\Desktop\meanfft_arr.mat'); 
for notenum=1:8
filenum=19;
file2=sprintf('C:\\Users\\Gumm\\Documents\\Audacity\\new_rec_10k_5_30ms\\dhi_index\\%d.wav',filenum);
samples = [1,2834];
[y,Fs] = audioread(file2,samples);
%ynoisy = awgn(y,10,'measured');
index2 = y;
%index2=ynoisy;
rmsval=1;
Nsamps2 = length(index2);
y_fft2 = abs(fft(index2));    
f = Fs*(0:Nsamps2/2-1)/Nsamps2;   
y_fft_half2=y_fft2(1:Nsamps2/2,:);
R = corrcoef(storedvar.meanfft_arr(1:Nsamps2/2,notenum),y_fft_half2);
pearsoncoeff(notenum) = R(1,2);
end
[M,I] = max(pearsoncoeff);
if I==1
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\ardha chapu.wav');
    player = audioplayer(y*rmsval,Fs);
    player.playblocking();
elseif I==2
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\chapu.wav');
    player  = audioplayer(y*rmsval,Fs);
    player.playblocking();
elseif I==3
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\dheem.wav');
    player  = audioplayer(y*rmsval,Fs);
    player.playblocking();
elseif I==4
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\dhi.wav');
    player  = audioplayer(y*rmsval,Fs);
    player.playblocking();
elseif I==5
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\num.wav');
    player  = audioplayer(y*rmsval,Fs);
    player.playblocking();
elseif I==6
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\sampoorna chapu.wav');
    player  = audioplayer(y*rmsval,Fs);
    player.playblocking();
elseif I==7
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\dhi.wav');
    player  = audioplayer(y*rmsval,Fs);
    player.playblocking();
else
    [y,Fs] = audioread('C:\Users\Gumm\Downloads\real sound of notes\sampoorna chapu.wav');
    player  = audioplayer(y*rmsval,Fs);
    player.playblocking();
end
[aa,indices]=sort(pearsoncoeff,'descend')
diff_second=aa(1)-aa(2);
diff_third=aa(1)-aa(3);
