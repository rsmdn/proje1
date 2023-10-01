function f = LogLik(p,y)
T = length(y);
LL = 0;
for t = 1:T
    e = y(t) - p(1);
    L = normpdf(e,0,p(2));
    LL = LL + log(L);
end
f = LL;
