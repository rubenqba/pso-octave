%
% Copyright (c) 2016, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YTEA101
% Project Title: Particle Swarm Optimization Video Tutorial
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer and Instructor: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

clc;
clear;
close all;

%% Problem Definiton

problem.CostFunction = @(x) Sphere(x);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables
problem.Objective = 0;  % Valor minimo conocido de la función
problem.Error = 1E-10;  % Error admisible

%% Parameters of PSO

params.MaxIt = 1000;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.w = 0.6;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 1.7;              % Personal Acceleration Coefficient
params.c2 = 1.7;              % Social Acceleration Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Informatin

%% Calling PSO

%% Results

f = figure;
% plot(BestCosts, 'LineWidth', 2);
for i=1:9
  t0 = PSO(problem, params);
%  t1 = PSO1(problem, params);
  t2 = PSO2(problem, params);
  
  subplot (3, 3, i)
  semilogy(1:length(t0.BestCosts), t0.BestCosts, '-+r', ...
    %1:length(t1.BestCosts), t1.BestCosts, '-om', ...
    1:length(t2.BestCosts), t2.BestCosts, '-*b');
  xlabel('Iteration');
  ylabel('Best Cost');
  grid on;
%  subplot (3, 3, 3+i)
%  semilogy(test1.BestCosts, 'LineWidth', 2);
%  xlabel('Iteration');
%  ylabel('Best Cost');
%  grid on;
%  subplot (3, 3, 6+i)
%  semilogy(test2.BestCosts, 'LineWidth', 2);
%  xlabel('Iteration');
%  ylabel('Best Cost');
%  grid on;
end

%set(f, 'visible', 'off');
%for i=1:9
%  test = PSO2(problem, params);
%  subplot (3, 3, i);
%  semilogy(test.BestCosts, 'LineWidth', 2);
%  %set(s, 'xgrid', 'on');
%  %set(s, 'ygrid', 'off');
%  xlabel('Iteration');
%  ylabel('Best Cost');
%end

%print(f, 'pso2.eps', '-depsc2')
%%set (f, 'visible', 'on');
%%system ('pdflatex pso1');
%open ('pso2.eps');


