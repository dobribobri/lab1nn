%------------------------------------------------------------------------
% AL-AZHAR UNIVERSITY
% FACULTY OF ENGINEERING				
% SYSTEMS & COMPUTERS ENGINEERING Department
%------------------------------------------------------------------------
% Author : Ahmed Samieh Abd El-Wahab
% Date   : 14 December 2006
%------------------------------------------------------------------------
% Shapes Classifier
% Step 1: Read image Read in
% Step 2: Convert image from rgb to gray 
% Step 3: Threshold the image
% Step 4: Invert the Binary Image
% Step 5: Find the boundaries Concentrate
% Step 6: Determine Shapes properties
% Step 7: Classify Shapes according to properties
% Square      = 3
% Rectangular = 2
% Circle      = 1
% UNKNOWN     = 0
%------------------------------------------------------------------------

clear all; close all; clc;

% Get path
CurrentFolder = pwd;

nS = 4;
folder = [CurrentFolder '\_img_\' int2str(nS) '-gone\'];
baseFileName = [int2str(nS) '-gone'];
img_number = '2';
fullpath = [folder baseFileName '-' img_number '.png'];

W = classify(fullpath);

% Result
if W == 1
    disp('Circle');
elseif W == 2
    disp('Rectangular');
elseif W == 3
    disp('Square');
else
    disp('UNKNOWN');
end;
