clc; clear; close all;

n = 40;
runs = 100;
k = 0;          
topk = 20;

maxM = 5*(n*(n-1)/2);
mVals = round(linspace(n, maxM, 25));

plot_estimated_rank_of_true_top1(n, mVals, k, runs, topk);
%plot_true_rank_of_inferred_top1(n, mVals, k, runs, topk);
%plot_topk_curve(n, mVals, k, runs, topk);
%plot_footrule_curve(n, mVals, k, runs, topk);
%plot_weighted_footrule_curve(n, mVals, k, runs, topk);