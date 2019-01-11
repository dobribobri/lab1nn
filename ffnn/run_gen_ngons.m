clear all; close all; clc;

% Get path
CurrentFolder = pwd;


% Generate ngon image
number_of_images = 20000;

% Generate set of 3-gons
nS = 100;
type = 'simplified';
speedup = 'yes';
folder = [CurrentFolder '\_img_\' int2str(nS) '-gone-' type '\'];
mkdir_if_not_exist(folder);
baseFileName = [int2str(nS) '-gone'];
gen_set_of_ngons(number_of_images, nS, folder, baseFileName, type, speedup);
% Compress folder with images
zippedfiles = zip([CurrentFolder '\_img_\' int2str(nS) '-gone-' type '.zip'], folder);
% Remove folder with images
rmdir(['_img_/' int2str(nS) '-gone-' type],'s')
