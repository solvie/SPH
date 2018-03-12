
x = audioread('speech.wav');
gauss = rand(134579,1)*2.-1;

imp = double(rand(1,134579) < 0.5)';

corrupted_snrm10 = 0.0267*imp+x;
corrupted_snr0 = 0.00842*imp+x;
corrupted_snr10 = 0.00267*imp+x;
corrupted_snr20 = 0.000842*imp+x;
corrupted_snr40 = 0.0000842*imp+x;

