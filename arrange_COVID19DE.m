%% Written by Gizem Altan on 23.03.2020
% contact: https://gizemaltan.com/contact/

%% Load the data
import_COVID19DE %call the script
RKICOVID19Copy = RKICOVID1;
%% Clear the data
RKICOVID19Copy(1,:) = [];
RKICOVID19Copy(:,'ObjectId') = [];
%% Sort the data
RKICOVID19Copy = sortrows(RKICOVID19Copy,'Meldedatum','ascend');
%% Create new columns
TotalMen = zeros(size(RKICOVID19Copy,1),1); %new vector for men
TotalWomen = zeros(size(RKICOVID19Copy,1),1); %new vector for women
RKICOVID19Copy(:,7) = num2cell(TotalMen);
RKICOVID19Copy(:,8) = num2cell(TotalWomen);
RKICOVID19Copy.Properties.VariableNames{7} = 'TotalMen';
RKICOVID19Copy.Properties.VariableNames{8} = 'TotalWomen';

for s = 1 : size(RKICOVID19Copy,1)
    if isequal(RKICOVID19Copy.Geschlecht(s),{'M'}); %find the males
        RKICOVID19Copy(s,7) = RKICOVID19Copy(s,4);
    else isequal(RKICOVID19Copy.Geschlecht(s),{'W'});%fine the females
        RKICOVID19Copy(s,8) = RKICOVID19Copy(s,4);
    end
end

for s = 1 : size(RKICOVID19Copy,1)
    RKICOVID19Copy.Meldedatum{s} = RKICOVID19Copy.Meldedatum{s}(1:10);
    RKICOVID19Copy.Landkreis{s} = RKICOVID19Copy.Landkreis{s}(4:end);
end
%% Create a table
RKI_COVID19_DE = table(RKICOVID19Copy.Meldedatum, RKICOVID19Copy.AnzahlFall,...
    RKICOVID19Copy.AnzahlTodesfall,RKICOVID19Copy.Geschlecht,...
    RKICOVID19Copy.Altersgruppe,RKICOVID19Copy.Landkreis,...
    RKICOVID19Copy.TotalMen,RKICOVID19Copy.TotalWomen);

RKI_COVID19_DE.Properties.VariableNames{1} = 'Registration';
RKI_COVID19_DE.Properties.VariableNames{2} = 'Number';
RKI_COVID19_DE.Properties.VariableNames{3} = 'Deaths';
RKI_COVID19_DE.Properties.VariableNames{4} = 'Sex';
RKI_COVID19_DE.Properties.VariableNames{5} = 'Age_group';
RKI_COVID19_DE.Properties.VariableNames{6} = 'City';
RKI_COVID19_DE.Properties.VariableNames{7} = 'NumberMen';
RKI_COVID19_DE.Properties.VariableNames{8} = 'NumberWomen';

RKI_COVID19_DE = sortrows(RKI_COVID19_DE,'Registration','ascend');

%%
NumDays = daysact(RKI_COVID19_DE.Registration{1},RKI_COVID19_DE.Registration{end});
DaysVector = [1: NumDays+1];
datetime.setDefaultFormats('default','yyyy-MM-dd')
t1 = datetime(2020,1,28);
t2 = datetime(2020,3,22);
t = t1:t2;
t = string(t);
for m = 1 : length(DaysVector)
if t{m}(4:6) == 'Jan'
    t{m}(4:6) = '';
    t{m}(4:10) = '01-2020';
elseif t{m}(4:6) == 'Feb'
    t{m}(4:6) = '';
    t{m}(4:10) = '02-2020';
elseif t{m}(4:6) == 'Mar'
    t{m}(4:6) = '';
    t{m}(4:10) = '03-2020';
end
end
writetable(RKI_COVID19_DE,'RKI_COVID19_DE.mat','WriteRowNames',true)
writetable(RKI_COVID19_DE,'RKI_COVID19_DE.csv','WriteRowNames',true)