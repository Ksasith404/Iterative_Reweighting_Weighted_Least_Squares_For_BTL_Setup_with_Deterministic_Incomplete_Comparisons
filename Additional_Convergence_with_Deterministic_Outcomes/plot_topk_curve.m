function plot_topk_curve(n, mVals, k, runs, topk)

algNames = {'WLS','IRWLS (Proposed)'};
A = length(algNames);

Y = zeros(A, length(mVals));

for i = 1:length(mVals)
    R = error_measures_experiment(n, mVals(i), k, runs, topk);
    Y(:,i) = R.topk;
end

figure; hold on; grid on;

for a = 1:A
    plot(mVals, Y(a,:), 'LineWidth',2, 'DisplayName', algNames{a});
end

xlabel('Number of comparisons m', 'FontSize', 12,'Interpreter', 'latex');
ylabel(['Top-' num2str(topk) ' Recovery'], 'FontSize', 12,'Interpreter', 'latex');
title(['Top-' num2str(topk) ' Recovery vs m'], 'FontSize', 12,'Interpreter', 'latex');
legend('show','Location','southeast');

end