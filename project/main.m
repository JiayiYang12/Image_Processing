clear all
clc
close all

addpath(genpath('./'));
data = load('AR2D_data.mat');

setting.tr_pr =11 / 14; % make sure fperc * tr_pr is an interger
setting.dist = 'l2'; % choose from 'l2', 'l1', 'cos'

acc1 = PCA(data, setting);

% acc2 = Fisherface(data, setting);

%acc3 = PCA2D(data, setting);
% Plot results
% x = 5:5:50;
% 
% plot(x, acc1, '-^');
% hold on 
% 
% plot(x, acc2, '-*');
% hold on
% 
% plot(x, acc3, '-o');
% hold off
% 
% legend('2DPCA', 'Fisherface', 'Eigenface');
% 
% 
% set(gca,'XTick',[5:4.5:50]);
% set(gca,'YTick',[0:0.1:1]);
% 
% saveas(gcf, ['AR_', setting.dist, '.jpg'])
 %%




