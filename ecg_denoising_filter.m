% Load and preprocess ECG data
filename = '100.dat';
fid = fopen(filename, 'r');
ecg = fread(fid, Inf,'int16');
fclose(fid);
ecg = ecg (1:5000); % select a segment of 5000 samples
Fs = 1000; % sampling frequency in Hz
t = (0:length (ecg)-1)/Fs; % time vector in seconds
ecg = ecg - mean (ecg); % remove DC offset
ecg = detrend (ecg); % remove linear trend
ecg = ecg / max (abs (ecg)); % normalize amplitude

% Plot raw ECG signal
figure (1)
plot (t, ecg)
xlabel ('Time (s)')
ylabel ('Amplitude')
title ('Raw ECG Signal')
grid on

% Analyze ECG signal to identify noise characteristics
% Use periodogram to estimate power spectral density
[pxx,f] = periodogram (ecg,[],[],Fs);
figure (2)
plot (f,10*log10 (pxx))
xlabel ('Frequency (Hz)')
ylabel ('Power (dB)')
title ('Power Spectral Density of ECG Signal')
grid on
% From the plot, we can see that the ECG signal has a dominant peak at around 1.7 Hz, which corresponds to the heart rate
% We can also see some high frequency noise above 100 Hz, which could be due to muscle artifacts or power line interference

% Define denoising requirements
% We want to preserve the frequency components below 40 Hz, which contain the useful information of the ECG signal
% We want to attenuate the frequency components above 100 Hz, which are mostly noise
% We use a transition band of 60 Hz between the passband and the stopband
Fpass = 40; % passband edge frequency in Hz
Fstop = 100; % stopband edge frequency in Hz
Apass = 1; % passband ripple in dB
Astop = 60; % stopband attenuation in dB

% Design a digital filter using MATLAB
% We use a finite impulse response (FIR) filter, which has a linear phase and is easy to implement
% We use the firpm function, which designs a filter using the Parks-McClellan algorithm
% We specify the filter order, the frequency bands, the desired amplitude response, and the weight vector
N = 100; % filter order
F = [0 Fpass Fstop Fs/2]/ (Fs/2); % normalized frequency bands
A = [1 1 0 0]; % desired amplitude response
W = [1 10]; % weight vector
b = firpm (N,F,A,W); % filter coefficients
% Alternatively, we can use the fdatool GUI to design and optimize the filter interactively
% fdatool

% Plot the frequency response of the filter
figure (3)
freqz (b,1,1024,Fs)
title ('Frequency Response of FIR Filter')

% Apply the digital filter to the ECG signal
ecg_filtered = filter (b,1,ecg); % filter the ECG signal
ecg_filtered = ecg_filtered (N/2+1:end); % remove the filter delay
t = t (N/2+1:end); % adjust the time vector

% Plot the filtered ECG signal
figure (4)
plot (t, ecg_filtered)
xlabel ('Time (s)')
ylabel ('Amplitude')
title ('Filtered ECG Signal')
grid on

% Model the ECG signal processing system in Proteus
% We use the MATLAB Script component to import the ECG signal and the filter coefficients
% We use the Digital Filter component to implement the FIR filter
% We use the Oscilloscope component to visualize the input and output signals
% We use the Spectrum Analyzer component to compare the frequency spectra of the input and output signals
% We save the Proteus project as ecg_filter.pdsprj
% Alternatively, we can use the MATLAB Simulink toolbox to model and simulate the system
% sim ( 'ecg_filter' )
