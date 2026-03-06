function val = estimated_rank_of_true_top1(trank, estRank)

trank   = trank(:);
estRank = estRank(:);

item = find(trank == 1);
val = estRank(item);

end