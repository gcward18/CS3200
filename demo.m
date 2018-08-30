% HW1 Assignment
% Author: George C. Ward
% Created:August 28 2019
%
% User interface to execute different functions
% cleanup
% create new window for plots
hf=figure;

% Display in command window the contents without the name
disp('Calculating Exponential')

% initialize some require variables
n=1;

% Ensure that all figures are drawn in the same window
hold on

% suppress extra lines
  format compact
% display 5 digits in numbers
  format short

hError    = uimenu(gcf,   'Label','ErrorOfApproximation');
raw       = uimenu(hError,'Label','RawCalculation','callback','demoRaw');
direct    = uimenu(hError,'Label','DirectCalculation','callback','demoDirect');
indirect  = uimenu(hError,'Label','InDirectCalculation','callback','demoInDirect');
both      = uimenu(hError,'Label','Both','callback','cleanup,demoBoth,demo');
reset     = uimenu(hError,'Label','Reset','callback','cleanup, demo');

