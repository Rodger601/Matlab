clear;
clc;

%% Initialize variables.
filename = 'C:\Users\Ja\Desktop\pk\semestr_VII\SI\matlabow\1\mpogoda.txt';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%1s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%2s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^[-/+]*\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Allocate imported array to column variable names
V1 = double(cell2mat(raw(:, 1)));
V2 = double(cell2mat(raw(:, 2)));
V3 = double(cell2mat(raw(:, 3)));
V4 = double(cell2mat(raw(:, 4)));
V5 = double(cell2mat(raw(:, 5)));
V6 = double(cell2mat(raw(:, 6)));
V7 = double(cell2mat(raw(:, 7)));
V8 = double(cell2mat(raw(:, 8)));
V9 = double(cell2mat(raw(:, 9)));
V10 = double(cell2mat(raw(:, 10)));
V11 = double(cell2mat(raw(:, 11)));
V12 = double(cell2mat(raw(:, 12)));
V13 = double(cell2mat(raw(:, 13)));
V14 = double(cell2mat(raw(:, 14)));
V15 = double(cell2mat(raw(:, 15)));
V16 = double(cell2mat(raw(:, 16)));
V17 = double(cell2mat(raw(:, 17)));
V18 = double(cell2mat(raw(:, 18)));
V19 = double(cell2mat(raw(:, 19)));
V20 = double(cell2mat(raw(:, 20)));


%% Clear temporary variables
clearvars filename formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp;

m=[V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20];  %wczytana_macierz

% prompt = 'Numery atrybutów ';
% x = input(prompt);
x=[1 2];

s= size(m);

k=1;
for i=1:s(2)
    for j=1:length(x)
        if i==x(j)
           mr(1:s(1),k)=m(1:s(1),i); %macierz dl ktorej generowane sa reguly
           k=k+1;
        end
    end
end

mr=[mr, m(:,s(2))];

ms=unique(mr, 'rows'); %macierz skrocona

s1= size(ms);
sms=sortrows(ms,s1(2)); %posoetowane reguly dla kolejnych celow

c=unique(sms(:,s1(2)));%cele

s2= size(sms);

mc1=double.empty(0,s2(2)-1);
mc2=double.empty(0,s2(2)-1);
mc3=double.empty(0,s2(2)-1);
mc4=double.empty(0,s2(2)-1);
mc5=double.empty(0,s2(2)-1);
mc6=double.empty(0,s2(2)-1);
mc7=double.empty(0,s2(2)-1);
mc8=double.empty(0,s2(2)-1);
mc9=double.empty(0,s2(2)-1);
mc10=double.empty(0,s2(2)-1);
mc11=double.empty(0,s2(2)-1);
mc12=double.empty(0,s2(2)-1);
mc13=double.empty(0,s2(2)-1);
mc14=double.empty(0,s2(2)-1);
mc15=double.empty(0,s2(2)-1);
mc16=double.empty(0,s2(2)-1);
mc17=double.empty(0,s2(2)-1);
mc18=double.empty(0,s2(2)-1);
mc19=double.empty(0,s2(2)-1);
mc20=double.empty(0,s2(2)-1);



