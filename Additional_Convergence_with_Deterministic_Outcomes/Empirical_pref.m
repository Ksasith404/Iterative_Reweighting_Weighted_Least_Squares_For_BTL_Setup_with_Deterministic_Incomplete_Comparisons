function PHat = Empirical_pref(P_BTL, L, k)

n = size(P_BTL, 1);
m = size(L, 1);

%% Outcomes
outcomes = zeros(m,1);

for t = 1:m
    a = L(t,1);
    b = L(t,2);

    if P_BTL(a,b) >= 0.5
        outcomes(t) = 1;     % a wins
    else
        outcomes(t) = 0;     % b wins
    end
end

%% Incorporating Noise
num_flip = round(m * k);
flip_idx = randperm(m, num_flip);

outcomes_noisy = outcomes;
outcomes_noisy(flip_idx) = 1 - outcomes_noisy(flip_idx);

%% Counting comparisons
N  = zeros(n);
N1 = zeros(n);

for t = 1:m
    a = L(t,1);
    b = L(t,2);

    if outcomes_noisy(t) == 1
        % a wins
        N(a,b)  = N(a,b) + 1;
        N1(a,b) = N1(a,b) + 1;
    else
        % b wins
        N(a,b) = N(a,b) + 1;
    end
end

%% Empirical preference matrix
PHat = zeros(n);

for i = 1:n
    for j = 1:n
        if i == j
            PHat(i,j) = 0;

        elseif i < j
            if N(i,j) > 0
                PHat(i,j) = N1(i,j) / N(i,j);
            else
                PHat(i,j) = 0;
            end

        else % i > j
            if N(j,i) > 0
                PHat(i,j) = 1 - (N1(j,i) / N(j,i));
            else
                PHat(i,j) = 0;
            end
        end
    end
end

%disp("Empirical preference matrix PHat (with noise):");
%disp(round(PHat, 4));

end
