function val = spearman_footrule(trank, estRank)

trank   = trank(:);
estRank = estRank(:);

n = length(trank);

% Compute raw footrule distance
F = sum(abs(trank - estRank));

% Maximum possible footrule distance
if mod(n,2) == 0
    Fmax = n^2 / 2;
else
    Fmax = (n^2 - 1) / 2;
end

% Normalized value
val = F / Fmax;

end