k=ones(1,20);
for i=1:s2(1)
    for j=1:length(c)
        if sms(i,s2(2))==c(j)
            if j==1
            mc1(k(1),:)=sms(i,1:s2(2)-1); %macierz atrubutow dla celu 1
            k(1)=k(1)+1;
            elseif j==2
            mc2(k(2),:)=sms(i,1:s2(2)-1);
            k(2)=k(2)+1;
            elseif j==3
            mc3(k(3),:)=sms(i,1:s2(2)-1);
            k(3)=k(3)+1;
            elseif j==4
            mc4(k(4),:)=sms(i,1:s2(2)-1);
            k(4)=k(4)+1;
            elseif j==5
            mc5(k(5),:)=sms(i,1:s2(2)-1);
            k(5)=k(5)+1;
            elseif j==6
            mc6(k(6),:)=sms(i,1:s2(2)-1);
            k(6)=k(6)+1;
            elseif j==7
            mc7(k(7),:)=sms(i,1:s2(2)-1);
            k(7)=k(7)+1;
            elseif j==8
            mc8(k(8),:)=sms(i,1:s2(2)-1);
            k(8)=k(8)+1;
            elseif j==9
            mc9(k(9),:)=sms(i,1:s2(2)-1);
            k(9)=k(9)+1;
            elseif j==10
            mc10(k(10),:)=sms(i,1:s2(2)-1);
            k(10)=k(10)+1;
            elseif j==11
            mc11(k(11),:)=sms(i,1:s2(2)-1);
            k(11)=k(11)+1;
            elseif j==12
            mc12(k(12),:)=sms(i,1:s2(2)-1);
            k(12)=k(12)+1;
            elseif j==13
            mc13(k(13),:)=sms(i,1:s2(2)-1);
            k(13)=k(13)+1;
            elseif j==14
            mc14(k(14),:)=sms(i,1:s2(2)-1);
            k(14)=k(14)+1;
            elseif j==15
            mc15(k(15),:)=sms(i,1:s2(2)-1);
            k(15)=k(15)+1;
            elseif j==16
            mc16(k(16),:)=sms(i,1:s2(2)-1);
            k(16)=k(16)+1;
            elseif j==17
            mc17(k(17),:)=sms(i,1:s2(2)-1);
            k(17)=k(17)+1;
            elseif j==18
            mc18(k(18),:)=sms(i,1:s2(2)-1);
            k(18)=k(18)+1;
            elseif j==19
            mc19(k(19),:)=sms(i,1:s2(2)-1);
            k(19)=k(19)+1;
            elseif j==20
            mc20(k(20),:)=sms(i,1:s2(2)-1);
            k(20)=k(20)+1;
            end
        end
    end
end

%% 
rpw1=setdiff(mc1,mc2,'rows'); %te co sa w A a nie ma ich w B setfiff(A,B)
rpw1=setdiff(rpw1,mc3,'rows');
rpw1=setdiff(rpw1,mc4,'rows');
rpw1=setdiff(rpw1,mc5,'rows');
rpw1=setdiff(rpw1,mc6,'rows');
rpw1=setdiff(rpw1,mc7,'rows');
rpw1=setdiff(rpw1,mc8,'rows');
rpw1=setdiff(rpw1,mc9,'rows');
rpw1=setdiff(rpw1,mc10,'rows');
rpw1=setdiff(rpw1,mc11,'rows');
rpw1=setdiff(rpw1,mc12,'rows');
rpw1=setdiff(rpw1,mc13,'rows');
rpw1=setdiff(rpw1,mc14,'rows');
rpw1=setdiff(rpw1,mc15,'rows');
rpw1=setdiff(rpw1,mc16,'rows');
rpw1=setdiff(rpw1,mc17,'rows');
rpw1=setdiff(rpw1,mc18,'rows');
rpw1=setdiff(rpw1,mc19,'rows');
rpw1=setdiff(rpw1,mc20,'rows'); %reguly pewne dla celu1

rpr1=setdiff(mc1,rpw1,'rows'); %reguly przyblizone dla celu1

%%
rpw2=setdiff(mc2,mc1,'rows'); 
rpw2=setdiff(rpw2,mc3,'rows');
rpw2=setdiff(rpw2,mc4,'rows');
rpw2=setdiff(rpw2,mc5,'rows');
rpw2=setdiff(rpw2,mc6,'rows');
rpw2=setdiff(rpw2,mc7,'rows');
rpw2=setdiff(rpw2,mc8,'rows');
rpw2=setdiff(rpw2,mc9,'rows');
rpw2=setdiff(rpw2,mc10,'rows');
rpw2=setdiff(rpw2,mc11,'rows');
rpw2=setdiff(rpw2,mc12,'rows');
rpw2=setdiff(rpw2,mc13,'rows');
rpw2=setdiff(rpw2,mc14,'rows');
rpw2=setdiff(rpw2,mc15,'rows');
rpw2=setdiff(rpw2,mc16,'rows');
rpw2=setdiff(rpw2,mc17,'rows');
rpw2=setdiff(rpw2,mc18,'rows');
rpw2=setdiff(rpw2,mc19,'rows');
rpw2=setdiff(rpw2,mc20,'rows'); 

rpr2=setdiff(mc2,rpw2,'rows');

