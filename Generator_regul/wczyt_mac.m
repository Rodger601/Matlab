function m=wczyt_mac(sciezka)

%% Initialize variables.
filename = sciezka;

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%2s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%s%[^\n\r]';

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
V1 = double.empty;
V2 = double.empty;
V3 = double.empty;
V4 = double.empty;
V5 = double.empty;
V6 = double.empty;
V7 = double.empty;
V8 = double.empty;
V9 = double.empty;
V10 = double.empty;
V11 = double.empty;
V12 = double.empty;
V13 = double.empty;
V14 = double.empty;
V15 = double.empty;
V16 = double.empty;
V17 = double.empty;
V18 = double.empty;
V19 = double.empty;
V20 = double.empty;

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

%%poczatek
m=double.empty;
m=[V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20];  %wczytana_macierz

end