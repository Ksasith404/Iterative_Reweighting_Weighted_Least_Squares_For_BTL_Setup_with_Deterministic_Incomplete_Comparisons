function R = error_measures_experiment(n, m, k, runs, topk)

algorithms = 2;

R.topk   = zeros(algorithms,1);
R.trueT1 = zeros(algorithms,1);
R.estT1  = zeros(algorithms,1);
R.F      = zeros(algorithms,1);
R.wF     = zeros(algorithms,1);

for iter = 1:runs

    L = createlist(n, m);
    [pi, trank] = scorevector(n);
    P = createBTL(pi);

    % --- ONLY ONE OUTPUT ---
    PHat = Empirical_pref(P, L, k);

    % Construct weights from PHat
    W = double(PHat ~= 0);
    W = (W + W') > 0;   % ensure symmetry
    W = double(W);

    % ---- Algorithms ----
    %r1 = unweighted_hodge_rank(PHat);
    r1 = weighted_hodge_rank(PHat, W);
    %r3 = borda_rank(PHat);
    r2 = Iterative_reweight_WLS(PHat, W);

    ranks = {r1, r2};

    for a = 1:algorithms
        estRank = ranks{a};

        R.topk(a)   = R.topk(a)   + topk_recovery(trank, estRank, topk);
        R.trueT1(a) = R.trueT1(a) + true_rank_of_inferred_top1(trank, estRank);
        R.estT1(a)  = R.estT1(a)  + estimated_rank_of_true_top1(trank, estRank);
        R.F(a)      = R.F(a)      + spearman_footrule(trank, estRank);
        R.wF(a)     = R.wF(a)     + weighted_spearman_footrule(trank, estRank);
    end
end

% Average over runs
R.topk   = R.topk / runs;
R.trueT1 = R.trueT1 / runs;
R.estT1  = R.estT1 / runs;
R.F      = R.F / runs;
R.wF     = R.wF / runs;

end