%%
rpw3=setdiff(mc3,mc1,'rows');
rpw3=setdiff(rpw3,mc2,'rows');
rpw3=setdiff(rpw3,mc4,'rows');
rpw3=setdiff(rpw3,mc5,'rows');
rpw3=setdiff(rpw3,mc6,'rows');
rpw3=setdiff(rpw3,mc7,'rows');
rpw3=setdiff(rpw3,mc8,'rows');
rpw3=setdiff(rpw3,mc9,'rows');
rpw3=setdiff(rpw3,mc10,'rows');
rpw3=setdiff(rpw3,mc11,'rows');
rpw3=setdiff(rpw3,mc12,'rows');
rpw3=setdiff(rpw3,mc13,'rows');
rpw3=setdiff(rpw3,mc14,'rows');
rpw3=setdiff(rpw3,mc15,'rows');
rpw3=setdiff(rpw3,mc16,'rows');
rpw3=setdiff(rpw3,mc17,'rows');
rpw3=setdiff(rpw3,mc18,'rows');
rpw3=setdiff(rpw3,mc19,'rows');
rpw3=setdiff(rpw3,mc20,'rows');

rpr3=setdiff(mc3,rpw3,'rows');
%%
rpw4=setdiff(mc4,mc1,'rows');
rpw4=setdiff(rpw4,mc2,'rows');
rpw4=setdiff(rpw4,mc3,'rows');
rpw4=setdiff(rpw4,mc5,'rows');
rpw4=setdiff(rpw4,mc6,'rows');
rpw4=setdiff(rpw4,mc7,'rows');
rpw4=setdiff(rpw4,mc8,'rows');
rpw4=setdiff(rpw4,mc9,'rows');
rpw4=setdiff(rpw4,mc10,'rows');
rpw4=setdiff(rpw4,mc11,'rows');
rpw4=setdiff(rpw4,mc12,'rows');
rpw4=setdiff(rpw4,mc13,'rows');
rpw4=setdiff(rpw4,mc14,'rows');
rpw4=setdiff(rpw4,mc15,'rows');
rpw4=setdiff(rpw4,mc16,'rows');
rpw4=setdiff(rpw4,mc17,'rows');
rpw4=setdiff(rpw4,mc18,'rows');
rpw4=setdiff(rpw4,mc19,'rows');
rpw4=setdiff(rpw4,mc20,'rows');

rpr4=setdiff(mc4,rpw4,'rows');
%%
rpw5=setdiff(mc5,mc1,'rows');
rpw5=setdiff(rpw5,mc2,'rows');
rpw5=setdiff(rpw5,mc4,'rows');
rpw5=setdiff(rpw5,mc3,'rows');
rpw5=setdiff(rpw5,mc6,'rows');
rpw5=setdiff(rpw5,mc7,'rows');
rpw5=setdiff(rpw5,mc8,'rows');
rpw5=setdiff(rpw5,mc9,'rows');
rpw5=setdiff(rpw5,mc10,'rows');
rpw5=setdiff(rpw5,mc11,'rows');
rpw5=setdiff(rpw5,mc12,'rows');
rpw5=setdiff(rpw5,mc13,'rows');
rpw5=setdiff(rpw5,mc14,'rows');
rpw5=setdiff(rpw5,mc15,'rows');
rpw5=setdiff(rpw5,mc16,'rows');
rpw5=setdiff(rpw5,mc17,'rows');
rpw5=setdiff(rpw5,mc18,'rows');
rpw5=setdiff(rpw5,mc19,'rows');
rpw5=setdiff(rpw5,mc20,'rows');

rpr5=setdiff(mc5,rpw5,'rows');
%%
rpw6=setdiff(mc6,mc1,'rows');
rpw6=setdiff(rpw6,mc2,'rows');
rpw6=setdiff(rpw6,mc4,'rows');
rpw6=setdiff(rpw6,mc5,'rows');
rpw6=setdiff(rpw6,mc3,'rows');
rpw6=setdiff(rpw6,mc7,'rows');
rpw6=setdiff(rpw6,mc8,'rows');
rpw6=setdiff(rpw6,mc9,'rows');
rpw6=setdiff(rpw6,mc10,'rows');
rpw6=setdiff(rpw6,mc11,'rows');
rpw6=setdiff(rpw6,mc12,'rows');
rpw6=setdiff(rpw6,mc13,'rows');
rpw6=setdiff(rpw6,mc14,'rows');
rpw6=setdiff(rpw6,mc15,'rows');
rpw6=setdiff(rpw6,mc16,'rows');
rpw6=setdiff(rpw6,mc17,'rows');
rpw6=setdiff(rpw6,mc18,'rows');
rpw6=setdiff(rpw6,mc19,'rows');
rpw6=setdiff(rpw6,mc20,'rows');

