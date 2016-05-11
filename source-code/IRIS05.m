>> load Iris00clear.pat.txt;
IrisTRAINdata = Iris00clear(1:75,:);
IrisCHECKdata = Iris00clear(76:end,:);
IrisTRAINdataINPUT = IrisTRAINdata(:,1:4);
IrisTRAINdataOUTPUT = IrisTRAINdata(:,5);
IrisCHECKdataINPUT = IrisCHECKdata(:,1:4);
IrisCHECKdataOUTPUT = IrisCHECKdata(:,5);
fismat5 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.5);
%ARXIKOS FIS
%GIA TRAIN-DATA
%0.5
fuzout5 = evalfis(IrisTRAINdataINPUT,fismat5);
trnRMSE5 = norm (fuzout5-IrisTRAINdataOUTPUT)/sqrt(length(fuzout5));
%GIA CHECK-DATA
%0.5
chkfuzout5 = evalfis(IrisCHECKdataINPUT,fismat5);
chkRMSE5 = norm (chkfuzout5-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout5));
% gia 0.5
[fismat1,trnError,ss,fismat2,chkError] =...
    anfis(IrisTRAINdata, fismat5, [100],[], IrisCHECKdata)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EKPAIDEYMENOS FIS
%GIA TRAIN-DATA
%0.5
trnfuzout5 = evalfis(IrisTRAINdataINPUT,fismat2);
trnRMSE52 = norm (trnfuzout5-IrisTRAINdataOUTPUT)/sqrt(length(trnfuzout5));
%GIA CHECK-DATA
%0.5
chkfuzout52 = evalfis(IrisCHECKdataINPUT,fismat2);
chkRMSE52 = norm (chkfuzout52-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout52));