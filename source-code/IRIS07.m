load Iris00clear.pat.txt;
IrisTRAINdata = Iris00clear(1:75,:);
IrisCHECKdata = Iris00clear(76:end,:);
IrisTRAINdataINPUT = IrisTRAINdata(:,1:4);
IrisTRAINdataOUTPUT = IrisTRAINdata(:,5);
IrisCHECKdataINPUT = IrisCHECKdata(:,1:4);
IrisCHECKdataOUTPUT = IrisCHECKdata(:,5);

fismat7 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.7);
%ARXIKOS FIS
%GIA TRAIN-DATA
%0.7
fuzout7 = evalfis(IrisTRAINdataINPUT,fismat7);
trnRMSE7 = norm (fuzout7-IrisTRAINdataOUTPUT)/sqrt(length(fuzout7));

%GIA CHECK-DATA
%0.7
chkfuzout7 = evalfis(IrisCHECKdataINPUT,fismat7);
chkRMSE7 = norm (chkfuzout7-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout7));

%gia 0.7
[fismat1,trnError,ss,fismat2,chkError] =...
    anfis(IrisTRAINdata, fismat7, [17],[], IrisCHECKdata)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EKPAIDEYMENOS FIS
%GIA TRAIN-DATA
%0.7
trnfuzout7 = evalfis(IrisTRAINdataINPUT,fismat2);
trnRMSE72 = norm (trnfuzout7-IrisTRAINdataOUTPUT)/sqrt(length(trnfuzout7));

%GIA CHECK-DATA
%0.7
chkfuzout72 = evalfis(IrisCHECKdataINPUT,fismat2);
chkRMSE72 = norm (chkfuzout72-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout72));