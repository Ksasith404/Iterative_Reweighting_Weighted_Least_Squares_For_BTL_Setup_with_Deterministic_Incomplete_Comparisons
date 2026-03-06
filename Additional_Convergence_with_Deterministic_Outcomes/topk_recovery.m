function val = topk_recovery(trank, estRank, k)

trank   = trank(:);
estRank = estRank(:);

trueTopK = find(trank <= k);
estTopK  = find(estRank <= k);

val = length(intersect(trueTopK, estTopK)) / k;

end