rpr6=setdiff(mc6,rpw6,'rows');
%%
rpw7=setdiff(mc7,mc1,'rows');
rpw7=setdiff(rpw7,mc2,'rows');
rpw7=setdiff(rpw7,mc4,'rows');
rpw7=setdiff(rpw7,mc5,'rows');
rpw7=setdiff(rpw7,mc6,'rows');
rpw7=setdiff(rpw7,mc3,'rows');
rpw7=setdiff(rpw7,mc8,'rows');
rpw7=setdiff(rpw7,mc9,'rows');
rpw7=setdiff(rpw7,mc10,'rows');
rpw7=setdiff(rpw7,mc11,'rows');
rpw7=setdiff(rpw7,mc12,'rows');
rpw7=setdiff(rpw7,mc13,'rows');
rpw7=setdiff(rpw7,mc14,'rows');
rpw7=setdiff(rpw7,mc15,'rows');
rpw7=setdiff(rpw7,mc16,'rows');
rpw7=setdiff(rpw7,mc17,'rows');
rpw7=setdiff(rpw7,mc18,'rows');
rpw7=setdiff(rpw7,mc19,'rows');
rpw7=setdiff(rpw7,mc20,'rows');

rpr7=setdiff(mc7,rpw7,'rows');
%%
rpw8=setdiff(mc8,mc1,'rows');
rpw8=setdiff(rpw8,mc2,'rows');
rpw8=setdiff(rpw8,mc4,'rows');
rpw8=setdiff(rpw8,mc5,'rows');
rpw8=setdiff(rpw8,mc6,'rows');
rpw8=setdiff(rpw8,mc7,'rows');
rpw8=setdiff(rpw8,mc3,'rows');
rpw8=setdiff(rpw8,mc9,'rows');
rpw8=setdiff(rpw8,mc10,'rows');
rpw8=setdiff(rpw8,mc11,'rows');
rpw8=setdiff(rpw8,mc12,'rows');
rpw8=setdiff(rpw8,mc13,'rows');
rpw8=setdiff(rpw8,mc14,'rows');
rpw8=setdiff(rpw8,mc15,'rows');
rpw8=setdiff(rpw8,mc16,'rows');
rpw8=setdiff(rpw8,mc17,'rows');
rpw8=setdiff(rpw8,mc18,'rows');
rpw8=setdiff(rpw8,mc19,'rows');
rpw8=setdiff(rpw8,mc20,'rows');

rpr8=setdiff(mc8,rpw8,'rows');
%%
rpw9=setdiff(mc9,mc1,'rows');
rpw9=setdiff(rpw9,mc2,'rows');
rpw9=setdiff(rpw9,mc4,'rows');
rpw9=setdiff(rpw9,mc5,'rows');
rpw9=setdiff(rpw9,mc6,'rows');
rpw9=setdiff(rpw9,mc7,'rows');
rpw9=setdiff(rpw9,mc8,'rows');
rpw9=setdiff(rpw9,mc3,'rows');
rpw9=setdiff(rpw9,mc10,'rows');
rpw9=setdiff(rpw9,mc11,'rows');
rpw9=setdiff(rpw9,mc12,'rows');
rpw9=setdiff(rpw9,mc13,'rows');
rpw9=setdiff(rpw9,mc14,'rows');
rpw9=setdiff(rpw9,mc15,'rows');
rpw9=setdiff(rpw9,mc16,'rows');
rpw9=setdiff(rpw9,mc17,'rows');
rpw9=setdiff(rpw9,mc18,'rows');
rpw9=setdiff(rpw9,mc19,'rows');
rpw9=setdiff(rpw9,mc20,'rows');

rpr9=setdiff(mc9,rpw9,'rows');
%%
rpw10=setdiff(mc10,mc1,'rows');
rpw10=setdiff(rpw10,mc2,'rows');
rpw10=setdiff(rpw10,mc4,'rows');
rpw10=setdiff(rpw10,mc5,'rows');
rpw10=setdiff(rpw10,mc6,'rows');
rpw10=setdiff(rpw10,mc7,'rows');
rpw10=setdiff(rpw10,mc8,'rows');
rpw10=setdiff(rpw10,mc9,'rows');
rpw10=setdiff(rpw10,mc3,'rows');
rpw10=setdiff(rpw10,mc11,'rows');
rpw10=setdiff(rpw10,mc12,'rows');
rpw10=setdiff(rpw10,mc13,'rows');
rpw10=setdiff(rpw10,mc14,'rows');
rpw10=setdiff(rpw10,mc15,'rows');
rpw10=setdiff(rpw10,mc16,'rows');
rpw10=setdiff(rpw10,mc17,'rows');
rpw10=setdiff(rpw10,mc18,'rows');
rpw10=setdiff(rpw10,mc19,'rows');
rpw10=setdiff(rpw10,mc20,'rows');

