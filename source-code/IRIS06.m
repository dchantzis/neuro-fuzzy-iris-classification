>> load Iris00clear.pat.txt;
IrisTRAINdata = Iris00clear(1:75,:);
IrisCHECKdata = Iris00clear(76:end,:);
IrisTRAINdataINPUT = IrisTRAINdata(:,1:4);
IrisTRAINdataOUTPUT = IrisTRAINdata(:,5);
IrisCHECKdataINPUT = IrisCHECKdata(:,1:4);
IrisCHECKdataOUTPUT = IrisCHECKdata(:,5);
fismat6 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.6);
%ARXIKOS FIS
%GIA TRAIN-DATA
%0.6
fuzout6 = evalfis(IrisTRAINdataINPUT,fismat6);
trnRMSE6 = norm (fuzout6-IrisTRAINdataOUTPUT)/sqrt(length(fuzout6));
%GIA CHECK-DATA
%0.6
chkfuzout6 = evalfis(IrisCHECKdataINPUT,fismat6);
chkRMSE6 = norm (chkfuzout6-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout6));
% gia 0.6
[fismat1,trnError,ss,fismat2,chkError] =...
    anfis(IrisTRAINdata, fismat6, [184],[], IrisCHECKdata)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EKPAIDEYMENOS FIS
%GIA TRAIN-DATA
%0.6
trnfuzout6 = evalfis(IrisTRAINdataINPUT,fismat2);
trnRMSE62 = norm (trnfuzout6-IrisTRAINdataOUTPUT)/sqrt(length(trnfuzout6));
%GIA CHECK-DATA
%0.5
chkfuzout62 = evalfis(IrisCHECKdataINPUT,fismat2);
chkRMSE62 = norm (chkfuzout62-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout62));