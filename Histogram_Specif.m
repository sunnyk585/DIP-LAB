clc; clear; close all;
%%Histogram Specification
%% Demo of Original and Target Histograms
I_OEH = [0,1,2,4,5,7,7,7]; %Original Equalised Histtogram
I_TEH = [0,0,0,0,2,3,6,7]; %OrigEqualisedHist
%% Find the Mappings
NTP = 1; %Pointing Nearest target
LUT = [(0:1:I_OEH(end))',zeros(numel(0:1:I_OEH(end)),1)];
%LUT means Look Up Table
for Row = 1:1:I_OEH(end)+1
while I_OEH(Row) > I_TEH(NTP)
 NTP ~= I_OEH(end) + 1
NTP = NTP + 1;
end
LUT(Row,2) = NTP - 1;
end
Mapping = LUT;