rpr10=setdiff(mc10,rpw10,'rows');
%%
rpw11=setdiff(mc11,mc1,'rows');
rpw11=setdiff(rpw11,mc2,'rows');
rpw11=setdiff(rpw11,mc4,'rows');
rpw11=setdiff(rpw11,mc5,'rows');
rpw11=setdiff(rpw11,mc6,'rows');
rpw11=setdiff(rpw11,mc7,'rows');
rpw11=setdiff(rpw11,mc8,'rows');
rpw11=setdiff(rpw11,mc9,'rows');
rpw11=setdiff(rpw11,mc10,'rows');
rpw11=setdiff(rpw11,mc3,'rows');
rpw11=setdiff(rpw11,mc12,'rows');
rpw11=setdiff(rpw11,mc13,'rows');
rpw11=setdiff(rpw11,mc14,'rows');
rpw11=setdiff(rpw11,mc15,'rows');
rpw11=setdiff(rpw11,mc16,'rows');
rpw11=setdiff(rpw11,mc17,'rows');
rpw11=setdiff(rpw11,mc18,'rows');
rpw11=setdiff(rpw11,mc19,'rows');
rpw11=setdiff(rpw11,mc20,'rows');

rpr11=setdiff(mc11,rpw11,'rows');
%%
rpw12=setdiff(mc12,mc1,'rows');
rpw12=setdiff(rpw12,mc2,'rows');
rpw12=setdiff(rpw12,mc4,'rows');
rpw12=setdiff(rpw12,mc5,'rows');
rpw12=setdiff(rpw12,mc6,'rows');
rpw12=setdiff(rpw12,mc7,'rows');
rpw12=setdiff(rpw12,mc8,'rows');
rpw12=setdiff(rpw12,mc9,'rows');
rpw12=setdiff(rpw12,mc10,'rows');
rpw12=setdiff(rpw12,mc11,'rows');
rpw12=setdiff(rpw12,mc3,'rows');
rpw12=setdiff(rpw12,mc13,'rows');
rpw12=setdiff(rpw12,mc14,'rows');
rpw12=setdiff(rpw12,mc15,'rows');
rpw12=setdiff(rpw12,mc16,'rows');
rpw12=setdiff(rpw12,mc17,'rows');
rpw12=setdiff(rpw12,mc18,'rows');
rpw12=setdiff(rpw12,mc19,'rows');
rpw12=setdiff(rpw12,mc20,'rows');

rpr12=setdiff(mc12,rpw12,'rows');
%%
rpw13=setdiff(mc13,mc1,'rows');
rpw13=setdiff(rpw13,mc2,'rows');
rpw13=setdiff(rpw13,mc4,'rows');
rpw13=setdiff(rpw13,mc5,'rows');
rpw13=setdiff(rpw13,mc6,'rows');
rpw13=setdiff(rpw13,mc7,'rows');
rpw13=setdiff(rpw13,mc8,'rows');
rpw13=setdiff(rpw13,mc9,'rows');
rpw13=setdiff(rpw13,mc10,'rows');
rpw13=setdiff(rpw13,mc11,'rows');
rpw13=setdiff(rpw13,mc12,'rows');
rpw13=setdiff(rpw13,mc3,'rows');
rpw13=setdiff(rpw13,mc14,'rows');
rpw13=setdiff(rpw13,mc15,'rows');
rpw13=setdiff(rpw13,mc16,'rows');
rpw13=setdiff(rpw13,mc17,'rows');
rpw13=setdiff(rpw13,mc18,'rows');
rpw13=setdiff(rpw13,mc19,'rows');
rpw13=setdiff(rpw13,mc20,'rows');

