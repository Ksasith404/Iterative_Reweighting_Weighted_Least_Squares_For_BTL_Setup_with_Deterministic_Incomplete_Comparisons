function plot_estimated_rank_of_true_top1(n, mVals, k, runs, topk)

algNames = {'WLS','IRWLS (Proposed)'};
A = length(algNames);

Y = zeros(A, length(mVals));

for i = 1:length(mVals)
    R = error_measures_experiment(n, mVals(i), k, runs, topk);
    Y(:,i) = R.estT1;
end

figure; hold on; grid on;

for a = 1:A
    plot(mVals, Y(a,:), 'LineWidth',2, 'DisplayName', algNames{a});
end

xlabel('Number of comparisons m','FontSize', 12,'Interpreter', 'latex');
ylabel('Estimated rank of true top-1','FontSize', 12,'Interpreter', 'latex');
title('Estimated Rank of True Top-1 vs m','FontSize', 12,'Interpreter', 'latex');
legend('show','Location','northeast');

end