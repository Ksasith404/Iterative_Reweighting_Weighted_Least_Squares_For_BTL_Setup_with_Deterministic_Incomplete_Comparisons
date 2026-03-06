function plot_true_rank_of_inferred_top1(n, mVals, k, runs, topk)

algNames = {'WLS','IRWLS (Proposed)'};
A = length(algNames);

Y = zeros(A, length(mVals));

for i = 1:length(mVals)
    R = error_measures_experiment(n, mVals(i), k, runs, topk);
    Y(:,i) = R.trueT1;
end

figure; hold on; grid on;

for a = 1:A
    plot(mVals, Y(a,:), 'LineWidth',2, 'DisplayName', algNames{a});
end

xlabel('Number of comparisons m', 'FontSize', 12,'Interpreter', 'latex');
ylabel('True rank of inferred top-1','FontSize', 12,'Interpreter', 'latex');
title('True Rank of Inferred Top-1 vs m', 'FontSize', 12, 'Interpreter', 'latex');
legend('show','Location','northeast');

end