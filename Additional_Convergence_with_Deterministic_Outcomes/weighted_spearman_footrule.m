function val = weighted_spearman_footrule(trank, estRank)

% Force column vectors
trank   = trank(:);
estRank = estRank(:);

% Safety check
if length(trank) ~= length(estRank)
    error('Rank vectors must have same length');
end

weights = 1 ./ trank;

% Force elementwise multiplication safely
diffs = abs(trank - estRank);

val = sum(weights .* diffs);

% Ensure scalar output
val = val(1);

end