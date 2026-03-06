function val = true_rank_of_inferred_top1(trank, estRank)

trank   = trank(:);
estRank = estRank(:);

[~, inferred_item] = min(estRank);
val = trank(inferred_item);

end