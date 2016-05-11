%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tsougaris Panajiotis & Xantzhs Dhmhtrios
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load Iris00clear.pat.txt;   %Fortoma arxeiou me dedomena

%xorismos dedomenon se pinakes, se check kai train
IrisTRAINdata = Iris00clear(1:75,:);    
IrisCHECKdata = Iris00clear(76:end,:);

%xorismos dedomenon se Input kai Output
IrisTRAINdataINPUT = IrisTRAINdata(:,1:4);
IrisTRAINdataOUTPUT = IrisTRAINdata(:,5);
IrisCHECKdataINPUT = IrisCHECKdata(:,1:4);
IrisCHECKdataOUTPUT = IrisCHECKdata(:,5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARXIKOS FIS
%Dimiourgia Arxikou FIS me aktina r = 0.4
fismat4 = genfis2(IrisTRAINdataINPUT,IrisTRAINdataOUTPUT,0.4);

%ELEGXOS ARXIKOU FIS(r = 0.4) GIA TRAIN-DATA
fuzout4 = evalfis(IrisTRAINdataINPUT,fismat4);
trnRMSE4 = norm (fuzout4-IrisTRAINdataOUTPUT)/sqrt(length(fuzout4));

%ELEGXOS ARXIKOU FIS(r = 0.4) GIA CHECK-DATA
chkfuzout4 = evalfis(IrisCHECKdataINPUT,fismat4);
chkRMSE4 = norm (chkfuzout4-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout4));

%EKPAIDEYSH ELENGTH gia epochs = 80 kai FIS(r = 0.4)
[fismat1,trnError,ss,fismat2,chkError] =...
    anfis(IrisTRAINdata, fismat4, [80],[], IrisCHECKdata);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EKPAIDEYMENOS FIS

%ELEGXOS TELIKOY FIS(r = 0.4) GIA TRAIN-DATA
trnfuzout4 = evalfis(IrisTRAINdataINPUT,fismat2);
trnRMSE42 = norm (trnfuzout4-IrisTRAINdataOUTPUT)/sqrt(length(trnfuzout4));

%ELEGXOS TELIKOY FIS(r = 0.4) GIA CHECK-DATA
chkfuzout42 = evalfis(IrisCHECKdataINPUT,fismat2);
chkRMSE42 = norm (chkfuzout42-IrisCHECKdataOUTPUT)/sqrt(length(chkfuzout42));

%trnRMSE4 = min pososto lathous se train dedomena se mh ekpaideymeno FIS
%chkRMSE4 = min pososto lathous se check dedomena se mh ekpaideymeno FIS

%trnRMSE42 = min pososto lathous se train dedomena se ekpaideymeno FIS
%chkRMSE42 = min pososto lathous se check dedomena se ekpaideymeno FIS
%minTRAIN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EYRESH EPOXHS MIKROTEROU POSOSTOU LATHOYS SE TRAIN DEDOMENA
posTRAIN = 1;
minTRAIN = trnError(1);
for i=1:80,
    if minTRAIN>trnError(i) minTRAIN = trnError(i);posTRAIN = i;
    end
end
%EYRESH EPOXHS MIKROTEROU POSOSTOU LATHOYS SE CHECK DEDOMENA
posCHECK = 1;
minCHECK = chkError(1);
for i=1:80,
    if minCHECK>chkError(i) minCHECK = chkError(i);posCHECK = i;
    end
end
%ENFANISH GRAFIKHS PARASTASHS POSOSTO LATHOUS ME TIS EPOXES
figure('name','ERRORS');
hold on;
title('GREEN-->TRAIN:BLUE-->CHECK for 0.4');
plot(trnError, 'g-');
plot(chkError, 'b-');
xlabel('EPOCHS');
ylabel('ERRORS');
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
