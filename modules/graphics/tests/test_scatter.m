%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% <--ADV-CLI MODE-->
%=============================================================================
f = figure();
x = randn (100, 1);
y = randn (100, 1);
scatter (x, y)
%=============================================================================
f = figure();
theta = linspace(0,1,500);
x = exp(theta).*sin(100*theta);
y = exp(theta).*cos(100*theta);
s = scatter(x,y);
%=============================================================================
f = figure();
theta = linspace(0,1,500);
x = exp(theta).*sin(100*theta);
y = exp(theta).*cos(100*theta);
s = scatter(x,y ,'filled');
%=============================================================================
f = figure();
theta = linspace(0,2*pi,150);
x = sin(theta) + 0.75*rand(1,150);
y = cos(theta) + 0.75*rand(1,150);  
sz = 140;
scatter(x,y,sz,'d')
%=============================================================================
f = figure();
x = randn (100, 1);
y = randn (100, 1);
scatter (x, y, 50)
%=============================================================================
f = figure();
x = linspace(0,3*pi,200);
y = cos(x) + rand(1,200);
sz = 25;
c = 1:length(x);
scatter(x,y,sz,c,'filled')
%=============================================================================
f = figure();
x = linspace(0,3*pi,200);
y = cos(x) + rand(1,200);
c = linspace(1,10,length(x));
scatter(x,y,[],c)
%=============================================================================
f = figure();
theta = linspace(0,2*pi,300);
x = sin(theta) + 0.75*rand(1,300);
y = cos(theta) + 0.75*rand(1,300);  
sz = 40;
scatter(x,y,sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7],  'LineWidth',1.5)
%=============================================================================
f = figure(),
x = linspace(0,3*pi,200);
y = cos(x) + rand(1,200);
% Top plot
ax1 = subplot(2,1, 1);
scatter(ax1,x,y)
% Bottom plot
ax2 = subplot(2,1, 2);
scatter(ax2,x,y,'filled','d')
%=============================================================================
f = figure();
x = rand(50,5);
y = randn(50,5) + (5:5:25);
s = scatter(x,y, 'filled');
assert_isequal(size(s), [1 5]);
%=============================================================================
f = figure();
c = 1:4;
scatter(1:4,[2 5 3 7],[],c)
colormap(gca,'winter')
%=============================================================================
f = figure();
x = randn (100, 1);
y = randn (100, 1);
scatter (x, y, [], sqrt (x.^2 + y.^2));
%=============================================================================
f = figure();
x = [0.777753, 0.093848, 0.183162, 0.399499, 0.337997, 0.686724, 0.073906, 0.651808, 0.869273, 0.137949];
y = [0.37460, 0.25027, 0.19510, 0.51182, 0.54704, 0.56087, 0.24853, 0.75443, 0.42712, 0.44273];
h = scatter (x, y, [], 'r', 's');
%=============================================================================
f = figure();
x = rand(100,1);
y = rand(100,1);
MarkerColor = [0.5, 0.5, 0.5];
scatter(x, y, 40, MarkerColor, 'filled');
%=============================================================================
f = figure
x = 1:5;
s1 = scatter(x,[6 3 9 10 7],100,"filled");
hold on
s2 = scatter(x,[16 13 19 20 17],100,"filled");
s3 = scatter(x,[26 23 29 33 27],100,"filled");
hold off
%=============================================================================
f = figure();
theta = linspace(0,2*pi,150);
x = sin(theta) + 0.75*rand(1,150);
y = cos(theta) + 0.75*rand(1,150);  
sz = 140;
scatter(x,y,sz,'h')
%=============================================================================
f = figure();
theta = linspace(0,2*pi,150);
x = sin(theta) + 0.75*rand(1,150);
y = cos(theta) + 0.75*rand(1,150);  
sz = 140;
scatter(x,y,sz,'p')
%=============================================================================
f = figure();
x = randn (100, 1);
y = randn (100, 1);
assert_checkerror('scatter (x, y, 1:0.5:50)', _('size of S must match X, Y.'))
%=============================================================================
