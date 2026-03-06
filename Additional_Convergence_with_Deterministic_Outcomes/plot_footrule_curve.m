function plot_footrule_curve(n, mVals, k, runs, topk)

algNames = {'WLS','IRWLS (Proposed)'};
A = length(algNames);

Y = zeros(A, length(mVals));

for i = 1:length(mVals)
    R = error_measures_experiment(n, mVals(i), k, runs, topk);
    Y(:,i) = R.F;
end

figure; hold on; grid on;

for a = 1:A
    plot(mVals, Y(a,:), 'LineWidth',2, 'DisplayName', algNames{a});
end

xlabel('Number of comparisons ', 'FontSize', 12,'Interpreter', 'latex');
ylabel('Spearman Footrule','FontSize', 12,'Interpreter', 'latex');
legend('show');
title('Spearman Footrule vs m', 'FontSize', 12,'Interpreter', 'latex');

end