rpr13=setdiff(mc13,rpw13,'rows');
%%
rpw14=setdiff(mc14,mc1,'rows');
rpw14=setdiff(rpw14,mc2,'rows');
rpw14=setdiff(rpw14,mc4,'rows');
rpw14=setdiff(rpw14,mc5,'rows');
rpw14=setdiff(rpw14,mc6,'rows');
rpw14=setdiff(rpw14,mc7,'rows');
rpw14=setdiff(rpw14,mc8,'rows');
rpw14=setdiff(rpw14,mc9,'rows');
rpw14=setdiff(rpw14,mc10,'rows');
rpw14=setdiff(rpw14,mc11,'rows');
rpw14=setdiff(rpw14,mc12,'rows');
rpw14=setdiff(rpw14,mc13,'rows');
rpw14=setdiff(rpw14,mc3,'rows');
rpw14=setdiff(rpw14,mc15,'rows');
rpw14=setdiff(rpw14,mc16,'rows');
rpw14=setdiff(rpw14,mc17,'rows');
rpw14=setdiff(rpw14,mc18,'rows');
rpw14=setdiff(rpw14,mc19,'rows');
rpw14=setdiff(rpw14,mc20,'rows');

rpr14=setdiff(mc14,rpw14,'rows');
%%
rpw15=setdiff(mc15,mc1,'rows');
rpw15=setdiff(rpw15,mc2,'rows');
rpw15=setdiff(rpw15,mc4,'rows');
rpw15=setdiff(rpw15,mc5,'rows');
rpw15=setdiff(rpw15,mc6,'rows');
rpw15=setdiff(rpw15,mc7,'rows');
rpw15=setdiff(rpw15,mc8,'rows');
rpw15=setdiff(rpw15,mc9,'rows');
rpw15=setdiff(rpw15,mc10,'rows');
rpw15=setdiff(rpw15,mc11,'rows');
rpw15=setdiff(rpw15,mc12,'rows');
rpw15=setdiff(rpw15,mc13,'rows');
rpw15=setdiff(rpw15,mc14,'rows');
rpw15=setdiff(rpw15,mc3,'rows');
rpw15=setdiff(rpw15,mc16,'rows');
rpw15=setdiff(rpw15,mc17,'rows');
rpw15=setdiff(rpw15,mc18,'rows');
rpw15=setdiff(rpw15,mc19,'rows');
rpw15=setdiff(rpw15,mc20,'rows');

rpr15=setdiff(mc15,rpw15,'rows');
%%
rpw16=setdiff(mc16,mc1,'rows');
rpw16=setdiff(rpw16,mc2,'rows');
rpw16=setdiff(rpw16,mc4,'rows');
rpw16=setdiff(rpw16,mc5,'rows');
rpw16=setdiff(rpw16,mc6,'rows');
rpw16=setdiff(rpw16,mc7,'rows');
rpw16=setdiff(rpw16,mc8,'rows');
rpw16=setdiff(rpw16,mc9,'rows');
rpw16=setdiff(rpw16,mc10,'rows');
rpw16=setdiff(rpw16,mc11,'rows');
rpw16=setdiff(rpw16,mc12,'rows');
rpw16=setdiff(rpw16,mc13,'rows');
rpw16=setdiff(rpw16,mc14,'rows');
rpw16=setdiff(rpw16,mc15,'rows');
rpw16=setdiff(rpw16,mc3,'rows');
rpw16=setdiff(rpw16,mc17,'rows');
rpw16=setdiff(rpw16,mc18,'rows');
rpw16=setdiff(rpw16,mc19,'rows');
rpw16=setdiff(rpw16,mc20,'rows');

rpr16=setdiff(mc16,rpw16,'rows');
%%
rpw17=setdiff(mc17,mc1,'rows');
rpw17=setdiff(rpw17,mc2,'rows');
rpw17=setdiff(rpw17,mc4,'rows');
rpw17=setdiff(rpw17,mc5,'rows');
rpw17=setdiff(rpw17,mc6,'rows');
rpw17=setdiff(rpw17,mc7,'rows');
rpw17=setdiff(rpw17,mc8,'rows');
rpw17=setdiff(rpw17,mc9,'rows');
rpw17=setdiff(rpw17,mc10,'rows');
rpw17=setdiff(rpw17,mc11,'rows');
rpw17=setdiff(rpw17,mc12,'rows');
rpw17=setdiff(rpw17,mc13,'rows');
rpw17=setdiff(rpw17,mc14,'rows');
rpw17=setdiff(rpw17,mc15,'rows');
rpw17=setdiff(rpw17,mc16,'rows');
rpw17=setdiff(rpw17,mc3,'rows');
rpw17=setdiff(rpw17,mc18,'rows');
rpw17=setdiff(rpw17,mc19,'rows');
rpw17=setdiff(rpw17,mc20,'rows');

