load Iris00clear.pat.txt;
IrisTRAINdata = Iris00clear(1:75,:);
IrisCHECKdata = Iris00clear(76:end,:);
IrisTRAINdataINPUT = IrisTRAINdata(:,1:4);
IrisTRAINdataOUTPUT = IrisTRAINdata(:,5);
IrisCHECKdataINPUT = IrisCHECKdata(:,1:4);
IrisCHECKdataOUTPUT = IrisCHECKdata(:,5);

fismat3 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.3);
fismat4 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.4);
fismat5 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.5);
fismat6 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.6);
fismat7 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.7);
fismat8 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.8);
fismat9 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.9);
fismat10 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,1.0);
fismat11 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,1.1);
fismat12 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,1.3);
%GIA TRAIN-DATA
%0.3
fuzout3 = evalfis(IrisTRAINdataINPUT,fismat3);
trnRMSE3 = norm (fuzout3-IrisTRAINdataOUTPUT)/sqrt(length(fuzout3));
%0.4
fuzout4 = evalfis(IrisTRAINdataINPUT,fismat4);
trnRMSE4 = norm (fuzout4-IrisTRAINdataOUTPUT)/sqrt(length(fuzout4));
%0.5
fuzout5 = evalfis(IrisTRAINdataINPUT,fismat5);
trnRMSE5 = norm (fuzout5-IrisTRAINdataOUTPUT)/sqrt(length(fuzout5));
%0.6
fuzout6 = evalfis(IrisTRAINdataINPUT,fismat6);
trnRMSE6 = norm (fuzout6-IrisTRAINdataOUTPUT)/sqrt(length(fuzout6));
%0.7
fuzout7 = evalfis(IrisTRAINdataINPUT,fismat7);
trnRMSE7 = norm (fuzout7-IrisTRAINdataOUTPUT)/sqrt(length(fuzout7));
%0.8
fuzout8 = evalfis(IrisTRAINdataINPUT,fismat8);
trnRMSE8 = norm (fuzout8-IrisTRAINdataOUTPUT)/sqrt(length(fuzout8));
%0.9
fuzout9 = evalfis(IrisTRAINdataINPUT,fismat9);
trnRMSE9 = norm (fuzout9-IrisTRAINdataOUTPUT)/sqrt(length(fuzout9));
%1.0
fuzout10 = evalfis(IrisTRAINdataINPUT,fismat10);
trnRMSE10 = norm (fuzout10-IrisTRAINdataOUTPUT)/sqrt(length(fuzout10));
%1.1
fuzout11 = evalfis(IrisTRAINdataINPUT,fismat11);
trnRMSE11 = norm (fuzout11-IrisTRAINdataOUTPUT)/sqrt(length(fuzout11));
%1.2
fuzout12 = evalfis(IrisTRAINdataINPUT,fismat12);
trnRMSE12 = norm (fuzout12-IrisTRAINdataOUTPUT)/sqrt(length(fuzout12));
%GIA CHECK-DATA
%0.3
chkfuzout3 = evalfis(IrisCHECKdataINPUT,fismat3);
chkRMSE3 = norm (chkfuzout3-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout3));
%0.4
chkfuzout4 = evalfis(IrisCHECKdataINPUT,fismat4);
chkRMSE4 = norm (chkfuzout4-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout4));
%0.5
chkfuzout5 = evalfis(IrisCHECKdataINPUT,fismat5);
chkRMSE5 = norm (chkfuzout5-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout5));
%0.6
chkfuzout6 = evalfis(IrisCHECKdataINPUT,fismat6);
chkRMSE6 = norm (chkfuzout6-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout6));
%0.7
chkfuzout7 = evalfis(IrisCHECKdataINPUT,fismat7);
chkRMSE7 = norm (chkfuzout7-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout7));
%0.8
chkfuzout8 = evalfis(IrisCHECKdataINPUT,fismat8);
chkRMSE8 = norm (chkfuzout8-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout8));
%0.9
chkfuzout9 = evalfis(IrisCHECKdataINPUT,fismat9);
chkRMSE9 = norm (chkfuzout9-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout9));
%1.0
chkfuzout10 = evalfis(IrisCHECKdataINPUT,fismat10);
chkRMSE10 = norm (chkfuzout10-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout10));
%1.1
chkfuzout11 = evalfis(IrisCHECKdataINPUT,fismat11);
chkRMSE11 = norm (chkfuzout11-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout11));
%1.2
chkfuzout12 = evalfis(IrisCHECKdataINPUT,fismat12);
chkRMSE12 = norm (chkfuzout12-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout12));

% meiname se 5--> 0.4 0.5 0.6 0.7 0.8
%epochs = 10;
%for epochs = 100:100:1000

[fismat1,trnError,ss,fismat2,chkError] =...
    anfis(IrisTRAINdata, fismat4, [10000],[], IrisCHECKdata)

figure('name','ERRORS');
hold on;
title('GREEN-->TRAIN:BLUE-->CHECK for 0.4')
plot(trnError, 'g-');
plot(chkError, 'b-');
xlabel('EPOCHS');
ylabel('ERRORS');
hold off;
%end;
%minTRAIN
posTRAIN = 1;
minTRAIN = trnError(1);
for i=1:10000,
if minTRAIN>trnError(i) minTRAIN = trnError(i);posTRAIN = i;%minTRAIN_CHECK = chkError(i);
end
end
%minCHECK
posCHECK = 1;
minCHECK = chkError(1);
for i=1:10000,
if minCHECK>chkError(i) minCHECK = chkError(i);posCHECK = i;%minCHECK_TRAIN = trnError(i);
end
end