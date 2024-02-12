# ECG Denoising Filter

This project aims to design and implement a digital filter for denoising electrocardiogram (ECG) signals using MATLAB and FDA tools.

## Project Description

The main steps of the project are as follows:

- Collected and preprocessed raw ECG data from the [PhysioNet MIT-BIH Arrhythmia Database](https://paperswithcode.com/dataset/physionet-challenge-2012), addressing artifacts and baseline wander.
- Conducted a thorough analysis of the ECG signals to identify noise characteristics and defined denoising requirements.
- Utilized MATLAB for designing a digital filter tailored to ECG denoising. According to the noise type, we used Finite
Impulse Response (FIR) filter.
- Employed the FDA Tool within MATLAB to refine filter specifications. Used the tool’s graphical interface to visualize the
frequency response, adjust parameters, and optimize the filter for effective denoising.
- Translated the final filter design into MATLAB code. Developed algorithms to apply the digital filter to the acquired ECG
signals.

## Prerequisites

To run the code and simulate the system, you need to have the following software installed on your computer:

- MATLAB (version R2020b or later)

You also need to have the following files in your working directory:

- 100.dat: a PhysioNet file that contains the raw ECG data of a patient with ventricular ectopic beats
- ecg_denoising_filter.m: a MATLAB script that contains the code for the filter design and application
- 

## Instructions

To run the code and simulate the system, follow these steps:

- Open MATLAB and navigate to your working directory
- Run the ecg_filter.m script to generate the filtered ECG signal and plot the results

## Experimentation

To evaluate the performance of the filter, we conducted the following experiments:

- We measured the signal-to-noise ratio (SNR) of the raw and filtered ECG signals using the snr function in MATLAB
- We calculated the root mean square error (RMSE) between the raw and filtered ECG signals using the immse function in MATLAB
- We compared the frequency spectra of the raw and filtered ECG signals using the periodogram function in MATLAB
- We varied the filter parameters (such as the order, the passband edge, and the stopband edge) and observed the effects on the filter response and the denoising quality

The results of the experiments showed that the filter was able to effectively remove the high frequency noise from the ECG signal, while preserving the useful information in the low frequency range. The filter also had a linear phase, which ensured no distortion in the signal waveform. The filter parameters were optimized to achieve a balance between the passband ripple, the stopband attenuation, and the transition band width.

## Limitations and Future Work

The limitations of the project are as follows:

- The ECG data used in the project was obtained from a single patient and may not be representative of other patients and conditions
- The filter design was based on some assumptions and simplifications, such as the noise type, the frequency range, and the weight vector
- The filter performance was evaluated using some metrics and criteria, which may not reflect the clinical relevance or the subjective perception of the denoising quality

The future work of the project could include:

- Using more ECG data from different patients and conditions
- Exploring different types of filters, such as infinite impulse response (IIR) filters, adaptive filters, or wavelet filters
- Incorporating more features and functionalities, such as heart rate detection, arrhythmia classification, or anomaly detection