rpr17=setdiff(mc17,rpw17,'rows');
%%
rpw18=setdiff(mc18,mc1,'rows');
rpw18=setdiff(rpw18,mc2,'rows');
rpw18=setdiff(rpw18,mc4,'rows');
rpw18=setdiff(rpw18,mc5,'rows');
rpw18=setdiff(rpw18,mc6,'rows');
rpw18=setdiff(rpw18,mc7,'rows');
rpw18=setdiff(rpw18,mc8,'rows');
rpw18=setdiff(rpw18,mc9,'rows');
rpw18=setdiff(rpw18,mc10,'rows');
rpw18=setdiff(rpw18,mc11,'rows');
rpw18=setdiff(rpw18,mc12,'rows');
rpw18=setdiff(rpw18,mc13,'rows');
rpw18=setdiff(rpw18,mc14,'rows');
rpw18=setdiff(rpw18,mc15,'rows');
rpw18=setdiff(rpw18,mc16,'rows');
rpw18=setdiff(rpw18,mc17,'rows');
rpw18=setdiff(rpw18,mc3,'rows');
rpw18=setdiff(rpw18,mc19,'rows');
rpw18=setdiff(rpw18,mc20,'rows');

rpr18=setdiff(mc18,rpw18,'rows');
%%
rpw19=setdiff(mc19,mc1,'rows');
rpw19=setdiff(rpw19,mc2,'rows');
rpw19=setdiff(rpw19,mc4,'rows');
rpw19=setdiff(rpw19,mc5,'rows');
rpw19=setdiff(rpw19,mc6,'rows');
rpw19=setdiff(rpw19,mc7,'rows');
rpw19=setdiff(rpw19,mc8,'rows');
rpw19=setdiff(rpw19,mc9,'rows');
rpw19=setdiff(rpw19,mc10,'rows');
rpw19=setdiff(rpw19,mc11,'rows');
rpw19=setdiff(rpw19,mc12,'rows');
rpw19=setdiff(rpw19,mc13,'rows');
rpw19=setdiff(rpw19,mc14,'rows');
rpw19=setdiff(rpw19,mc15,'rows');
rpw19=setdiff(rpw19,mc16,'rows');
rpw19=setdiff(rpw19,mc17,'rows');
rpw19=setdiff(rpw19,mc18,'rows');
rpw19=setdiff(rpw19,mc3,'rows');
rpw19=setdiff(rpw19,mc20,'rows');

rpr19=setdiff(mc19,rpw19,'rows');
%%
rpw20=setdiff(mc20,mc1,'rows');
rpw20=setdiff(rpw20,mc2,'rows');
rpw20=setdiff(rpw20,mc4,'rows');
rpw20=setdiff(rpw20,mc5,'rows');
rpw20=setdiff(rpw20,mc6,'rows');
rpw20=setdiff(rpw20,mc7,'rows');
rpw20=setdiff(rpw20,mc8,'rows');
rpw20=setdiff(rpw20,mc9,'rows');
rpw20=setdiff(rpw20,mc10,'rows');
rpw20=setdiff(rpw20,mc11,'rows');
rpw20=setdiff(rpw20,mc12,'rows');
rpw20=setdiff(rpw20,mc13,'rows');
rpw20=setdiff(rpw20,mc14,'rows');
rpw20=setdiff(rpw20,mc15,'rows');
rpw20=setdiff(rpw20,mc16,'rows');
rpw20=setdiff(rpw20,mc17,'rows');
rpw20=setdiff(rpw20,mc18,'rows');
rpw20=setdiff(rpw20,mc19,'rows');
rpw20=setdiff(rpw20,mc3,'rows');

rpr20=setdiff(mc20,rpw20,'rows');

%%

disp('dla celu 1');
disp('reguly pewne');
disp(rpw1);
disp('reguly przyblizone');
disp(rpr1);


disp('dla celu 2');
disp('reguly pewne');
disp(rpw2);
disp('reguly przyblizone');
disp(rpr2);

disp('dla celu 3');
disp('reguly pewne');
disp(rpw3);
disp('reguly przyblizone');
disp(rpr3);




