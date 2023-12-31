%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: /Users/rsm/Desktop/proje/Book1.xlsx
%    Worksheet: Sheet1
%
% Auto-generated by MATLAB on 05-Apr-2023 13:50:44

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 2); 

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:B5677";

% Specify column names and types
opts.VariableNames = ["date", "price"];
opts.VariableTypes = ["datetime", "double"];

% Specify variable properties
opts = setvaropts(opts, "date", "InputFormat", "");

% Import the data
tbl = readtable("/Users/rsm/Documents/MATLAB/Examples/R2022A/matlab/ImportandDisplayanImageExample/pr/Book1.xlsx", opts, "UseExcel", false);

%% Convert to output type
date = tbl.date;
price = tbl.price;

%% Clear temporary variables
clear opts tbl

lp = log(price);
ds = lp(2:end)-lp(1:end-1);

%% Graphs
figure; %% figure 1-1 daily prices
plot(date,price)
figure; %% figure 1-2 daily percentage changes 
plot(date(2:end),ds)
figure; %% figure 1-3 histogram of daily percentage change
histogram(ds,132) 
figure; %% figure 1-4 normal dist over histogram
histfit(ds,132,'normal') 
figure; %% figure 1-5 student's t dist over histogram
histfit(ds,132,'tlocationscale') 

%% Summary Statistics
mean_of_daily_percentage_change = mean(ds);
standard_deviation_of_daily_percentage_change = std(ds);
skewness_of_daily_percentage_change = skewness(ds);
kurtosis_of_daily_percentage_change = kurtosis(ds);
sample_size = length(ds);
