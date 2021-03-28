function trapezoidFISInput(lowerbound,a,c,d,b,upperbound,xi)

global mu_input ;
alfa=1;

if xi>=a && xi<=c
    mu_input = alfa*(xi-a)/(c-a);
elseif xi>=c && xi<=d
    mu_input = alfa;
elseif xi>=d && xi<=b 
    mu_input = alfa*(xi-b)/(d-b);
else
    mu_input = 0;
end