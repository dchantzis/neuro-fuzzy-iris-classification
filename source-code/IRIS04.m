load Iris00clear.pat.txt;
IrisTRAINdata = Iris00clear(1:75,:);
IrisCHECKdata = Iris00clear(76:end,:);
IrisTRAINdataINPUT = IrisTRAINdata(:,1:4);
IrisTRAINdataOUTPUT = IrisTRAINdata(:,5);
IrisCHECKdataINPUT = IrisCHECKdata(:,1:4);
IrisCHECKdataOUTPUT = IrisCHECKdata(:,5);

fismat4 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.4);
%ARXIKOS FIS
%GIA TRAIN-DATA
%0.4
fuzout4 = evalfis(IrisTRAINdataINPUT,fismat4);
trnRMSE4 = norm (fuzout4-IrisTRAINdataOUTPUT)/sqrt(length(fuzout4));

%GIA CHECK-DATA
%0.4
chkfuzout4 = evalfis(IrisCHECKdataINPUT,fismat4);
chkRMSE4 = norm (chkfuzout4-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout4));

% gia 0.4
[fismat1,trnError,ss,fismat2,chkError] =...
    anfis(IrisTRAINdata, fismat4, [80],[], IrisCHECKdata)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EKPAIDEYMENOS FIS
%GIA TRAIN-DATA
%0.4
trnfuzout4 = evalfis(IrisTRAINdataINPUT,fismat2);
trnRMSE42 = norm (trnfuzout4-IrisTRAINdataOUTPUT)/sqrt(length(trnfuzout4));

%GIA CHECK-DATA
%0.4
chkfuzout42 = evalfis(IrisCHECKdataINPUT,fismat2);
chkRMSE42 = norm (chkfuzout42-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout42));
