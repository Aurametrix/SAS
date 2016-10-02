PROC IML;
 USE ecg;
 *Read input ECG data from SAS dataset into matrix;
 READ all var {ecg_d} into ecg;
 *Define the matrix and initialize all
 the elements to zero;
 filt=j(nrow(ecg),1,0);

 *Implement difference equation for a low pass filter;
 filt[1,1]=ecg[1,1];
 filt[2,1]=2*filt[1,1]+ecg[2,1];
 DO i=3 to nrow(ecg);
 IF i<7 then
 filt[i,1]=2*filt[i-1,1]-filt[i-2,1]+ecg[i,1];
 IF i>=7 & i<13 then
 filt[i,1]=2*filt[i-1,1]-filt[i-2,1]+ecg[i,1]-2*ecg[i-6,1];
 IF i>=13 then
 filt[i,1]=2*filt[i-1,1]-filt[i-2,1]+ecg[i,1]-2*ecg[i-6,1]
 +ecg[i-12,1];
 END;

 *Define variable names for output dataset;
 varnames = {"lowpass"};
 *Create SAS dataset from matrix;
 CREATE filtered FROM filt [colname=varnames];
 APPEND from filt;
 CLOSE filtered;
QUIT;
