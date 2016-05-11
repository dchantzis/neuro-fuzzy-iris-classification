>> load Iris00clear.pat.txt;
IrisTRAINdata = Iris00clear(1:75,:);
IrisCHECKdata = Iris00clear(76:end,:);
IrisTRAINdataINPUT = IrisTRAINdata(:,1:4);
IrisTRAINdataOUTPUT = IrisTRAINdata(:,5);
IrisCHECKdataINPUT = IrisCHECKdata(:,1:4);
IrisCHECKdataOUTPUT = IrisCHECKdata(:,5);
fismat8 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.8);
%ARXIKOS FIS
%GIA TRAIN-DATA
%0.8
fuzout8 = evalfis(IrisTRAINdataINPUT,fismat8);
trnRMSE8 = norm (fuzout8-IrisTRAINdataOUTPUT)/sqrt(length(fuzout8));
%GIA CHECK-DATA
%0.8
chkfuzout8 = evalfis(IrisCHECKdataINPUT,fismat8);
chkRMSE8 = norm (chkfuzout8-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout8));
% gia 0.8
[fismat1,trnError,ss,fismat2,chkError] =...
    anfis(IrisTRAINdata, fismat8, [2000],[], IrisCHECKdata)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EKPAIDEYMENOS FIS
%GIA TRAIN-DATA
%0.8
trnfuzout8 = evalfis(IrisTRAINdataINPUT,fismat2);
trnRMSE82 = norm (trnfuzout8-IrisTRAINdataOUTPUT)/sqrt(length(trnfuzout8));
%GIA CHECK-DATA
%0.5
chkfuzout82 = evalfis(IrisCHECKdataINPUT,fismat2);
chkRMSE82 = norm (chkfuzout82-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout82));
